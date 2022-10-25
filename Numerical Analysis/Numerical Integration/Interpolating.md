# Quadrature Rules Based on Interpolating Functions
对被积函数进行多项式插值：
$$f(x) \approx \sum_{k=0}^n f(x_k) l_k(x)$$

对多项式插值进行积分：

$$\int_a^bf(x)dx
\approx \int_a^b \sum_{k=0}^n f(x_k) l_k(x)dx
= \sum_{k=0}^n (\int_a^b l_k(x)dx) f(x_k)
$$

故对应求积公式的 $A_k=\int_a^b l_k(x)dx$，只与 $x_k$ 有关，与 $f(x)$ 无关。

误差
$$R(f)=\int_a^b { f^{(n+1)}(\xi) \over (n+1)! } \omega_{n+1}(x) dx$$

## Newton-Cotes formulas
若取等距分布的 $x_k$，则对应的求积公式称为 Newton-Cotes formulas。

$n$ | Step size $h$ | Common name | Formula | Error term
--- | --- | --- | --- | ---
$1$ | $b-a$ | [Trapezoidal rule](https://en.wikipedia.org/wiki/Trapezoidal_rule) | ${h\over 2}(f_0+f_1)$ | $-{1\over 12}h^3f^{(2)}(\xi)$
$2$ | $b-a\over 2$ | [Simpson's rule](https://en.wikipedia.org/wiki/Simpson%27s_rule) | ${h\over 3}(f_0+4f_1+f_2)$ | $-{1\over 90}h^5f^{(4)}(\xi)$
$3$ | $b-a\over 3$ | [Simpson's 3/8 rule](https://en.wikipedia.org/wiki/Simpson%27s_rule#Simpson's_3/8_rule) | ${3h\over 8}(f_0+3f_1+3f_2+f_3)$ | $-{1\over 80}h^5f^{(4)}(\xi)$
$4$ | $b-a\over 4$ | [Boole's rule](https://en.wikipedia.org/wiki/Boole%27s_rule) | ${2h\over 45}(7f_0+32f_1+12f_2+32f_3+7f_4)$ | $-{8\over 945}h^7f^{(6)}(\xi)$

where $f_k=f(x_k)=f(a+kh)$.

由 error term 可知，其代数精度分别为 $1,3,3,5$ 。

## Romberg's method
$$\begin{align}
{4T_{2n} - T_n \over 4-1}&=S_n \\
{4^2 S_{2n} - S_n \over 4^2-1}&=C_n \\
{4^3 S_{2n} - S_n \over 4^3-1}&=R_n \\
\vdots
\end{align}$$

## Composite rule
为了提高精度，可以将积分区间 $[a,b]$ 分为多个小区间，并在每个小区间上应用低次 Newton-Cotes formulas，进行求和。

Composite trapezoidal rule:

$$\begin{align}
\int_a^bf(x)dx
&\approx \sum_{k=0}^{n-1} {h\over 2} [f_k+f_{k+1}] \\
&= {h\over 2}[ f_0 + 2\sum_{k=1}^{n-1} f_k + f_n ]
\end{align}$$

where $h={b-a \over n}$.

Composite Simpson's rule:

$$\begin{align}
\int_a^bf(x)dx
&\approx \sum_{k=0}^{n-1} {h\over 6} [f_k+4f_{k+{1\over 2}}+f_{k+1}] \\
&= {h\over 6}[ f_0 + 4\sum_{k=0}^{n-1} f_{k+{1\over 2}} + 2\sum_{k=1}^{n-1}f_k + f_n ]
\end{align}$$

where ${h\over 6}={h \over 2}\times {1\over3}$ .

Composite Boole's rule:

$$\begin{align}
\int_a^bf(x)dx
&\approx {h\over 90} [
    7f_0
    +32 \sum_{k=0}^{n-1} f_{k+{1\over 4}}
    +12 \sum_{k=0}^{n-1} f_{k+{1\over 2}}
    +32 \sum_{k=0}^{n-1} f_{k+{3\over 4}}
    +14 \sum_{k=1}^{n-1} f_{k+1}
    +7f_n]
\end{align}$$

## Gaussian quadrature formulas
