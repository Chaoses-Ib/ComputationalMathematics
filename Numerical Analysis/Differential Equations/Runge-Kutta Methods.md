# Runge-Kutta Methods
## Fourth-order Runge-Kutta method
### Implementation
Sage implementation:
```python
def runge_kutta_4(f, a, ya, b, M):
    h = (b - a) / M
    table = matrix(RR, M + 1, 2)
    table[0] = a, ya
    for k in range(1, M + 1):
        xk, yk = table[k - 1][0], table[k - 1][1]
        k1 = h * f(x=xk, y=yk)
        k2 = h * f(x=xk + h/2, y=yk + k1/2)
        k3 = h * f(x=xk + h/2, y=yk + k2/2)
        k4 = h * f(x=xk + h, y=yk + k3)
        table[k] = a + k * h, yk + h / 6 * (k1 + 2*k2 + 2*k3 + k4)
    return table
```