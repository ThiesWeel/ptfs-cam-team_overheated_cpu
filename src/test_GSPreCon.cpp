#include "PDE.h"
#include "Grid.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cmath>

// Test macros
#define KNRM  "\x1B[0m"
#define KRED  "\x1B[31m"
#define KGRN  "\x1B[32m"
#define KYEL  "\x1B[33m"
#define KBLU  "\x1B[34m"
#define KMAG  "\x1B[35m"
#define KCYN  "\x1B[36m"
#define KWHT  "\x1B[37m"

#define CHECK_ERR(err, TOL, OP)\
    ++test_ctr;\
    if(fabs(err) > TOL)\
    {\
        printf("%sTest[%2d/%2d] %s failed\n", KRED, test_ctr, total_tests, OP);\
        printf("%s",KNRM);\
        success_flag = false;\
    }\
    else\
    {\
        printf("%sTest[%2d/%2d] %s success\n", KGRN, test_ctr, total_tests, OP);\
        printf("%s",KNRM);\
    }

#define CHECK_GRIDS(a, b, TOL, OP)\
    ++test_ctr;\
    if(a.columns != b.columns || a.rows != b.rows)\
    {\
        printf("Grids compared are not of equal size: %d, %d and %d, %d\n", a.columns, a.rows, b.columns, b.rows);\
        success_flag = false;\
    }\
    else\
    {\
        int i = 0;\
        for(i = 0; i < a.rows; i++)\
        {\
            for(int j = 0; j < a.columns; j++)\
            {\
                if(fabs(a(i,j) - b(i,j)) > TOL)\
                {\
                    printf("%sTest[%2d/%2d] %s failed at (%d,%d): %f vs %f\n", KRED, test_ctr, total_tests, OP, i, j, a(i,j), b(i,j));\
                    printf("%s",KNRM);\
                    success_flag = false;\
                    i = a.rows + 1;\
                    break;\
                }\
            }\
        }\
        if(i == (a.rows))\
        {\
            printf("%sTest[%2d/%2d] %s success\n",KGRN, test_ctr, total_tests, OP);\
            printf("%s",KNRM);\
        }\
    }

#define TESTS_START(ntests)\
    int total_tests = ntests;\
    printf("%sTESTS started\nThere are %d tests to pass%s\n",KCYN,total_tests,KNRM);\
    int test_ctr = 0;\
    bool success_flag = true;

#define TESTS_END\
    if(!success_flag)\
        printf("%sSorry, some tests failed%s\n",KRED, KNRM);\
    else\
        printf("%sCongrats !!!, You did it !\nAll tests passed%s\n",KCYN, KNRM);\

// Helper function to load CSV file into Grid
Grid* loadCSVToGrid(const std::string& filename) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        printf("Could not open file: %s\n", filename.c_str());
        return nullptr;
    }
    
    std::vector<std::vector<double>> data;
    std::string line;
    
    while (std::getline(file, line)) {
        std::vector<double> row;
        std::stringstream ss(line);
        std::string cell;
        
        while (std::getline(ss, cell, ',')) {
            row.push_back(std::stod(cell));
        }
        data.push_back(row);
    }
    
    if (data.empty()) return nullptr;
    
    int rows = data.size();
    int cols = data[0].size();
    
    Grid* grid = new Grid(cols, rows);
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            (*grid)(i, j) = data[i][j];
        }
    }
    
    return grid;
}

// Helper function to create a simple test Grid
Grid* createTestGrid(int rows, int cols, double value = 0.0) {
    Grid* grid = new Grid(cols, rows);
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            (*grid)(i, j) = value;
        }
    }
    return grid;
}

// Helper function to set boundary values
void setBoundaryValues(Grid* grid, double value) {
    int rows = grid->numGrids_y(true);
    int cols = grid->numGrids_x(true);
    
    // Set boundary values
    for (int i = 0; i < cols; i++) {
        (*grid)(0, i) = value;        // Top boundary
        (*grid)(rows-1, i) = value;   // Bottom boundary
    }
    for (int j = 0; j < rows; j++) {
        (*grid)(j, 0) = value;        // Left boundary
        (*grid)(j, cols-1) = value;   // Right boundary
    }
}

int main() {
    TESTS_START(5);
    
    // Test 1: Basic GSPreCon functionality with simple inputs
    {
        PDE pde(1, 1, 5, 5);  // Create 5x5 grid (plus halo)
        Grid* x = createTestGrid(9, 9, 0.0);
        Grid* rhs = createTestGrid(9, 9, 1.0);
        
        // Set boundary conditions
        setBoundaryValues(x, 0.0);
        setBoundaryValues(rhs, 0.0);
        
        // Apply GSPreCon
        pde.GSPreCon(rhs, x);
        
        // Check that interior values have changed from 0
        bool changed = false;
        for (int i = 1; i < 8; i++) {
            for (int j = 1; j < 8; j++) {
                if ((*x)(i, j) != 0.0) {
                    changed = true;
                    break;
                }
            }
            if (changed) break;
        }
        
        if (changed) {
            printf("%sTest[%2d/%2d] GSPreCon basic functionality success\n", KGRN, ++test_ctr, total_tests);
            printf("%s", KNRM);
        } else {
            printf("%sTest[%2d/%2d] GSPreCon basic functionality failed\n", KRED, ++test_ctr, total_tests);
            printf("%s", KNRM);
            success_flag = false;
        }
        
        delete x;
        delete rhs;
    }
    
    // Test 2: Check if CSV files are created
    {
        std::ifstream x_init("x_init.csv");
        std::ifstream rhs_init("rhs_init.csv");
        std::ifstream params("params.txt");
        
        bool files_exist = x_init.is_open() && rhs_init.is_open() && params.is_open();
        
        if (files_exist) {
            printf("%sTest[%2d/%2d] CSV files creation success\n", KGRN, ++test_ctr, total_tests);
            printf("%s", KNRM);
        } else {
            printf("%sTest[%2d/%2d] CSV files creation failed\n", KRED, ++test_ctr, total_tests);
            printf("%s", KNRM);
            success_flag = false;
        }
        
        x_init.close();
        rhs_init.close();
        params.close();
    }
    
    // Test 3: Load and verify saved CSV data
    {
        Grid* loaded_x = loadCSVToGrid("x_init.csv");
        Grid* loaded_rhs = loadCSVToGrid("rhs_init.csv");
        
        if (loaded_x && loaded_rhs) {
            // Basic sanity check - files should have same dimensions
            bool same_size = (loaded_x->numGrids_x(true) == loaded_rhs->numGrids_x(true)) &&
                            (loaded_x->numGrids_y(true) == loaded_rhs->numGrids_y(true));
            
            if (same_size) {
                printf("%sTest[%2d/%2d] CSV data loading success\n", KGRN, ++test_ctr, total_tests);
                printf("%s", KNRM);
            } else {
                printf("%sTest[%2d/%2d] CSV data loading failed\n", KRED, ++test_ctr, total_tests);
                printf("%s", KNRM);
                success_flag = false;
            }
            
            delete loaded_x;
            delete loaded_rhs;
        } else {
            printf("%sTest[%2d/%2d] CSV data loading failed\n", KRED, ++test_ctr, total_tests);
            printf("%s", KNRM);
            success_flag = false;
        }
    }
    
    // Test 4: Test iteration counter functionality
    {
        PDE pde(1, 1, 3, 3);
        Grid* x = createTestGrid(7, 7, 0.0);
        Grid* rhs = createTestGrid(7, 7, 1.0);
        
        // Call GSPreCon multiple times to trigger the 100th iteration save
        for (int i = 0; i < 102; i++) {
            pde.GSPreCon(rhs, x);
        }
        
        // Check if the 100th iteration file was created
        std::ifstream iter100_file("Nth_save_iter100_data_x_1.csv");
        bool iter_file_exists = iter100_file.is_open();
        iter100_file.close();
        
        if (iter_file_exists) {
            printf("%sTest[%2d/%2d] Iteration counter functionality success\n", KGRN, ++test_ctr, total_tests);
            printf("%s", KNRM);
        } else {
            printf("%sTest[%2d/%2d] Iteration counter functionality failed\n", KRED, ++test_ctr, total_tests);
            printf("%s", KNRM);
            success_flag = false;
        }
        
        delete x;
        delete rhs;
    }
    
    // Test 5: Test boundary preservation
    {
        PDE pde(1, 1, 3, 3);
        Grid* x = createTestGrid(7, 7, 0.0);
        Grid* rhs = createTestGrid(7, 7, 1.0);
        
        // Set specific boundary values
        setBoundaryValues(x, 5.0);
        setBoundaryValues(rhs, 0.0);
        
        // Store original boundary values
        std::vector<double> original_boundaries;
        int rows = x->numGrids_y(true);
        int cols = x->numGrids_x(true);
        
        for (int i = 0; i < cols; i++) {
            original_boundaries.push_back((*x)(0, i));
            original_boundaries.push_back((*x)(rows-1, i));
        }
        for (int j = 1; j < rows-1; j++) {
            original_boundaries.push_back((*x)(j, 0));
            original_boundaries.push_back((*x)(j, cols-1));
        }
        
        pde.GSPreCon(rhs, x);
        
        // Check if boundary values are preserved
        bool boundaries_preserved = true;
        int idx = 0;
        for (int i = 0; i < cols; i++) {
            if (fabs((*x)(0, i) - original_boundaries[idx++]) > 1e-10 ||
                fabs((*x)(rows-1, i) - original_boundaries[idx++]) > 1e-10) {
                boundaries_preserved = false;
                break;
            }
        }
        if (boundaries_preserved) {
            for (int j = 1; j < rows-1; j++) {
                if (fabs((*x)(j, 0) - original_boundaries[idx++]) > 1e-10 ||
                    fabs((*x)(j, cols-1) - original_boundaries[idx++]) > 1e-10) {
                    boundaries_preserved = false;
                    break;
                }
            }
        }
        
        if (boundaries_preserved) {
            printf("%sTest[%2d/%2d] Boundary preservation success\n", KGRN, ++test_ctr, total_tests);
            printf("%s", KNRM);
        } else {
            printf("%sTest[%2d/%2d] Boundary preservation failed\n", KRED, ++test_ctr, total_tests);
            printf("%s", KNRM);
            success_flag = false;
        }
        
        delete x;
        delete rhs;
    }
    
    TESTS_END
    
    return success_flag ? 0 : 1;
}