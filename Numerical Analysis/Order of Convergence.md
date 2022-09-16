# Order of Convergence
A sequence $x_n$ that converges to $x^\*$ is said to have **order of convergence (收敛阶)** $q\ge 1$ and **rate of convergence (asymptotic error constant, 渐进误差常数)** $\mu$ if
$$\lim_{n\to\infty}{|x_{n+1}-x^\*| \over |x_n-x^\*|^q}=\mu$$
or
$$\lim_{n\to\infty}{e^{n+1} \over e_n^q}=\mu$$
where $e_n=|x^n-x^\*|$.

- 当 $q=1$ 时称为线性收敛，此时 $\mu<1$
- 当 $p>1$ 时称为超线性收敛
  - 当 $p=2$ 时称为二次收敛