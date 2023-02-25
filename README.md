# Approximation
## About
Project using 'C' language for JiMP class in 2022Z.
## Description
Program which allows users to approximate data using different approximation methods:
    - cubic spline approximation
    - approximation using Chebyshev polynomials
    - cubic spline interpolation
    - connecting first and last data points
## Tasks
Our task was to fix already existing parts of the program and implement another approximating module. 
We:
- fixed interpolation
- fixed memory leaks
- implemented approximation using Chebyshev polynomials
- changed file structure
- added tests
## How to use
1. You move to 'gaus' directory. (cd gaus)
2. Compile matrix solver by typying 'make' in the terminal.
3. Then, move back to the main directory.
4. Type:
    - 'make aprox' to compile program (aprox) that implements a cubic spline approximation
    - 'make czybyszew' to compile program (czebyszew) that implements approximation using Chebyshev polynomials
    - 'make prosta' to compile program (prosta) that connects first and last data points
    - 'make intrp' to compile program (intrp) that implements cubic spline interpolation
5. The programs will be saved to 'bin' directory.
6. Further instructions are available after running program without any arguments, e.g. 'bin/aprox'.
## Authors
 - Jan Gębal
 - Jan Brzozowski