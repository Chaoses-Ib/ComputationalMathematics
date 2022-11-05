# Bisection Method
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

## 误差分析
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

## 实现
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