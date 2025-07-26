#include "PDE.h"
#include <math.h>
#include <iostream>
#include <immintrin.h>
#include <omp.h>
#ifdef LIKWID_PERFMON
    #include <likwid.h>
#endif

double defaultBoundary(int i, int j, double h_x, double h_y)
{
    return sin(M_PI*i*h_x)*sinh(M_PI*j*h_y);
}

double zeroFunc(int i, int j, double h_x, double h_y)
{
    return 0 + 0*i*h_x + 0*j*h_y;
}

PDE::PDE(int len_x_, int len_y_, int grids_x_, int grids_y_)
    : len_x(len_x_), len_y(len_y_), grids_x(grids_x_+2*HALO), grids_y(grids_y_+2*HALO)
{
    h_x = static_cast<double>(len_x)/(grids_x-1.0);
    h_y = static_cast<double>(len_y)/(grids_y-1.0);

    initFunc = zeroFunc;

    for (int i=0; i<4; ++i)
        boundary[i] = Dirichlet;

    for (int i=0; i<4; ++i)
        boundaryFunc[i] = zeroFunc;
}

int PDE::numGrids_x(bool halo)
{
    int halo_x = halo ? 0:2*HALO;
    return (grids_x-halo_x);
}

int PDE::numGrids_y(bool halo)
{
    int halo_y = halo ? 0:2*HALO;
    return (grids_y-halo_y);
}

void PDE::init(Grid *grid)
{
#ifdef DEBUG
    assert((grid->numGrids_y(true)==grids_y) && (grid->numGrids_x(true)==grids_x));
#endif
    grid->fill(std::bind(initFunc,std::placeholders::_1,std::placeholders::_2,h_x,h_y));
}

void PDE::applyBoundary(Grid *u)
{
#ifdef DEBUG
    assert((u->numGrids_y(true)==grids_y) && (u->numGrids_x(true)==grids_x));
#endif
    if(boundary[NORTH]==Dirichlet){
        u->fillBoundary(std::bind(boundaryFunc[NORTH],std::placeholders::_1,std::placeholders::_2,h_x,h_y),NORTH);
    }
    if(boundary[SOUTH]==Dirichlet){
        u->fillBoundary(std::bind(boundaryFunc[SOUTH],std::placeholders::_1,std::placeholders::_2,h_x,h_y),SOUTH);
    }
    if(boundary[EAST]==Dirichlet){
        u->fillBoundary(std::bind(boundaryFunc[EAST],std::placeholders::_1,std::placeholders::_2,h_x,h_y),EAST);
    }
    if(boundary[WEST]==Dirichlet){
        u->fillBoundary(std::bind(boundaryFunc[WEST],std::placeholders::_1,std::placeholders::_2,h_x,h_y),WEST);
    }
}

void PDE::refreshBoundary(Grid *u)
{
#ifdef DEBUG
    assert((u->numGrids_y(true)==grids_y) && (u->numGrids_x(true)==grids_x));
#endif
    if(boundary[NORTH]==Neumann){
        u->copyToHalo(std::bind(boundaryFunc[NORTH],std::placeholders::_1,std::placeholders::_2,h_x,h_y),NORTH);
    }
    if(boundary[SOUTH]==Neumann){
        u->copyToHalo(std::bind(boundaryFunc[SOUTH],std::placeholders::_1,std::placeholders::_2,h_x,h_y),SOUTH);
    }
    if(boundary[EAST]==Neumann){
        u->copyToHalo(std::bind(boundaryFunc[EAST],std::placeholders::_1,std::placeholders::_2,h_x,h_y),EAST);
    }
    if(boundary[WEST]==Neumann){
        u->copyToHalo(std::bind(boundaryFunc[WEST],std::placeholders::_1,std::placeholders::_2,h_x,h_y),WEST);
    }
}

// AVX-512 optimized applyStencil
// Optimized AVX-512 applyStencil
void PDE::applyStencil(Grid* lhs, Grid* x)
{
    START_TIMER(APPLY_STENCIL);

#ifdef DEBUG
    assert((lhs->numGrids_y(true)==grids_y) && (lhs->numGrids_x(true)==grids_x));
    assert((x->numGrids_y(true)==grids_y) && (x->numGrids_x(true)==grids_x));
#endif
    const int xSize = numGrids_x(true);
    const int ySize = numGrids_y(true);

    const double w_x = 1.0/(h_x*h_x);
    const double w_y = 1.0/(h_y*h_y);
    const double w_c = 2.0*w_x + 2.0*w_y;

    const __m512d vec_w_x = _mm512_set1_pd(w_x);
    const __m512d vec_w_y = _mm512_set1_pd(w_y);
    const __m512d vec_w_c = _mm512_set1_pd(w_c);

#ifdef LIKWID_PERFMON
    LIKWID_MARKER_START("APPLY_STENCIL");
#endif

    // Optimal cache blocking parameters based on performance testing
    // Grid size: 2000x20000, achieved 612.91 MLUP/s CG performance
    const int L3_BLOCK_HEIGHT = 700;  // L3 cache block height
    const int L3_BLOCK_WIDTH  = 144;  // L3 cache block width
    const int L2_BLOCK_HEIGHT = 100;  // L2 cache sub-block height
    const int L2_BLOCK_WIDTH  = 22;   // L2 cache sub-block width

    // L3-level tiling (outermost loops)
    #pragma omp parallel for schedule(static) collapse(2)
    for (int jL3 = 1; jL3 < ySize-1; jL3 += L3_BLOCK_HEIGHT) {
        for (int iL3 = 1; iL3 < xSize-1; iL3 += L3_BLOCK_WIDTH) {
            
            // L3 block boundaries
            const int jL3_max = std::min(jL3 + L3_BLOCK_HEIGHT, ySize-1);
            const int iL3_max = std::min(iL3 + L3_BLOCK_WIDTH, xSize-1);
            
            // L2 sub-blocking within L3 blocks
            for (int jL2 = jL3; jL2 < jL3_max; jL2 += L2_BLOCK_HEIGHT) {
                for (int iL2 = iL3; iL2 < iL3_max; iL2 += L2_BLOCK_WIDTH) {
                    
                    // L2 sub-block boundaries
                    const int jL2_max = std::min(jL2 + L2_BLOCK_HEIGHT, jL3_max);
                    const int iL2_max = std::min(iL2 + L2_BLOCK_WIDTH, iL3_max);
                    
                    // Innermost computation loops (within L2 cache)
                    for (int j = jL2; j < jL2_max; ++j) {
                        int i;
                        
                        // AVX-512 vectorized loop (8 doubles at a time)
                        for (i = iL2; i <= iL2_max-8; i += 8) {
                            // Load 8 consecutive values
                            __m512d x_center = _mm512_loadu_pd(&(*x)(j, i));
                            __m512d x_north  = _mm512_loadu_pd(&(*x)(j-1, i));
                            __m512d x_south  = _mm512_loadu_pd(&(*x)(j+1, i));
                            __m512d x_west   = _mm512_loadu_pd(&(*x)(j, i-1));
                            __m512d x_east   = _mm512_loadu_pd(&(*x)(j, i+1));
                            
                            // Compute stencil with fused multiply-add
                            __m512d temp1 = _mm512_add_pd(x_north, x_south);
                            __m512d temp2 = _mm512_add_pd(x_west, x_east);
                            __m512d temp3 = _mm512_fmadd_pd(vec_w_y, temp1, 
                                                           _mm512_mul_pd(vec_w_x, temp2));
                            __m512d result = _mm512_fmsub_pd(vec_w_c, x_center, temp3);
                            
                            // Store result
                            _mm512_storeu_pd(&(*lhs)(j, i), result);
                        }
                        
                        // Scalar remainder loop
                        for (; i < iL2_max; ++i) {
                            (*lhs)(j, i) = w_c * (*x)(j, i)
                                         - w_y * ((*x)(j+1, i) + (*x)(j-1, i))
                                         - w_x * ((*x)(j, i+1) + (*x)(j, i-1));
                        }
                    }
                }
            }
        }
    }

#ifdef LIKWID_PERFMON
    LIKWID_MARKER_STOP("APPLY_STENCIL");
#endif

    STOP_TIMER(APPLY_STENCIL);
}

// Gauss-Seidel preconditioner
void PDE::GSPreCon(Grid* rhs, Grid *x)
{
    START_TIMER(GS_PRE_CON);

#ifdef DEBUG
    assert((rhs->numGrids_y(true)==grids_y) && (rhs->numGrids_x(true)==grids_x));
    assert((x->numGrids_y(true)==grids_y) && (x->numGrids_x(true)==grids_x));
#endif
    const int xSize = x->numGrids_x(true);
    const int ySize = x->numGrids_y(true);

    const double w_x = 1.0/(h_x*h_x);
    const double w_y = 1.0/(h_y*h_y);
    const double w_c = 1.0/(2.0*w_x + 2.0*w_y);

#ifdef LIKWID_PERFMON
    LIKWID_MARKER_START("GS_PRE_CON");
#endif

<<<<<<< HEAD
    // Forward substitution
    for (int j=1; j<ySize-1; ++j) {
        for (int i=1; i<xSize-1; ++i) {
            (*x)(j,i) = w_c*((*rhs)(j,i) + (w_y*(*x)(j-1,i) + w_x*(*x)(j,i-1)));
        }
    }
    // Backward substitution
    for (int j=ySize-2; j>0; --j) {
        for (int i=xSize-2; i>0; --i) {
            (*x)(j,i) = (*x)(j,i) + w_c*(w_y*(*x)(j+1,i) + w_x*(*x)(j,i+1));
=======
    // Red-Black Gauss-Seidel: Two phases for optimal vectorization
    for (int color = 0; color < 2; ++color) {
        #pragma omp parallel for schedule(static) num_threads(18) // Also implicit barrier
        for (int j = 1; j < ySize-1; ++j) {
            // Calculate starting point for this color
            int i_start = 1 + (j + color) % 2;
            
            // Process 8 elements at a time (stride 2 for checkerboard)
            int i;
            for (i = i_start; i <= xSize-1-16; i += 16) {
                // Load 8 elements with stride 2 (every other element)
                __m512d rhs_vec = _mm512_set_pd(
                    (*rhs)(j, i+14), (*rhs)(j, i+12), (*rhs)(j, i+10), (*rhs)(j, i+8),
                    (*rhs)(j, i+6), (*rhs)(j, i+4), (*rhs)(j, i+2), (*rhs)(j, i)
                );
                
                // Load neighbor values
                __m512d x_north = _mm512_set_pd(
                    (*x)(j-1, i+14), (*x)(j-1, i+12), (*x)(j-1, i+10), (*x)(j-1, i+8),
                    (*x)(j-1, i+6), (*x)(j-1, i+4), (*x)(j-1, i+2), (*x)(j-1, i)
                );
                
                __m512d x_south = _mm512_set_pd(
                    (*x)(j+1, i+14), (*x)(j+1, i+12), (*x)(j+1, i+10), (*x)(j+1, i+8),
                    (*x)(j+1, i+6), (*x)(j+1, i+4), (*x)(j+1, i+2), (*x)(j+1, i)
                );
                
                __m512d x_west = _mm512_set_pd(
                    (*x)(j, i+13), (*x)(j, i+11), (*x)(j, i+9), (*x)(j, i+7),
                    (*x)(j, i+5), (*x)(j, i+3), (*x)(j, i+1), (*x)(j, i-1)
                );
                
                __m512d x_east = _mm512_set_pd(
                    (*x)(j, i+15), (*x)(j, i+13), (*x)(j, i+11), (*x)(j, i+9),
                    (*x)(j, i+7), (*x)(j, i+5), (*x)(j, i+3), (*x)(j, i+1)
                );
                
                // Vectorized computation: w_c*(rhs + w_y*(north+south) + w_x*(west+east))
                __m512d temp1 = _mm512_add_pd(x_north, x_south);
                __m512d temp2 = _mm512_add_pd(x_west, x_east);
                __m512d temp3 = _mm512_fmadd_pd(vec_w_y, temp1, rhs_vec);
                __m512d temp4 = _mm512_fmadd_pd(vec_w_x, temp2, temp3);
                __m512d result = _mm512_mul_pd(vec_w_c, temp4);
                
                // Store results back with stride 2
                double result_array[8];
                _mm512_storeu_pd(result_array, result);
                
                for (int k = 0; k < 8; ++k) {
                    (*x)(j, i + k*2) = result_array[k];
                }
            }
            
            // Handle remaining elements scalar
            for (; i < xSize-1; i += 2) {
                (*x)(j,i) = w_c*((*rhs)(j,i) + w_y*((*x)(j-1,i) + (*x)(j+1,i)) + w_x*((*x)(j,i-1) + (*x)(j,i+1)));
            }
>>>>>>> 40e1d68 (AVX512, Red-Black Gauss-seidel (PreCon), NUMA threading, cache blocking (applystencil))
        }
    }

#ifdef LIKWID_PERFMON
    LIKWID_MARKER_STOP("GS_PRE_CON");
#endif

    STOP_TIMER(GS_PRE_CON);
}

// Solver dispatcher
int PDE::solve(Grid *x, Grid *b, Solver type, int niter, double tol)
{
    SolverClass solver(this, x, b);
    if(type==CG)
    {
        return solver.CG(niter, tol);
    }
    else if(type==PCG)
    {
        return solver.PCG(niter, tol);
    }
    else
    {
        printf("Solver not existing\n");
        return -1;
    }
}

// NEW: Scalar applyStencilAt used in fused kernels
double PDE::applyStencilAt(int idx, Grid* g)
{
    int nx = numGrids_x(true);  // includes halo
    int ny = numGrids_y(true);

    int i = idx % nx;
    int j = idx / nx;

    auto& u = g->data();

    // Return 0 if outside bounds (halo or invalid)
    if (i <= 0 || i >= nx - 1 || j <= 0 || j >= ny - 1)
        return 0.0;

    int idx_center = j * nx + i;
    int idx_left   = j * nx + (i - 1);
    int idx_right  = j * nx + (i + 1);
    int idx_up     = (j - 1) * nx + i;
    int idx_down   = (j + 1) * nx + i;

    double w_x = 1.0 / (h_x * h_x);
    double w_y = 1.0 / (h_y * h_y);
    double w_c = 2.0 * w_x + 2.0 * w_y;

    return w_c * u[idx_center]
         - w_x * (u[idx_left] + u[idx_right])
         - w_y * (u[idx_up] + u[idx_down]);
}
