# Polynomial Interpolation
## Lagrange polynomial
$$L_n(x)=y_0l_0(x) + y_1l_1(x) + \cdots + y_nl_n(x)$$
where

$$\begin{align}
l_k(x)
&= \prod_{i=0,i\ne k}^n {x-x_i \over x_k-x_i} \\
&= {(x-x_0)(x-x_1)\cdots(x-x_{k-1})(x-x_{k+1})\cdots(x-x_n)
\over
(x_k-x_0)(x_k-x_1)\cdots(x_k-x_{k-1})(x_k-x_{k+1})\cdots(x_k-x_n)
}
\end{align}$$

### Implementation
Sage implementation:
```python
def lagrange_poly(X, Y):
    return sum(
        Y[k] * prod(
            (x - X[i]) / (X[k] - X[i])
            for i in filter(lambda i: i != k, range(len(X)))
            )
        for k in range(len(X))
        )
```

## Newton polynomial
$$N_n(x)=f[x_0] + f[x_0,x_1](x-x_0) + \cdots + f[x_0,x_1,\cdots,x_n](x-x_0)(x-x_1)\cdots(x-x_{n-1})$$

where $f[x_0,x_1,\cdots,x_m]$ is the divided difference:

$$\begin{align}
f[x_0] &= f(x_0) \\
f[x_0,x_1,\cdots,x_m] &= { f[x_1,x_2,\cdots,x_m] - f[x_0,x_1,\cdots,x_{m-1}] \over x_m - x_0 }
\end{align}$$

### Implementation
Sage implementation:
```python
def newton_poly(X, Y):
    def f(X, Y):
        if len(X) == 1:
            return Y[0]
        return (f(X[1:], Y[1:]) - f(X[:-1], Y[:-1])) / (X[-1] - X[0])
    
    return sum(
        f(X[:i+1], Y[:i+1]) * prod(x - X[k] for k in range(i))
        for i in range(len(X))
    )
```