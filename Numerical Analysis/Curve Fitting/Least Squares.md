# Least Squares
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