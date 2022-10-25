# Adaptive Quadrature
求积公式中的区间需要根据精度要求进行选取，但由于余项往往不易估计，一般采用 adaptive quadrature 来确定区间。Adaptive quadrature 的基本思想是，将积分区间不断两分，反复使用求积公式，直至相邻两次计算结果之差的绝对值小于指定精度。

Generally, adaptive algorithms are just as efficient and effective as traditional algorithms for "well behaved" integrands, but are also effective for "badly behaved" integrands for which traditional algorithms may fail.[^wiki]

记 composite trapezoidal rule 在 $n$ 等分区间上的结果为 $T_n$，则其在 $2n$ 等分区间上的结果为
$$T_{2n} = {1\over 2}T_n + {h\over 2} \sum_{k=0}^{n-1}f_{k+{1\over 2}}$$
注意，其中 $h={b-a\over n}$ 。

## Adpative trapezoidal rule
```python
def adaptive_trapezoidal(f, a, b, eps):
    h = b - a
    t1 = h / 2 * (f(x=a) + f(x=b))
    n = 1
    while True:
        h = (b - a) / n
        t2 = t1 / 2 + h / 2 * sum(f(x=a + (i+1/2)*h) for i in range(n))
        if abs(t2 - t1) < eps:
            break
        n *= 2
        t1 = t2
    return t2
```

## Adapative Romberg's method
```python
def adaptive_romberg(f, a, b, eps):
    t = matrix(RR, 5, 4)
    n = 1
    h = b - a
    t[0, 0] = h / 2 * (f(x=a) + f(x=b))
    i = 1
    while True:
        t[i, 0] = t[i-1, 0] / 2 + h / 2 * sum(f(x=(k+1/2)*h) for k in range(n))
        n *= 2
        h /= 2

        for j in range(1, min(i+1, 4)):
            t[i, j] = (4**j * t[i, j-1] - t[i-1, j-1]) / (4**j - 1)
        if i >= 4:
            if abs(t[i, -1] - t[i-1, -1]) < eps:
                break
            else:
                t = matrix(t.rows() + matrix(1, 4).rows())

        i += 1
    return t[-1][-1]
```

[^wiki]: [Adaptive quadrature - Wikipedia](https://en.wikipedia.org/wiki/Adaptive_quadrature)