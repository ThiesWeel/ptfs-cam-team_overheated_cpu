#include "Solver.h"
#include "Grid.h"
#include <omp.h>
#include <cmath>

#define IS_VALID(a) (!(std::isnan(a) || std::isinf(a)))

SolverClass::SolverClass(PDE *pde_, Grid *x_, Grid *b_) : pde(pde_), x(x_), b(b_) {}

int SolverClass::CG(int niter, double tol)
{
    Grid *p = new Grid(pde->numGrids_x(), pde->numGrids_y());
    Grid *v = new Grid(pde->numGrids_x(), pde->numGrids_y());

    int iter = 0;
    double lambda = 0;
    double alpha_0 = 0, alpha_1 = 0;

    // Calculate residual p = b - A*x (fused to avoid repeated loops)
    pde->applyStencil(p,x);
    axpby(p,1,b,-1,p);
    alpha_0 = dotProduct(p,p);

    Grid *r = new Grid(*p);

    START_TIMER(CG);

    while( (iter<niter) && (alpha_0>tol*tol) && (IS_VALID(alpha_0)) )
    {
        pde->applyStencil(v,p);

        // Parallelized dot product v^T * p
        double denom = 0.0;
        #pragma omp parallel for reduction(+:denom)
        for (int i = 0; i < v->size(); ++i) denom += v->data()[i] * p->data()[i];
        lambda = alpha_0 / denom;

        // Parallel axpby for x and r updates
        #pragma omp parallel for
        for (int i = 0; i < x->size(); ++i)
        {
            x->data()[i] += lambda * p->data()[i];
            r->data()[i]    -= lambda * v->data()[i];
        }

        // Compute alpha_1 = dotProduct(r,r) in parallel
        double alpha_1_local = 0.0;
        #pragma omp parallel for reduction(+:alpha_1_local)
        for (int i = 0; i < r->size(); ++i) alpha_1_local += r->data()[i]*r->data()[i];
        alpha_1 = alpha_1_local;

        // Update p: p = r + (alpha_1/alpha_0)*p parallel
        double ratio = alpha_1 / alpha_0;
        #pragma omp parallel for
        for (int i = 0; i < p->size(); ++i)
            p->data()[i] = r->data()[i] + ratio * p->data()[i];

        alpha_0 = alpha_1;

#ifdef DEBUG
        printf("iter = %d, res = %.15e\n", iter, alpha_0);
#endif
        ++iter;
    }

    STOP_TIMER(CG);

    if( !IS_VALID(alpha_0) ){
        printf("\x1B[31mWARNING: NaN/INF detected after iteration %d\x1B[0m\n", iter);
    }

    delete p;
    delete v;
    delete r;

    return (iter);
}

int SolverClass::PCG(int niter, double tol)
{
    Grid* r = new Grid(pde->numGrids_x(), pde->numGrids_y());
    Grid* z = new Grid(pde->numGrids_x(), pde->numGrids_y());
    Grid* v = new Grid(pde->numGrids_x(), pde->numGrids_y());

    int iter = 0;
    double lambda = 0;
    double alpha_0 = 0, alpha_1 = 0;
    double res_norm_sq = 0;

    pde->applyStencil(r,x);
    axpby(r,1,b,-1,r);
    res_norm_sq = dotProduct(r,r);

    pde->GSPreCon(r,z);

    alpha_0 = dotProduct(r,z);
    Grid* p = new Grid(*z);

    START_TIMER(PCG);

    while( (iter<niter) && (res_norm_sq>tol*tol) && (IS_VALID(res_norm_sq)) )
    {
        pde->applyStencil(v,p);

        // Parallel dotProduct(v,p)
        double denom = 0.0;
        #pragma omp parallel for reduction(+:denom)
        for (int i = 0; i < v->size(); ++i) denom += v->data()[i] * p->data()[i];
        lambda =  alpha_0 / denom;

        // Parallel axpby for x and r updates
        #pragma omp parallel for
        for (int i = 0; i < x->size(); ++i)
        {
            x->data()[i] += lambda * p->data()[i];
            r->data()[i] -= lambda * v->data()[i];
        }

        // Compute residual norm squared in parallel
        double res_norm_sq_local = 0.0;
        #pragma omp parallel for reduction(+:res_norm_sq_local)
        for (int i = 0; i < r->size(); ++i) res_norm_sq_local += r->data()[i]*r->data()[i];
        res_norm_sq = res_norm_sq_local;

        // Update z with GS preconditioner (serial or parallel depends on implementation)
        pde->GSPreCon(r, z);

        // Parallel dotProduct(r,z)
        double alpha_1_local = 0.0;
        #pragma omp parallel for reduction(+:alpha_1_local)
        for (int i = 0; i < r->size(); ++i) alpha_1_local += r->data()[i]*z->data()[i];
        alpha_1 = alpha_1_local;

        // Update p: p = z + (alpha_1/alpha_0)*p parallel
        double ratio = alpha_1 / alpha_0;
        #pragma omp parallel for
        for (int i = 0; i < p->size(); ++i)
            p->data()[i] = z->data()[i] + ratio * p->data()[i];

        alpha_0 = alpha_1;

#ifdef DEBUG
        printf("iter = %d, res = %.15e\n", iter, res_norm_sq);
#endif
        ++iter;
    }

    STOP_TIMER(PCG);

    if( !IS_VALID(res_norm_sq) ){
        printf("\x1B[31mWARNING: NaN/INF detected after iteration %d\x1B[0m\n", iter);
    }

    delete r;
    delete z;
    delete v;
    delete p;

    return (iter);
}
