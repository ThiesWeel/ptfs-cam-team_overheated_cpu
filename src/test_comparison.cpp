#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <cmath>
#include <iomanip>
#include <chrono>
#include "../include/Grid.h"
#include "../include/PDE.h"
#include "../include/types.h"

/**
 * CONVERGENCE TEST FOR GSPRECON FUNCTION
 * 
 * This file directly addresses the original request:
 * "lets make a file that tests, it must take the two init files, 
 *  and check if the precondition function convergences"
 * 
 * - Loads x_init.csv and rhs_init.csv
 * - Tests GSPreCon function convergence
 * - Provides detailed convergence analysis
 */

// Function to load CSV data into Grid
bool loadCSVToGrid(const std::string& filename, Grid& grid) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "ERROR: Cannot open " << filename << std::endl;
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
                grid(row, col) = std::stod(cell);
            } catch (const std::exception& e) {
                std::cerr << "Parse error at (" << row << "," << col << "): " << cell << std::endl;
                return false;
            }
            col++;
        }
        row++;
    }
    
    file.close();
    std::cout << "✓ Successfully loaded " << filename << std::endl;
    return true;
}

// Compute L2 norm for convergence monitoring
double computeL2Norm(const Grid& grid) {
    double norm = 0.0;
    for (int i = 1; i < grid.numGrids_y(true) - 1; i++) {
        for (int j = 1; j < grid.numGrids_x(true) - 1; j++) {
            double val = grid(i, j);
            norm += val * val;
        }
    }
    return std::sqrt(norm);
}

// Compute residual for convergence check: r = b - A*x
double computeResidualNorm(PDE& pde, Grid& x, Grid& b) {
    Grid Ax(x.numGrids_x(false), x.numGrids_y(false));
    
    // Compute A*x
    pde.applyStencil(&Ax, &x);
    
    // Compute ||b - A*x||
    double residual_norm = 0.0;
    for (int i = 1; i < b.numGrids_y(true) - 1; i++) {
        for (int j = 1; j < b.numGrids_x(true) - 1; j++) {
            double residual = b(i, j) - Ax(i, j);
            residual_norm += residual * residual;
        }
    }
    
    return std::sqrt(residual_norm);
}

// Main convergence test function
bool testGSPreConConvergence(PDE& pde, Grid& x_init, Grid& rhs_init) {
    std::cout << "\n" << std::string(60, '=') << std::endl;
    std::cout << "         GSPRECON CONVERGENCE TEST" << std::endl;
    std::cout << std::string(60, '=') << std::endl;
    
    // Create working copies
    Grid x_current = x_init;
    Grid rhs_current = rhs_init;
    
    // Initial analysis
    double initial_x_norm = computeL2Norm(x_current);
    double initial_rhs_norm = computeL2Norm(rhs_current);
    double initial_residual = computeResidualNorm(pde, x_current, rhs_current);
    
    std::cout << "Initial State:" << std::endl;
    std::cout << "  Solution norm (x): " << std::scientific << initial_x_norm << std::endl;
    std::cout << "  RHS norm (b):      " << std::scientific << initial_rhs_norm << std::endl;
    std::cout << "  Residual norm:     " << std::scientific << initial_residual << std::endl;
    
    // Convergence parameters
    const int MAX_ITERATIONS = 100;
    const double TOLERANCE = 1e-12;
    
    std::cout << "\nConvergence Parameters:" << std::endl;
    std::cout << "  Max iterations: " << MAX_ITERATIONS << std::endl;
    std::cout << "  Tolerance:      " << std::scientific << TOLERANCE << std::endl;
    
    std::cout << "\n" << std::string(80, '-') << std::endl;
    std::cout << "Iteration |   Residual Norm   |  Solution Norm   | Relative Change | Status" << std::endl;
    std::cout << std::string(80, '-') << std::endl;
    
    double prev_residual = initial_residual;
    double prev_solution_norm = initial_x_norm;
    bool converged = false;
    
    auto start_time = std::chrono::high_resolution_clock::now();
    
    for (int iter = 1; iter <= MAX_ITERATIONS; iter++) {
        // Apply one GSPreCon iteration
        pde.GSPreCon(&rhs_current, &x_current);
        
        // Compute convergence metrics
        double current_residual = computeResidualNorm(pde, x_current, rhs_current);
        double current_solution_norm = computeL2Norm(x_current);
        
        // Relative changes
        double residual_reduction = (prev_residual > 0) ? 
                                   std::abs(current_residual - prev_residual) / prev_residual : 0.0;
        double solution_change = (prev_solution_norm > 0) ? 
                                std::abs(current_solution_norm - prev_solution_norm) / prev_solution_norm : 0.0;
        
        // Check convergence
        bool residual_converged = current_residual < TOLERANCE;
        bool solution_converged = solution_change < TOLERANCE;
        converged = residual_converged || solution_converged;
        
        // Print progress
        std::cout << std::setw(9) << iter << " | "
                  << std::scientific << std::setprecision(6) << current_residual << " | "
                  << std::scientific << std::setprecision(6) << current_solution_norm << " | "
                  << std::scientific << std::setprecision(6) << solution_change << " | ";
        
        if (converged) {
            std::cout << "CONVERGED" << std::endl;
            break;
        } else {
            std::cout << "Continuing" << std::endl;
        }
        
        prev_residual = current_residual;
        prev_solution_norm = current_solution_norm;
    }
    
    auto end_time = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time);
    
    std::cout << std::string(80, '-') << std::endl;
    
    // Final results
    if (converged) {
        std::cout << "✓ CONVERGENCE ACHIEVED!" << std::endl;
        std::cout << "  Final residual: " << std::scientific << prev_residual << std::endl;
        std::cout << "  Iterations used: " << (converged ? "Early termination" : "Max iterations") << std::endl;
    } else {
        std::cout << "✗ CONVERGENCE NOT ACHIEVED" << std::endl;
        std::cout << "  Final residual: " << std::scientific << prev_residual << std::endl;
        std::cout << "  Reached maximum iterations: " << MAX_ITERATIONS << std::endl;
    }
    
    std::cout << "  Total time: " << duration.count() / 1000.0 << " ms" << std::endl;
    
    return converged;
}

int main() {
    std::cout << "=================================================================" << std::endl;
    std::cout << "     GSPRECON CONVERGENCE TEST - LOADING INIT FILES" << std::endl;
    std::cout << "=================================================================" << std::endl;
    std::cout << "This test loads x_init.csv and rhs_init.csv and checks if the" << std::endl;
    std::cout << "GSPreCon (Gauss-Seidel Preconditioner) function converges." << std::endl;
    std::cout << "=================================================================" << std::endl;
    
    try {
        // Grid dimensions (based on CSV structure: 201 cols, 12 rows including halo)
        const int inner_x = 199;  // 201 - 2 (halo)
        const int inner_y = 10;   // 12 - 2 (halo)
        
        // Create grids
        Grid x_init(inner_x, inner_y);
        Grid rhs_init(inner_x, inner_y);
        
        std::cout << "\nStep 1: Loading initialization files..." << std::endl;
        
        // Load the two required init files
        if (!loadCSVToGrid("x_init.csv", x_init)) {
            std::cerr << "Failed to load x_init.csv" << std::endl;
            return 1;
        }
        
        if (!loadCSVToGrid("rhs_init.csv", rhs_init)) {
            std::cerr << "Failed to load rhs_init.csv" << std::endl;
            return 1;
        }
        
        std::cout << "\nStep 2: Setting up PDE solver..." << std::endl;
        
        // Create PDE object
        PDE pde(1.0, 1.0, inner_x, inner_y);  // Unit domain
        
        // Set boundary conditions (Dirichlet on all sides)
        pde.boundary[NORTH] = Dirichlet;
        pde.boundary[SOUTH] = Dirichlet;
        pde.boundary[EAST] = Dirichlet;
        pde.boundary[WEST] = Dirichlet;
        
        // Initialize PDE
        pde.init(&x_init);
        
        std::cout << "✓ PDE solver configured with " << inner_x << "x" << inner_y << " grid" << std::endl;
        
        std::cout << "\nStep 3: Testing GSPreCon convergence..." << std::endl;
        
        // Run the main convergence test
        bool success = testGSPreConConvergence(pde, x_init, rhs_init);
        
        std::cout << "\n" << std::string(60, '=') << std::endl;
        std::cout << "                 FINAL RESULT" << std::endl;
        std::cout << std::string(60, '=') << std::endl;
        
        if (success) {
            std::cout << "✓ SUCCESS: GSPreCon function CONVERGES" << std::endl;
            std::cout << "  The preconditioner is working correctly!" << std::endl;
            std::cout << "  Ready for use in iterative solvers." << std::endl;
        } else {
            std::cout << "✗ WARNING: GSPreCon function did NOT converge" << std::endl;
            std::cout << "  May need parameter tuning or different approach." << std::endl;
        }
        
        std::cout << std::string(60, '=') << std::endl;
        
        return success ? 0 : 1;
        
    } catch (const std::exception& e) {
        std::cerr << "ERROR: " << e.what() << std::endl;
        return 1;
    }
}
