# Error Analysis

The different types of error:
- Modeling error
- Measurement error
- Truncation error

  The notion of truncation error usually refers to errors introduced when a more complicated mathematical expression is “replaced” with a more elementary formula. This terminology originates from the technique of replacing a complicated function with a truncated Taylor series.[^john]
- Round-off error

  A computer’s representation of real numbers is limited to the ﬁxed precision of the mantissa. True values are sometimes not stored exactly by a computer’s representation. This is called round-off error.[^john]

## Absolute error and relative error
Suppose that $\hat{p}$ is an approximation to $p$. The **absolute error** is

$$E_p=|p-\hat{p}|$$
and the **relative error** is

$$R_p={|p-\hat{p}| \over |p|}$$
provided that $p\ne 0$. As $|p|$ moves away from $1$, the relative error $R_p$ is a better indicator than $E_p$ of the accuracy of the approximation.[^john]

The number $\hat{p}$ is said to **approximate** $p$ to $d$ significant digits if $d$ is the largest nonnegative integer for which[^john]

$$R_p={|p-\hat{p}| \over |p|} < 5\times 10^{-d}$$

For example, if $x=3.141592$ and $\hat{x}=3.14$, then $R_p=0.000507 < 5\times 10^{-3}$, therefore $\hat{x}$ approximates $x$ to $3$ significant digits.

有效数字的另一种定义是

$$\begin{align}
E_p&=|p-\hat{p}|<5\times 10^{d_1} \\
R_p&={|p-\hat{p}| \over |p|}<5\times 10^{d_2} \\
d&=\max{\{d_1,d_2\}}
\end{align}$$
## Propagation of error
- For addition, the error is the sum of the errors in the addends.
- For multiplication, the relative error is approximately the sum of the relative errors in the factors.

Often, an initial error will be propagated in a sequence of calculations. A quality that is desirable for any numerical process is that a small error in the initial conditions will produce small changes in the ﬁnal result. An algorithm with this feature is called **stable**; otherwise, it is called **unstable**.

Suppose that $\epsilon$ represents an initial error and $\epsilon(n)$ represents the growth of the error after $n$ steps.[^john]
- If $|\epsilon(n)|\approx n\epsilon$, the growth of error is said to be **linear**.
- If  $|\epsilon(n)|\approx K^n\epsilon$, the growth of error is called **exponential**.
  - If $K > 1$, the exponential error grows without bound as $n \to \infty$.
  - If $0 < K < 1$, the exponential error diminishes to zero as $n \to \infty$. 

[^john]: John H. Mathews and Kurtis D. Fink. Numerical Methods Using MATLAB.