# Euler Method
对于一阶常微分方程

$${dy\over dx}=f(x,y)$$

我们可以从初值 $y(x_0)=y_0$ 出发，以 $\Delta x$ 为步长，得到一个新的 $y_1$：

$$\begin{align}
y_1 &= y_0 + {dy\over dx} \cdot \Delta x \\
&= y_0 + f(x_0,y_0) \cdot \Delta x
\end{align}$$

Sage 实现：
```python
def euler(f, a, ya, h, b):
    n = ceil((b - a) / h)
    table = matrix(RR, n + 1, 2)
    table[0] = a, ya
    for k in range(1, n + 1):
        table[k] = a + k * h, table[k-1][1] + h * f(x=table[k-1][0], y=table[k-1][1])
    return table
```

## Improved Euler method
**Improved Euler method (Heun's method, explicit trapezoidal rule)**

$$y_{k+1} = y_k + {h \over 2}(f(x_k, y_k) + f(x_{k+1}, y_k+hf(x_k,y_k)))$$

### Implementation
Sage implementation:
```python
def improved_euler(f, a, ya, b, M):
    h = (b - a) / M
    table = matrix(RR, M + 1, 2)
    table[0] = a, ya
    for k in range(1, M + 1):
        xk, yk = table[k - 1][0], table[k - 1][1]
        fx = f(x=xk, y=yk)
        table[k] = a + k * h, yk + h / 2 * (fx + f(x=a + k * h, y=yk + h * fx))
    return table
```