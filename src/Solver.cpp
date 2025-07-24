#include "Solver.h"
#include "Grid.h"
#include <omp.h>
#include <cmath>

#define IS_VALID(a) (!(std::isnan(a) || std::isinf(a)))

// Helper: Fused residual computation r = b - A*x
void computeResidual(Grid* r, Grid* x, Grid* b, PDE* pde)
{
    #pragma omp parallel for
    for (int i = 0; i < r->size(); ++i)
    {
        double Ax_i = pde->applyStencilAt(i, x); // You must implement this
        r->data()[i] = b->data()[i] - Ax_i;
    }
}

// Helper: Fused applyStencil and dotProduct(v, p)
double applyStencilDotProduct(Grid* v, Grid* in, Grid* p, PDE* pde)
{
    double dot = 0.0;
    #pragma omp parallel for reduction(+:dot)
    for (int i = 0; i < v->size(); ++i)
    {
        double val = pde->applyStencilAt(i, in); // You must implement this
        v->data()[i] = val;
        dot += val * p->data()[i];
    }
    return dot;
}

SolverClass::SolverClass(PDE *pde_, Grid *x_, Grid *b_) : pde(pde_), x(x_), b(b_) {}

int SolverClass::CG(int niter, double tol)
{
    Grid *p = new Grid(pde->numGrids_x(), pde->numGrids_y());
    Grid *v = new Grid(pde->numGrids_x(), pde->numGrids_y());

    int iter = 0;
    double lambda = 0;
    double alpha_0 = 0, alpha_1 = 0;

    // Initial residual: p = b - A*x
    computeResidual(p, x, b, pde);
    alpha_0 = dotProduct(p, p);

    Grid *r = new Grid(*p);

    START_TIMER(CG);

    while ((iter < niter) && (alpha_0 > tol * tol) && IS_VALID(alpha_0))
    {
        double denom = applyStencilDotProduct(v, p, p, pde);  // fused applyStencil and dotProduct
        lambda = alpha_0 / denom;

        // Update x and r
        #pragma omp parallel for
        for (int i = 0; i < x->size(); ++i)
        {
            x->data()[i] += lambda * p->data()[i];
            r->data()[i] -= lambda * v->data()[i];
        }

        // Compute alpha_1 = dot(r, r)
        double alpha_1_local = 0.0;
        #pragma omp parallel for reduction(+:alpha_1_local)
        for (int i = 0; i < r->size(); ++i)
            alpha_1_local += r->data()[i] * r->data()[i];
        alpha_1 = alpha_1_local;

        // Update p
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

    if (!IS_VALID(alpha_0))
    {
        printf("\x1B[31mWARNING: NaN/INF detected after iteration %d\x1B[0m\n", iter);
    }

    delete p;
    delete v;
    delete r;

    return iter;
}

int SolverClass::PCG(int niter, double tol)
{
    Grid *r = new Grid(pde->numGrids_x(), pde->numGrids_y());
    Grid *z = new Grid(pde->numGrids_x(), pde->numGrids_y());
    Grid *v = new Grid(pde->numGrids_x(), pde->numGrids_y());

    int iter = 0;
    double lambda = 0;
    double alpha_0 = 0, alpha_1 = 0;
    double res_norm_sq = 0;

    // r = b - A*x
    computeResidual(r, x, b, pde);
    res_norm_sq = dotProduct(r, r);

    pde->GSPreCon(r, z);           // Preconditioner z = P * r
    alpha_0 = dotProduct(r, z);
    Grid *p = new Grid(*z);        // p = z

    START_TIMER(PCG);

    while ((iter < niter) && (res_norm_sq > tol * tol) && IS_VALID(res_norm_sq))
    {
        double denom = applyStencilDotProduct(v, p, p, pde);  // fused applyStencil + dotProduct
        lambda = alpha_0 / denom;

        // Update x and r
        #pragma omp parallel for
        for (int i = 0; i < x->size(); ++i)
        {
            x->data()[i] += lambda * p->data()[i];
            r->data()[i] -= lambda * v->data()[i];
        }

        // Update residual norm
        double res_norm_sq_local = 0.0;
        #pragma omp parallel for reduction(+:res_norm_sq_local)
        for (int i = 0; i < r->size(); ++i)
            res_norm_sq_local += r->data()[i] * r->data()[i];
        res_norm_sq = res_norm_sq_local;

        pde->GSPreCon(r, z); // Preconditioner again

        // alpha_1 = dot(r, z)
        double alpha_1_local = 0.0;
        #pragma omp parallel for reduction(+:alpha_1_local)
        for (int i = 0; i < r->size(); ++i)
            alpha_1_local += r->data()[i] * z->data()[i];
        alpha_1 = alpha_1_local;

        // Update p
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

    if (!IS_VALID(res_norm_sq))
    {
        printf("\x1B[31mWARNING: NaN/INF detected after iteration %d\x1B[0m\n", iter);
    }

    delete r;
    delete z;
    delete v;
    delete p;

    return iter;
}
