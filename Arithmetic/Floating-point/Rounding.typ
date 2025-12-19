#import "@local/ib:0.1.0": *
#title[Rounding]
#a-badge[https://en.wikipedia.org/wiki/Rounding#Floating-point_rounding]

#quote[*Rounding* or *rounding off* is the process of adjusting a number
to an approximate, more convenient value, often with a shorter or simpler representation.]

#a[Why doesn't round have an argument for digits? - help - The Rust Programming Language Forum][https://users.rust-lang.org/t/why-doesnt-round-have-an-argument-for-digits/100688]

= Rounding modes
== Directed rounding to an integer
- *Rounding down* (take the *floor*, round toward negative infinity)
- *Rounding up* (take the *ceiling*, round toward positive infinity)
- *Rounding toward zero* (*truncate*, round away from infinity)
- *Rounding away from zero* (round toward infinity)

== Rounding to the nearest integer
- 各个语言的 `round()` 并不一致，同一语言的 `printf()`/`format()` 和 `round()` 也可能不一致。

  #a[Rounding Values in Different Programming Languages - Jasper Lammers][https://web.archive.org/web/20240525045922/http://jasperlammers.com/rounding-values-in-different-programming-languages/]

- Rounding half to even can be ad-hocly turned into rounding half up by `+ 0.0001`;
  and also `- 0.0001` for negatives for rounding half away from zero.

Modes:
- *Rounding half up*
  - Default rounding mode for:
    - Java
    - JS
    - PHP

- *Rounding half away from zero* (commercial rounding)
  - Free of overall positive/negative bias if the original numbers are positive or negative with equal probability. It does, however, still have bias away from zero.
  - It is often used for currency conversions and price roundings (when the amount is first converted into the smallest significant subdivision of the currency, such as cents of a euro) as it is easy to explain by just considering the first fractional digit, independently of supplementary precision digits or sign of the amount (for strict equivalence between the paying and recipient of the amount).
  - Default rounding mode for:
    - C/C++
      - `printf()` rounding mode is implementation-defined.

        #a[c - Why is printf round floating point numbers up? - Stack Overflow][https://stackoverflow.com/questions/24120888/why-is-printf-round-floating-point-numbers-up]
    - Rust
      - However, `std::fmt` uses #a[`round_ties_even()`][https://doc.rust-lang.org/std/primitive.f32.html#method.round_ties_even].

        #a[Float Display with fixed precision output uses inconsistent rounding rules - Issue \#70336 - rust-lang/rust][https://github.com/rust-lang/rust/issues/70336]
        - #a[Fix inconsistent rounding of 0.5 when formatted to 0 decimal places by ajtribick - Pull Request \#102935 - rust-lang/rust][https://github.com/rust-lang/rust/pull/102935]

        #a[rust - Format number by rounding up - Stack Overflow][https://stackoverflow.com/questions/69350790/format-number-by-rounding-up]

      #a[Tracking Issue for `round_ties_even` - Issue \#96710 - rust-lang/rust][https://github.com/rust-lang/rust/issues/96710]
    - Go
    - Swift
    - Python 2
    - Ruby
    - Perl
    - MATLAB

- *Rounding half to even* (convergent rounding, statistician's rounding, Dutch rounding, Gaussian rounding, odd–even rounding, or bankers' rounding)
  - This function minimizes the expected error when summing over rounded figures, regardless of the inputs being mostly positive or mostly negative, provided they are neither mostly even nor mostly odd.
  - Default rounding mode for:
    - IEEE 754 operations for results in binary floating-point formats
    - Python 3
    - .NET (C\#, VB.NET)
    - R
    - Delphi
