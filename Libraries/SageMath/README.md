# [SegaMath](https://www.sagemath.org/)
[GitHub](https://github.com/sagemath/sage)

Mission: Creating a viable free open source alternative to Magma, Maple, Mathematica and Matlab.

[Documentation](https://doc.sagemath.org/):
- [Quickstart](https://www.sagemath.org/tour-quickstart.html)
- [A Tour Of Sage](https://doc.sagemath.org/html/en/a_tour_of_sage/index.html)
- **[Tutorial](https://doc.sagemath.org/html/en/tutorial/index.html)**
- **[Constructions](https://doc.sagemath.org/html/en/constructions/index.html)**
- **[Reference Manual](https://doc.sagemath.org/html/en/reference/index.html)**
- [Help](https://www.sagemath.org/help.html)

## User interfaces
- Jupyter Notebook
  ```sh
  sage -n
  ```
  or
  ```sh
  sage --notebook=[default|jupyter|jupyterlab|export]
  ```
- IPython shell
  ```sh
  sage
  ```
- [Python scripts](Python.md)
  ```python
  from sage.all import *
  ```

## Comparisons
- Sage is free and open-source.
- Sage uses Python, while MATLAB, Mathematica and Maple use their proprietary languages.
- > In certain areas of mathematics such as Number Theory and Group Theory, Sage’s core capabilities greatly exceed those of Mathematica, to the best of my knowledge.[^cmp-quora-2019]
- Sage has a low priority for Windows support.
- > Sage + Jupyter does not provide typesetting capabilities of Mathematica notebooks, i.e., write formulas naturally, with all subscripts and superscripts.[^cmp-quora-2019]
- Sage has lower performance than MATLAB.
- [Why isn't Sage just part of Octave?](http://sagemath.blogspot.com/2007/12/why-isnt-sage-just-part-of-octave.html)

[^cmp-quora]: [Mathematics Software: Why isn't SAGE becoming as popular as MATLAB or Mathematica? - Quora](https://www.quora.com/Mathematics-Software-Why-isnt-SAGE-becoming-as-popular-as-MATLAB-or-Mathematica)
[^cmp-quora-2019]: [What are advantages of SAGE vs Mathematica in late 2019? - Quora](https://www.quora.com/What-are-advantages-of-SAGE-vs-Mathematica-in-late-2019)