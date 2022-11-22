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
{4^2 S_{2n} - S_n \over 4^2-1}&=B_n \\
{4^3 B_{2n} - B_n \over 4^3-1}&=R_n \\
\vdots
\end{align}$$

## Composite rule
为了提高精度，可以将积分区间 $[a,b]$ 分为多个小区间，并在每个小区间上应用低次 Newton-Cotes formulas，进行求和。

对于一个 Newton-Cotes formula：
$$\int_a^bf(x)dx\approx{h\over 系数}(首+中间点+尾)$$

它的对应 composite rule 为：

$$\begin{align}
\int_a^bf(x)dx
&\approx {h \over 步数\times系数} [
    首
    +\sum_{k=0}^{n-1} 中间点
    +\sum_{k=1}^{n-1} 端点
    +尾]
\end{align}$$

即系数除步，首尾保留，中间不变，端点加倍。composite rule 中的 $h$ 是指小区间长度，需要将它除以对应求积公式的步数才能得到对应求积公式中的 $h$，即小区间的步长。

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
    +14 \sum_{k=1}^{n-1} f_{k}
    +7f_n]
\end{align}$$

where ${h\over 90}={2h\over 45}\times{1\over 4}$.

## Gaussian quadrature formulas
由 $n+1$ 个插值点 $x_0,x_1,\cdots,x_n$ 构造出的插值型求积公式

$$\int_a^b f(x)dx\approx \sum_{k=0}^n w_k f(x_k)$$

的代数精度不超过 $2n+1$。

具有 $2n+1$ 代数精度的求积公式称为 Gaussian 求积公式。其系数 $w_k$ 可由定义求出：

$$\begin{cases}
\int_a^b f(x^i)dx=\sum_{k=0}^n w_k f(x_k^i)
\end{cases}$$

即：

$$\begin{cases}
\int_a^b f(1)dx&=\sum_{k=0}^n w_k f(1) \\
\int_a^b f(x)dx&=\sum_{k=0}^n w_k f(x_k) \\
\int_a^b f(x^2)dx&=\sum_{k=0}^n w_k f(x_k^2) \\
&\vdots \\
\int_a^b f(x^{2n+1})dx&=\sum_{k=0}^n w_k f(x_k^{2n+1})
\end{cases}$$

该方程组为 $2n+2$ 元 $2n+1$ 次方程组。

### 常见 Gaussian 求积公式
在 $[-1,1]$ 上的 Gaussian 求积公式为：

插值点 | 代数精度 | Gaussian 公式
--- | --- | ---
$1$ | $1$ | $2f(0)$
$2$ | $3$ | $f(-{1 \over \sqrt 3})+f({1 \over \sqrt 3})$
$3$ | $5$ | ${5\over 9}f(-\sqrt{3\over 5}) +{8\over 9}f(0) + {5\over 9}f(\sqrt{3\over 5})$

可通过以下方法将 $[a,b]$ 上的积分变换到 $[-1,1]$ 上：

$$\begin{align}
\int _{a}^{b}f(x)\,dx
&=\int _{-1}^{1}
f\left({\frac {b-a}{2}}\xi +{\frac {a+b}{2}}\right)
\,{\frac {dx}{d\xi }} d\xi \\
&\approx {\frac {b-a}{2}}\sum _{i=1}^{n}w_{i}f\left({\frac {b-a}{2}}\xi _{i}+{\frac {a+b}{2}}\right)
\end{align}$$

其中 ${\frac {dx}{d\xi }={\frac {b-a}{2}}}$ 。

观察到，对于 $[-a,a]$ 上的积分，${b-a\over 2}=a$，${a+b\over 2}=0$，即

$$\begin{align}
\int _{a}^{b}f(x)\,dx
=a \int_{-1}^1 f(ax)\,d\xi
\approx a\sum _{i=1}^{n}w_{i}f\left(a\xi _{i}\right)
\end{align}$$

故可推出在 $[-a,a]$ 上的 Gaussian 求积公式为：

插值点 | 代数精度 | Gaussian 公式
--- | --- | ---
$1$ | $1$ | $2af(0)$
$2$ | $3$ | $a[f(-{a \over \sqrt 3})+f({a \over \sqrt 3})]$
$3$ | $5$ | $a[{5\over 9}f(-\sqrt{3\over 5}a) +{8\over 9}f(0) + {5\over 9}f(\sqrt{3\over 5}a)]$


同理，对于 $[0,a]$ 上的积分，${b-a\over 2}={a\over 2}$，${a+b\over 2}={a\over 2}$，即

$$\begin{align}
\int _{a}^{b}f(x)\,dx
\approx {\frac {a}{2}}\sum _{i=1}^{n}w_{i}f\left({\frac {a}{2}}\xi _{i}+{\frac {a}{2}}\right)
= {\frac {a}{2}}\sum _{i=1}^{n}w_{i}f\left({\frac {a}{2}}(\xi_i+1)\right)
\end{align}$$

故可推出在 $[0,a]$ 上的 Gaussian 求积公式为：

插值点 | 代数精度 | Gaussian 公式
--- | --- | ---
$1$ | $1$ | $af({a\over 2})$
$2$ | $3$ | ${a\over 2}[f({a\over 2}(1-{1 \over \sqrt 3}))+f({a\over 2}(1+{1 \over \sqrt 3}))]$
$3$ | $5$ | ${a\over 2}[{5\over 9}f({a\over 2}(1-\sqrt{3\over 5})) +{8\over 9}f({a\over 2}) + {5\over 9}f({a\over 2}(1+\sqrt{3\over 5}))]$