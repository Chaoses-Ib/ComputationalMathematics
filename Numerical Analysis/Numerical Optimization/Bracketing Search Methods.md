# Bracketing Search Methods
分类搜索迭代法的基本思想是：从某一选定的初始点出发，根据目标函数和约束函数在该点的某些信息，确定本次迭代的一个搜索方向和适当的步长。通过迭代产生一个点序列 $\{X^{(k)}\}$，使之逐步接近最优点。

搜索法只要求目标函数可计算，不要求可微。

## Golden-section search
**Golden-section search（Golden ratio search, 黄金分割搜索法）**

给定 $f(x)$ 的单峰区间 $[a,b]$，选择两个内点 $c < d$，使得 $a < c < d < b$。若 $f(c)\le f(d)$，则下次迭代区间为 $[a,d]$；若 $f(c)\ge f(d)$，则下次迭代区间为 $[c,b]$；若 $f(c)=f(d)$，则下次迭代区间为 $[c,d]$。（含有更小值或两端等高的区间）

那么 $c,d$ 具体该如何选取呢？为了使得 $[a,c]$ 与 $[d,b]$ 对称，以及两个旧内点中的一个能够成为新区间的新内点，我们选取一个固定比例因子 $r={\sqrt 5 - 1 \over 2}$，并令 $c=a+(1-r)(b-a), d=a+r(b-a)$。

Sage 实现：
```python
def golden_section_search(f, a, b, eps):
    R = ((sqrt(5) - 1) / 2).n()
    c = a + (1 - R) * (b - a)
    d = a + R * (b - a)
    f1, f2 = f(x=c), f(x=d)
    while b - a >= eps:
        if f1 < f2:
            a, b = a, d
            d = c
            c = a + (1 - R) * (b - a)
            f1, f2 = f(x=c), f1
        elif f1 > f2:
            a, b = c, b
            c = d
            d = a + R * (b - a)
            f1, f2 = f2, f(x=d)
        else:
            a, b = c, d
            c = a + (1 - R) * (b - a)
            d = a + R * (b - a)
            f1, f2 = f(x=c), f(x=d)
    return (a + b) / 2
```

## Fibonacci search
如果我们不使用固定的比例因子，而是根据迭代数决定比例因子，那么我们可以使用斐波那契数列。

$${b_0 - a_0 \over F_n} < \epsilon$$

$$\begin{align}
r_0 &= {F_{n-1} \over F_{n}} \\
r_1 &= {F_{n-2} \over F_{n-1}} \\
& \vdots \\
r_k &= {F_{n-1-k} \over F_{n-k}} \\
& \vdots \\
r_{n-3} &= {F_{2} \over F_{3}} = {1\over 2}
\end{align}$$

Sage 实现：
```python
def fibonacci_search(f, a, b, eps):
    min_fn = (b - a) / eps
    n = 1
    while fibonacci(n) <= min_fn:
        n += 1
    
    def r(k):
        return fibonacci(n - 1 - k) / fibonacci(n - k)
    
    k = 0
    c = a + (1 - r(k)) * (b - a)
    d = a + r(k) * (b - a)
    f1, f2 = f(x=c), f(x=d)
    while b - a >= eps:
        k += 1
        if f1 < f2:
            a, b = a, d
            d = c
            c = a + (1 - r(k)) * (b - a)
            f1, f2 = f(x=c), f1
        elif f1 > f2:
            a, b = c, b
            c = d
            d = a + r(k) * (b - a)
            f1, f2 = f2, f(x=d)
        else:
            a, b = c, d
            c = a + (1 - r(k)) * (b - a)
            d = a + r(k) * (b - a)
            f1, f2 = f(x=c), f(x=d)
    return (a + b) / 2
```