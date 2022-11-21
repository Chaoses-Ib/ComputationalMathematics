# Least Squares
对于给定的一组数据 $(x_i,y_i)\,(i=1,2,\cdots,n)$，使用多项式进行拟合：

$$y(x)=a_0+a_1x+a_2x^2+\cdots+a_mx^m$$

令偏差的平方和

$$Q=\sum_{i=1}^n (y_i-y(x_i))^2$$

最小，即

$${\partial Q \over \partial a_k}
=-2\sum_{i=1}^n (y_i-y(x_i)) x_i^k
=0$$

故有

$$\begin{cases}
a_0 n + a_1 \sum x_i + \cdots + a_m \sum x_i^m &= \sum y_i \\
a_0 \sum x_i + a_1 \sum x_i^2 + \cdots + a_m \sum x_i^{m+1} &= \sum x_iy_i \\
a_0 \sum x_i^2 + a_1 \sum x_i^3 + \cdots + a_m \sum x_i^{m+2} &= \sum x_i^2y_i \\
&\vdots \\
a_0 \sum x_i^m + a_1 \sum x_i^{m+1} + \cdots + a_m \sum x_i^{2m} &= \sum x_i^my_i \\
\end{cases}$$


## Implementation
Sage implementation:
```python
def poly_from_coefficients(coeff):
    return sum(coeff[k] * x^k for k in range(len(coeff)))

def least_squares(X, Y, M):
    A = matrix(M+1, M+1, lambda i,j: sum(X[k]^(i+j) for k in range(len(X))))
    B = vector([sum(X[k]^i * Y[k] for k in range(len(X))) for i in range(M+1)])
    a = A \ B
    return poly_from_coefficients(a)
```