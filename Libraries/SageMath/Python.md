# Python
[Why Python?](https://doc.sagemath.org/html/en/tutorial/afterword.html#why-python)

## [Standalone Python/Sage scripts](https://doc.sagemath.org/html/en/tutorial/programming.html#standalone-python-sage-scripts)
```python
from sage.all import *
```

## [Pre-parser](https://doc.sagemath.org/html/en/tutorial/afterword.html#the-pre-parser-differences-between-sage-and-python)
Sage pre-parses all command lines before passing them to Python:
- Wrapping integer literals in `Integer( )` and making division a constructor for rational numbers

  Sage implements arbitrary precision integers using the GMP C-library, which are significantly faster than Python's native integers.
- Replacing instances of `^` that are not in strings with `**`

  The bitwise xor operator in Sage is `^^`.

## [Functions](https://doc.sagemath.org/html/en/tutorial/tour_functions.html)
- Python function
  ```python
  def f(z): return z^2
  ```
  These functions can be plotted, but not differentiated or integrated.

  Convert `f()` to a symbolic expression:
  ```python
  var('z')
  f(z)
  ```
- Callable symbolic expression
  ```python
  g(x) = x^2
  ```
  These can be plotted, differentiated, and integrated.
- Pre-defined Sage ‘calculus function’
  ```python
  sin
  ```
  These can be plotted, and with a little help, differentiated, and integrated.