## Doolittle Factorization
Doolittle Factorization is a method used to decompose a square matrix $A$ into the product of a unit lower triangular matrix $L$ and an upper triangular matrix $U$, i.e., $A = LU$. Solving a linear system of the form $Ax = b$ using Gaussian elimination generally requires at least $O(n^3)$ computational cost, where $n$ is the size of the square matrix $A$. **For this factorization, decomposition itself requires $O(n^3)$ computations, but solving $LUx = b$ only requires the cost of $O(n^2)$ through forward and backward substitutions.**
 
Therefore, if we need to solve the linear system $Ax = b$ multiple times with different right-hand side vectors $b$, the computational cost is much lower by using the Doolittle Factorization, as we only need to **perform the $O(n^3)$ decomposition once**, and then the **$O(n^2)$ forward and backward substitutions for each new $b$**.

## Cholesky Factorization
Cholesky Factorization is a method used to decompose a Hermitian, positive-definite matrix $A$ into the product of a lower triangular matrix $L$ and its conjugate transpose, i.e., $A = LL^*$. The computational cost required in this decomposition is $O(n^3)$. **Every Hermitian positive-definite matrix admits a unique Cholesky decomposition**.

## Circulant Matrix System
A circulant matrix $C$ is a special type of square matrix where each row (or column) is a circular shift of the previous row (or column). We can take advantage of the fact that **every circulant matrix can be diagonalized by the Discrete Fast Fourier Transform (*FFT*) matrix $F_n$**, where $F_n C F_n^{-1} = D$ and $n$ is the size of the circulant matrix $C$. Furthermore, all the eigenvalues of $C$ can be obtained by applying the *FFT* to the first column of $C$.

The linear system $Cx = b$ is equivalent to $D(F_n)x = F_nb$. Matrix-vector multiplications of $F_nx$ and $F_n^{-1}x$ can be performed in $O(n\log n)$ computational cost. As a result, **the linear system $D(F_n)x = F_nb$ can be solved in $O(n\log n)$ time** using the following steps:

1. Apply the *FFT* to the first column of $C$ to obtain diagonal matrix $D$.
2. Apply the *FFT* to the right-hand side vector $b$, then divide the result elementwise by the diagonal elements of $D$.
3. Apply the inverse *FFT* to the resulting vector.

This efficient algorithm to the circulant matrix system requires only $O(n\log n)$ computational cost, making it a very useful technique in various applications.
