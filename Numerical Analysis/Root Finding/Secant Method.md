# Secant Method
**Secant method (割线法)**

在 Newton's method 中：

$$x_{k+1} = x_k-{f(x_k) \over f'(x_k)}$$

为了避免计算导数，secant method 使用差商替代了导数：

$$\begin{align}
x_{k+1} &= x_k-{f(x_k) \over ({ f(x_k)-f(x_{k-1}) \over x_k-x_{k-1} })} \\
&= x_k-{f(x_k) (x_k-x_{k-1}) \over f(x_k)-f(x_{k-1})}
\end{align}$$

但这也导致了 secant method 收敛更慢。

## 实现
Sage 实现：
```python
def secant_method(f, x0, x1, eps):
    while True:
        f0, f1 = f(x=x0), f(x=x1)
        x2 = x1 - f1 * (x1 - x0) / (f1 - f0)
        if abs(x2 - x1) < eps:
            break
        x0, x1 = x1, x2
    return x2
```