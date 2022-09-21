# Gauss-Seidel Method
基于 [Jacobi method](Jacobi%20Method.md)，在计算 $x_i^{(k+1)}$ 时利用上已经计算出的新值 $x_1^{(k+1)}, x_2^{(k+1)}, \cdots, x_{i-1}^{(k+1)}$：

$$x_i^{(k+1)}={1\over a_{ii}} (b_i - \sum_{j=1}^{i-1}a_{ij}x_j^{(k+1)} - \sum_{j=i+1}^n a_{ij}x_j^{(k)}),\quad i=1,2,...,n$$