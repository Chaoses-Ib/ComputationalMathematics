# Bracketing Methods
## Bisection Method
若 $f\in C[a,b]$，且 $f(a)\cdot f(b)<0$，则 $f$ 在 $(a,b)$ 上必有一根。

算法：
1. 画出 $f(x)$ 草图，确定根的大概位置
2. 给定满足 $f(a)\cdot f(b)<0$ 的有根区间 $[a,b]$ 和精度要求 $\epsilon$
3. `do` 令 $x={a+b \over 2}$
   1. 如果 $b-a<2\epsilon$，`break`
   2. 如果 $f(a)\cdot f(x)<0$，令 $b=x$
      1. 否则，令 $a=x$
   3. `while true`
4. 输出 $x$

优点：
- 简单易用
- 只要求 $f(x)$ 在 $[a,b]$ 上连续

缺点：
- 无法求复根和偶重根
- 收敛慢

### Order of convergence
二分法为线性收敛。

### 误差分析
记 $a_0=a,b_0=b$，第 $k$ 步的有根区间为 $[a_k,b_k]$

$$
|x_k-x^*|
=|{b_k+a_k \over 2}-x^*|
\le {b_k-a_k \over 2}
= {b-a \over 2^{k+1}}
$$

对于给定的精度 $\epsilon$，可估计二分法所需的步数 $k$：

令 ${b-a \over 2^{k+1}} \le \epsilon$，得 $k \ge \log_2{{b-a \over \epsilon}-1}$，即
$$k=\lceil\log_2{b-a \over \epsilon}\rceil-1$$

### 实现
Sage 实现：
```python
def bisection_method(f, a, b, eps):
    x = (a + b) / 2
    if b - a < 2*eps:
        return x
    if f(x=a) * f(x=x) < 0:
        return bisection_method(f, a, x, eps)
    else:
        return bisection_method(f, x, b, eps)
```

优化实现：
```python
def bisection_method(f, a, b, eps):
    fa = f(x=a)
    while b - a >= 2*eps:
        x = (a + b) / 2
        fx = f(x=x)
        if fa * fx < 0:
            b = x
        else:
            a = x
            fa = fx
    return (a + b) / 2
```
相较于每次迭代需要对 $f(x)$ 进行两次求值的递归实现，优化实现每次迭代只需要对 $f(x)$ 进行一次求值。

## Method of false position
**Method of false position (regula falsi, 试值法)**

在 bisection method 的基础上，修改 $x$ 为经过 $(a,f(a))$ 和 $(b,f(b))$ 的割线 $y-f(b)={f(b)-f(a) \over b-a}(x-b)$ 的横截距，即

$$x=b-{f(b) \over ({f(b)-f(a) \over b-a})} =b-{f(b)(b-a) \over f(b)-f(a)}$$

由于试值法中有根区间的长度可能不趋于零，试值法的终止判别条件需要修改为：
$$b-a<\delta \lor |f(c_n)|<\epsilon$$

### Order of convergence
试值法的收敛阶为 ${\sqrt 5+1 \over 2}$，即 golden ratio，为超线性收敛。

### 实现
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