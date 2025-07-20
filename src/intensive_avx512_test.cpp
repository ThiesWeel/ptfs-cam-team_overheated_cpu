#include "PDE.h"
#include "Grid.h"
#include <chrono>
#include <iostream>
#include <iomanip>

using namespace std;
using namespace chrono;

double measureGSPreConPerformance(PDE& pde, Grid& rhs, Grid& x, int iterations) {
    auto start = high_resolution_clock::now();
    
    for (int i = 0; i < iterations; ++i) {
        pde.GSPreCon(&rhs, &x);
    }
    
    auto end = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(end - start);
    return duration.count() / 1000.0; // Convert to milliseconds
}

double measureApplyStencilPerformance(PDE& pde, Grid& lhs, Grid& x, int iterations) {
    auto start = high_resolution_clock::now();
    
    for (int i = 0; i < iterations; ++i) {
        pde.applyStencil(&lhs, &x);
    }
    
    auto end = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(end - start);
    return duration.count() / 1000.0; // Convert to milliseconds
}

int main() {
    cout << "===================================================================\n";
    cout << "         INTENSIVE AVX-512 PERFORMANCE BENCHMARK\n";
    cout << "===================================================================\n";
    
    // Test different grid sizes
    vector<pair<int, int>> grid_sizes = {
        {199, 10},    // Original test case
        {500, 50},    // Medium grid
        {1000, 100},  // Large grid  
        {2000, 200}   // Extra large grid
    };
    
    const int iterations = 1000; // Many iterations for better measurement
    
    cout << "Testing " << iterations << " iterations per test case\n";
    cout << "Grid sizes: Small -> Medium -> Large -> Extra Large\n\n";
    
    for (auto& size : grid_sizes) {
        int nx = size.first;
        int ny = size.second;
        int total_points = nx * ny;
        
        cout << "=== Grid: " << nx << "x" << ny << " (" << total_points << " points) ===\n";
        
        // Setup
        PDE pde(10.0, 5.0, nx, ny);
        Grid x(pde.numGrids_x(), pde.numGrids_y());
        Grid rhs(pde.numGrids_x(), pde.numGrids_y());
        Grid lhs(pde.numGrids_x(), pde.numGrids_y());
        
        // Initialize with some data
        x.fill([](int i, int j) { 
            return sin(0.1 * i) * cos(0.1 * j); 
        });
        rhs.fill([](int i, int j) { 
            return 0.1 * (i + j); 
        });
        
        // Measure GSPreCon performance
        double gs_time = measureGSPreConPerformance(pde, rhs, x, iterations);
        double gs_time_per_iter = gs_time / iterations;
        double gs_points_per_sec = (total_points * iterations) / (gs_time / 1000.0);
        
        // Measure ApplyStencil performance  
        double stencil_time = measureApplyStencilPerformance(pde, lhs, x, iterations);
        double stencil_time_per_iter = stencil_time / iterations;
        double stencil_points_per_sec = (total_points * iterations) / (stencil_time / 1000.0);
        
        cout << "GSPreCon (AVX-512 Red-Black Gauss-Seidel):\n";
        cout << "  Total time:     " << fixed << setprecision(2) << gs_time << " ms\n";
        cout << "  Time/iteration: " << fixed << setprecision(3) << gs_time_per_iter << " ms\n";
        cout << "  Performance:    " << scientific << setprecision(2) << gs_points_per_sec << " points/sec\n\n";
        
        cout << "ApplyStencil (AVX-512 5-point stencil):\n";
        cout << "  Total time:     " << fixed << setprecision(2) << stencil_time << " ms\n";
        cout << "  Time/iteration: " << fixed << setprecision(3) << stencil_time_per_iter << " ms\n";
        cout << "  Performance:    " << scientific << setprecision(2) << stencil_points_per_sec << " points/sec\n\n";
        
        // Calculate theoretical FLOPs
        double gs_flops_per_point = 8.0; // Approximate FLOPs for GS update
        double stencil_flops_per_point = 7.0; // 5 adds/subs + 2 multiplies
        
        double gs_gflops = (gs_flops_per_point * total_points * iterations) / (gs_time / 1000.0) / 1e9;
        double stencil_gflops = (stencil_flops_per_point * total_points * iterations) / (stencil_time / 1000.0) / 1e9;
        
        cout << "Estimated GFLOP/s:\n";
        cout << "  GSPreCon:    " << fixed << setprecision(1) << gs_gflops << " GFLOP/s\n";
        cout << "  ApplyStencil: " << fixed << setprecision(1) << stencil_gflops << " GFLOP/s\n";
        cout << "-------------------------------------------------------------------\n\n";
    }
    
    cout << "===================================================================\n";
    cout << "Note: Performance should scale with grid size if AVX-512 is working\n";
    cout << "Expected: 4-8x speedup from vectorization on large grids\n";
    cout << "===================================================================\n";
    
    return 0;
}
