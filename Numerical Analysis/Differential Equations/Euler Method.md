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