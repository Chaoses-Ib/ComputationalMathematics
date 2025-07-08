# String-searching Algorithms
[Wikipedia](https://en.wikipedia.org/wiki/String-searching_algorithm)

**String-searching algorithms (string-matching algorithms)** are an important class of string algorithms that try to find a place where one or several strings (also called patterns) are found within a larger string or text.[^wiki]

- Naive
- DFA-based
- Stubs
  - Knuth-Morris-Pratt
  - Boyer-Moore
  - Baeza–Yates
- Index methods
  - Suffix tree / suffix array
- Fuzzy
  - Trigram search

[Exact String Matching Algorithms Animation in Java](http://www-igm.univ-mlv.fr/~lecroq/string/index.html)

Algorithm | Preprocessing time | Matching time | Space
--- | --- | --- | ---
Naïve algorithm | none | Θ(mn) | none
DFA | Θ(km) | Θ(n) | Θ(km)
Rabin-Karp | Θ(m) | Θ(n) in average<br />O(mn) at worst | O(1)
Knuth-Morris-Pratt | Θ(m) | Θ(n) | Θ(m)
Boyer-Moore | Θ(m + k) | Ω(n/m) at best<br />O(mn) at worst | Θ(k)
Boyer-Moore-Horspool | | Θ(n) in average<br />O(mn) at worst
Two-way algorithm | Θ(m) | O(n) | O(1)
Backward Non-Deterministic DAWG Matching (BNDM) | O(m) | Ω(n/m) at best<br />O(mn) at worst 
Backward Oracle Matching (BOM) | O(m) | O(mn)

## Boyer-Moore
[Wikipedia](https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_string-search_algorithm)

- Bad-character rule
- Good-suffix rule

## Unicode
[crates for text searching ? : r/rust](https://www.reddit.com/r/rust/comments/1boo2fb/crates_for_text_searching/)
> As far as I'm aware, there is no substring search algorithm that couples together the actual searching with something that is aware of these normal forms. It is for this reason that the typical way to go about this is to apply the same normalization to your needles and haystack before running the search.

## Libraries
C:
- `strstr()`/`memmem()`
  - glibc/musl: Two-way algorithm
  - MSVC: Naïve algorithm (with SIMD)[^ststr-msvc]

C++:
- `std::default_searcher`
  - MSVC: Naïve algorithm
    <details>

    VS 2022 17.1:
    ```cpp
    template <class _InIt1, class _InIt2, class _Pr>
    _NODISCARD _CONSTEXPR20 bool _Equal_rev_pred_unchecked(_InIt1 _First1, _InIt2 _First2, const _InIt2 _Last2, _Pr _Pred) {
        // compare [_First1, ...) to [_First2, _Last2)
        if constexpr (_Equal_memcmp_is_safe<_InIt1, _InIt2, _Pr>) {
    #if _HAS_CXX20
            if (!_STD is_constant_evaluated())
    #endif // _HAS_CXX20
            {
                return _Memcmp_ranges(_First2, _Last2, _First1) == 0;
            }
        }

        for (; _First2 != _Last2; ++_First1, (void) ++_First2) {
            if (!_Pred(*_First1, *_First2)) {
                return false;
            }
        }

        return true;
    }

    template <class _FwdItHaystack, class _FwdItPat, class _Pr>
    _NODISCARD _CONSTEXPR20 _FwdItHaystack search(_FwdItHaystack _First1, _FwdItHaystack _Last1, const _FwdItPat _First2,
        const _FwdItPat _Last2, _Pr _Pred) { // find first [_First2, _Last2) satisfying _Pred
        _Adl_verify_range(_First1, _Last1);
        _Adl_verify_range(_First2, _Last2);
        auto _UFirst1       = _Get_unwrapped(_First1);
        const auto _ULast1  = _Get_unwrapped(_Last1);
        const auto _UFirst2 = _Get_unwrapped(_First2);
        const auto _ULast2  = _Get_unwrapped(_Last2);
        if constexpr (_Is_random_iter_v<_FwdItHaystack> && _Is_random_iter_v<_FwdItPat>) {
            const _Iter_diff_t<_FwdItPat> _Count2 = _ULast2 - _UFirst2;
            if (_ULast1 - _UFirst1 >= _Count2) {
                const auto _Last_possible = _ULast1 - static_cast<_Iter_diff_t<_FwdItHaystack>>(_Count2);
                for (;; ++_UFirst1) {
                    if (_Equal_rev_pred_unchecked(_UFirst1, _UFirst2, _ULast2, _Pass_fn(_Pred))) {
                        _Seek_wrapped(_Last1, _UFirst1);
                        break;
                    }

                    if (_UFirst1 == _Last_possible) {
                        break;
                    }
                }
            }
        } else {
            for (;; ++_UFirst1) { // loop until match or end of a sequence
                auto _UMid1 = _UFirst1;
                for (auto _UMid2 = _UFirst2;; ++_UMid1, (void) ++_UMid2) {
                    if (_UMid2 == _ULast2) {
                        _Seek_wrapped(_Last1, _UFirst1);
                        return _Last1;
                    } else if (_UMid1 == _ULast1) {
                        return _Last1;
                    } else if (!_Pred(*_UMid1, *_UMid2)) {
                        break;
                    }
                }
            }
        }

        return _Last1;
    }
    ```
    </details>

- `std::boyer_moore_searcher`: Boyer-Moore
- `std::boyer_moore_horspool_searcher`: Boyer-Moore-Horspool
- [sse4-strstr: SIMD (SWAR/SSE/SSE4/AVX2/AVX512F/ARM Neon) of Karp-Rabin algorithm's modification](https://github.com/WojciechMula/sse4-strstr)

Rust:
- [`std::str::find()`](https://doc.rust-lang.org/std/primitive.str.html#method.find)
- regex
- [memchr: Optimized string search routines for Rust.](https://github.com/BurntSushi/memchr)

  [Memchr 2.4 now has an implementation of substring search on arbitrary bytes : rust](https://www.reddit.com/r/rust/comments/n3tfyx/memchr_24_now_has_an_implementation_of_substring/)
- [sliceslice: A fast implementation of single-pattern substring search using SIMD acceleration.](https://github.com/cloudflare/sliceslice-rs)
  - [Investigate performance differences with `memchr::memmem` implementation - Issue #40](https://github.com/cloudflare/sliceslice-rs/issues/40)
- [twoway: Twoway / Fast substring search for strings and byte strings (Rust) / Also assorted benchmarks and string search snippets](https://github.com/bluss/twoway)

## Benchmarks
- [sliceslice: A fast implementation of single-pattern substring search using SIMD acceleration.](https://github.com/cloudflare/sliceslice-rs#benchmarks)

  ![](https://raw.githubusercontent.com/cloudflare/sliceslice-rs/2871fa4463ebcf0cf1229387ea918c4aa8c61b8f/benchmarks.svg)


[^wiki]: [String-searching algorithm - Wikipedia](https://en.wikipedia.org/wiki/String-searching_algorithm)
[^ststr-msvc]: [c - Does strstr()'s implementation in gcc and VS have linear complexity? - Stack Overflow](https://stackoverflow.com/questions/22804988/does-strstrs-implementation-in-gcc-and-vs-have-linear-complexity)