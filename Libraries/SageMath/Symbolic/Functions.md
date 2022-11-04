# Symbolic Functions
- Python function
  ```python
  def f(z): return z^2

  f = lambda z: z^2
  ```
  These functions can be plotted, but not differentiated or integrated.

  Convert `f()` to a symbolic expression:
  ```python
  var('z')
  f(z)
  ```
- [Symbolic expression](Expressions.md#symbolic-expressions)
  
  These can be plotted, differentated, and integrated.
- [Callable symbolic expression](Expressions.md#callable-symbolic-expressions)
  
  These can be plotted, differentiated, and integrated.
- Formal symbolic function
  ```python
  function('f')(x)
  ```
- Pre-defined Sage ‘calculus function’
  ```python
  sin
  ```
  These can be plotted, and with a little help, differentiated, and integrated.

[Some Common Issues with Functions - Tutorial](https://doc.sagemath.org/html/en/tutorial/tour_functions.html)