#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <cmath>
#include <iomanip>
#include <chrono>
#include <omp.h>
#include "../include/Grid.h"
#include "../include/PDE.h"
#include "../include/types.h"

// Function to load a CSV file into a Grid object
bool loadCSVToGrid(const std::string& filename, Grid& grid) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error: Could not open file " << filename << std::endl;
        return false;
    }
    
    std::string line;
    int row = 0;
    
    while (std::getline(file, line) && row < grid.numGrids_y(true)) {
        std::stringstream ss(line);
        std::string cell;
        int col = 0;
        
        while (std::getline(ss, cell, ',') && col < grid.numGrids_x(true)) {
            try {
                double value = std::stod(cell);
                grid(row, col) = value;
            } catch (const std::exception& e) {
                std::cerr << "Error parsing value at row " << row << ", col " << col 
                          << ": " << cell << std::endl;
                return false;
            }
            col++;
        }
        row++;
    }
    
    file.close();
    return true;
}

// Function to compute the L2 norm of a grid
double computeL2Norm(const Grid& grid) {
    double norm = 0.0;
    const int inner_x = grid.numGrids_x(false);
    const int inner_y = grid.numGrids_y(false);
    
    #pragma omp parallel for reduction(+:norm) collapse(2) num_threads(8)
    for (int i = 0; i < inner_y; i++) {
        for (int j = 0; j < inner_x; j++) {
            double val = grid(i+1, j+1);
            norm += val * val;
        }
    }
    return std::sqrt(norm);
}

// Function to compute the residual norm for convergence check
double computeResidualNorm(PDE& pde, Grid& x, Grid& b) {
    Grid residual(x.numGrids_x(false), x.numGrids_y(false));
    
    // Compute residual: r = b - A*x
    pde.applyStencil(&residual, &x);
    
    double norm = 0.0;
    const int inner_x = residual.numGrids_x(false);
    const int inner_y = residual.numGrids_y(false);
    
    #pragma omp parallel for reduction(+:norm) collapse(2) num_threads(8)
    for (int i = 0; i < inner_y; i++) {
        for (int j = 0; j < inner_x; j++) {
            double r = b(i+1, j+1) - residual(i+1, j+1);
            norm += r * r;
        }
    }
    
    return std::sqrt(norm);
}

// Performance benchmark function
void benchmarkGSPreCon(PDE& pde, Grid& x_init, Grid& rhs_init, int num_iterations = 100) {
    std::cout << "\n=== Performance Benchmark ===" << std::endl;
    
    // Test with different thread counts
    std::vector<int> thread_counts = {1, 2, 4, 8};
    double base_time = 0.0;
    
    for (int threads : thread_counts) {
        omp_set_num_threads(threads);
        
        // Create local copies to avoid memory issues
        Grid x_test(x_init.numGrids_x(false), x_init.numGrids_y(false));
        Grid rhs_test(rhs_init.numGrids_x(false), rhs_init.numGrids_y(false));
        
        // Copy data
        for (int i = 0; i < x_init.numGrids_y(true); i++) {
            for (int j = 0; j < x_init.numGrids_x(true); j++) {
                x_test(i, j) = x_init(i, j);
                rhs_test(i, j) = rhs_init(i, j);
            }
        }
        
        // Warm-up
        for (int i = 0; i < 5; i++) {
            pde.GSPreCon(&rhs_test, &x_test);
        }
        
        // Reset for timing
        for (int i = 0; i < x_init.numGrids_y(true); i++) {
            for (int j = 0; j < x_init.numGrids_x(true); j++) {
                x_test(i, j) = x_init(i, j);
            }
        }
        
        // Time the GSPreCon function
        auto start = std::chrono::high_resolution_clock::now();
        
        for (int i = 0; i < num_iterations; i++) {
            pde.GSPreCon(&rhs_test, &x_test);
        }
        
        auto end = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
        
        double time_per_iteration = duration.count() / (double)num_iterations;
        
        std::cout << "Threads: " << threads 
                  << " | Time/iter: " << std::fixed << std::setprecision(2) 
                  << time_per_iteration << " μs"
                  << " | Total time: " << duration.count() / 1000.0 << " ms";
        
        if (threads == 1) {
            base_time = time_per_iteration;
            std::cout << std::endl;
        } else {
            double speedup_actual = base_time / time_per_iteration;
            std::cout << " | Speedup: " << std::fixed << std::setprecision(2) 
                      << speedup_actual << "x" << std::endl;
        }
    }
}

// Function to test GSPreCon convergence with performance monitoring
bool testGSPreConConvergence(PDE& pde, Grid& x_init, Grid& rhs_init, 
                           int max_iterations = 1000, double tolerance = 1e-10) {
    
    std::cout << "\n=== Parallel GSPreCon Convergence Test ===" << std::endl;
    
    // Set to use 8 threads for optimal performance
    omp_set_num_threads(8);
    
    // Create copies for testing with proper memory management
    Grid x_test(x_init.numGrids_x(false), x_init.numGrids_y(false));
    Grid rhs_test(rhs_init.numGrids_x(false), rhs_init.numGrids_y(false));
    
    // Copy data manually to avoid memory issues
    for (int i = 0; i < x_init.numGrids_y(true); i++) {
        for (int j = 0; j < x_init.numGrids_x(true); j++) {
            x_test(i, j) = x_init(i, j);
            rhs_test(i, j) = rhs_init(i, j);
        }
    }
    
    // Initial residual
    auto start_total = std::chrono::high_resolution_clock::now();
    double initial_residual = computeResidualNorm(pde, x_test, rhs_test);
    std::cout << "Initial residual norm: " << std::scientific << initial_residual << std::endl;
    
    // Store initial solution norm for comparison
    double initial_sol_norm = computeL2Norm(x_test);
    std::cout << "Initial solution norm: " << std::scientific << initial_sol_norm << std::endl;
    std::cout << "Using " << omp_get_max_threads() << " threads" << std::endl;
    
    // Apply GSPreCon iterations and monitor convergence
    std::cout << "\nIteration | Residual Norm | Solution Norm | Time (μs) | Relative Change" << std::endl;
    std::cout << "----------|---------------|---------------|-----------|----------------" << std::endl;
    
    double prev_residual = initial_residual;
    double prev_sol_norm = initial_sol_norm;
    bool converged = false;
    
    for (int iter = 1; iter <= max_iterations; iter++) {
        // Time each iteration
        auto start_iter = std::chrono::high_resolution_clock::now();
        
        // Apply one GSPreCon iteration
        pde.GSPreCon(&rhs_test, &x_test);
        
        auto end_iter = std::chrono::high_resolution_clock::now();
        auto iter_duration = std::chrono::duration_cast<std::chrono::microseconds>(end_iter - start_iter);
        
        // Compute current residual and solution norm
        double current_residual = computeResidualNorm(pde, x_test, rhs_test);
        double current_sol_norm = computeL2Norm(x_test);
        
        // Compute relative change in solution
        double relative_change = std::abs(current_sol_norm - prev_sol_norm) / 
                                (prev_sol_norm + 1e-16);
        
        // Print progress every 10 iterations or if converged
        if (iter % 10 == 0 || current_residual < tolerance || relative_change < tolerance) {
            std::cout << std::setw(9) << iter << " | " 
                      << std::scientific << std::setprecision(3) << current_residual << " | "
                      << std::scientific << std::setprecision(3) << current_sol_norm << " | "
                      << std::setw(8) << iter_duration.count() << " | "
                      << std::scientific << std::setprecision(3) << relative_change << std::endl;
        }
        
        // Check convergence
        if (current_residual < tolerance || relative_change < tolerance) {
            auto end_total = std::chrono::high_resolution_clock::now();
            auto total_duration = std::chrono::duration_cast<std::chrono::microseconds>(end_total - start_total);
            
            std::cout << "\nConverged after " << iter << " iterations!" << std::endl;
            std::cout << "Final residual norm: " << std::scientific << current_residual << std::endl;
            std::cout << "Final solution norm: " << std::scientific << current_sol_norm << std::endl;
            std::cout << "Total computation time: " << total_duration.count() / 1000.0 << " ms" << std::endl;
            std::cout << "Average time per iteration: " << total_duration.count() / iter << " μs" << std::endl;
            converged = true;
            break;
        }
        
        prev_residual = current_residual;
        prev_sol_norm = current_sol_norm;
    }
    
    if (!converged) {
        std::cout << "\nDid not converge within " << max_iterations << " iterations." << std::endl;
        std::cout << "Final residual norm: " << std::scientific << prev_residual << std::endl;
    }
    
    return converged;
}

// Function to analyze the loaded data
void analyzeGridData(const Grid& grid, const std::string& name) {
    std::cout << "\n=== Analysis of " << name << " ===" << std::endl;
    
    double min_val = grid(1, 1);
    double max_val = grid(1, 1);
    double sum = 0.0;
    double sum_squares = 0.0;
    int count = 0;
    
    // Analyze interior points (excluding halo) - parallelized
    #pragma omp parallel for reduction(min:min_val) reduction(max:max_val) \
                            reduction(+:sum) reduction(+:sum_squares) \
                            reduction(+:count) collapse(2) num_threads(8)
    for (int i = 1; i < grid.numGrids_y(true) - 1; i++) {
        for (int j = 1; j < grid.numGrids_x(true) - 1; j++) {
            double val = grid(i, j);
            min_val = std::min(min_val, val);
            max_val = std::max(max_val, val);
            sum += val;
            sum_squares += val * val;
            count++;
        }
    }
    
    double mean = sum / count;
    double variance = (sum_squares / count) - (mean * mean);
    double std_dev = std::sqrt(variance);
    
    std::cout << "Grid dimensions: " << grid.numGrids_x(false) << " x " << grid.numGrids_y(false) 
              << " (excluding halo)" << std::endl;
    std::cout << "Min value: " << std::scientific << min_val << std::endl;
    std::cout << "Max value: " << std::scientific << max_val << std::endl;
    std::cout << "Mean value: " << std::scientific << mean << std::endl;
    std::cout << "Standard deviation: " << std::scientific << std_dev << std::endl;
    std::cout << "L2 norm: " << std::scientific << computeL2Norm(grid) << std::endl;
}

int main() {
    std::cout << "=== Parallel PDE GSPreCon Performance Test ===" << std::endl;
    std::cout << "Maximum OpenMP threads available: " << omp_get_max_threads() << std::endl;
    
    // Define grid dimensions based on CSV files
    const int grids_x = 201;
    const int grids_y = 12;
    const int inner_x = grids_x - 2;
    const int inner_y = grids_y - 2;
    
    // Define physical domain parameters
    const double len_x = 1.0;
    const double len_y = 1.0;
    
    try {
        // Create grids with halo
        Grid x_init(inner_x, inner_y);
        Grid rhs_init(inner_x, inner_y);
        
        std::cout << "\nLoading CSV files..." << std::endl;
        
        // Load CSV files
        if (!loadCSVToGrid("x_init.csv", x_init)) {
            std::cerr << "Failed to load x_init.csv" << std::endl;
            return 1;
        }
        std::cout << "Successfully loaded x_init.csv" << std::endl;
        
        if (!loadCSVToGrid("rhs_init.csv", rhs_init)) {
            std::cerr << "Failed to load rhs_init.csv" << std::endl;
            return 1;
        }
        std::cout << "Successfully loaded rhs_init.csv" << std::endl;
        
        // Analyze the loaded data
        analyzeGridData(x_init, "x_init");
        analyzeGridData(rhs_init, "rhs_init");
        
        // Create PDE object
        PDE pde(len_x, len_y, inner_x, inner_y);
        
        // Set up boundary conditions
        pde.boundary[NORTH] = Dirichlet;
        pde.boundary[SOUTH] = Dirichlet;
        pde.boundary[EAST] = Dirichlet;
        pde.boundary[WEST] = Dirichlet;
        
        // Initialize the PDE
        pde.init(&x_init);
        
        // Run performance benchmark
        benchmarkGSPreCon(pde, x_init, rhs_init, 100);
        
        // Test convergence with performance monitoring
        bool converged = testGSPreConConvergence(pde, x_init, rhs_init, 1000, 1e-10);
        
        if (converged) {
            std::cout << "\n✓ Parallel GSPreCon function converged successfully!" << std::endl;
        } else {
            std::cout << "\n✗ Parallel GSPreCon function did not converge within specified tolerance." << std::endl;
        }
        
        std::cout << "\n=== Parallel Performance Test Complete ===" << std::endl;
        
    } catch (const std::exception& e) {
        std::cerr << "Exception caught: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}
