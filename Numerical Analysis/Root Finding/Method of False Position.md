# Method of False Position
**Method of false position (regula falsi, 试值法)**

在 [Bisection Method](Bisection%20Method.md) 的基础上，修改 $x$ 为经过 $(a,f(a))$ 和 $(b,f(b))$ 的割线 $y-f(b)={f(b)-f(a) \over b-a}(x-b)$ 的横截距，即
$$x=b-{f(b)(b-a) \over f(b)-f(a)}$$

由于试值法中有根区间的长度可能不趋于零，试值法的终止判别条件需要修改为：
$$b-a<\delta \lor |f(c_n)|<\epsilon$$

## 实现
Sage 实现：
```python
def method_of_false_position(f, a, b, delta, eps):
    c = b - f(b) * (b - a) / (f(b) - f(a))
    if b - a < delta or abs(f(c)) < eps:
        return c
    if f(a) * f(c) < 0:
        return method_of_false_position(f, a, c, delta, eps)
    else:
        return method_of_false_position(f, c, b, delta, eps)
```

优化实现：
```python
def method_of_false_position(f, a, b, delta, eps):
    fa, fb = f(x=a), f(x=b)
    c = b - fb * (b - a) / (fb - fa)
    fc = f(x=c)
    while not (b - a < delta or abs(fc) < eps):
        if fa * fc < 0:
            b = c
            fb = fc
        else:
            a = c
            fa = fc
        c = b - fb * (b - a) / (fb - fa)
        fc = f(x=c)
    return c
```