# Suffix Trees
[Wikipedia](https://en.wikipedia.org/wiki/Suffix_tree)

> A suffix tree (also called PAT tree or, in an earlier form, position tree) is a compressed trie containing all the suffixes of the given text as their keys and positions in the text as their values.

## Applications
> Suffix trees can be used to solve a large number of string problems that occur in text-editing, free-text search, [computational biology](https://en.wikipedia.org/wiki/Computational_biology "Computational biology") and other application areas. Primary applications include:
- [String search](https://en.wikipedia.org/wiki/String_search#Index_methods), in *O*(*m*) complexity, where *m* is the length of the sub-string (but with initial *O*(*n*) time required to build the suffix tree for the string)
- [Finding the longest repeated substring](../../../Sequences/Substrings/Repeat/README.md)
- Finding the longest common substring
- Finding the longest [palindrome](https://en.wikipedia.org/wiki/Palindrome "Palindrome") in a string

> Suffix trees are often used in [bioinformatics](https://en.wikipedia.org/wiki/Bioinformatics "Bioinformatics") applications, searching for patterns in [DNA](https://en.wikipedia.org/wiki/DNA "DNA") or [protein](https://en.wikipedia.org/wiki/Protein "Protein") sequences (which can be viewed as long strings of characters). The ability to search efficiently with mismatches might be considered their greatest strength. Suffix trees are also used in [data compression](https://en.wikipedia.org/wiki/Data_compression "Data compression"); they can be used to find repeated data, and can be used for the sorting stage of the [Burrows--Wheeler transform](https://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform "Burrows--Wheeler transform"). Variants of the [LZW](https://en.wikipedia.org/wiki/LZW "LZW") compression schemes use suffix trees ([LZSS](https://en.wikipedia.org/wiki/LZSS "LZSS")). A suffix tree is also used in [suffix tree clustering](https://en.wikipedia.org/wiki/Suffix_tree_clustering "Suffix tree clustering"), a [data clustering](https://en.wikipedia.org/wiki/Data_clustering "Data clustering") algorithm used in some search engines.

## Implementations
### Rust
- [BurntSushi/suffix: Fast suffix arrays for Rust (with Unicode support).](https://github.com/BurntSushi/suffix)
  - [proycon/lexmatch: Simple lexicon matcher against a text](https://github.com/proycon/lexmatch)
- [TravisWheelerLab/sufr: Parallel Construction of Suffix Arrays in Rust](https://github.com/traviswheelerlab/sufr)
- [hucsmn/suffix\_array: suffix array construction and searching algorithms for in-memory binary data.](https://github.com/hucsmn/suffix_array) ([Docs.rs](https://docs.rs/suffix_array/latest/suffix_array/))
- [mov-rax-rbx/Suffix-Collections: Fast realization of suffix array and suffix tree for substring search, longest common prefix array (lcp array)](https://github.com/mov-rax-rbx/suffix-collections)
- [rust-bio/src/data\_structures/suffix\_array.rs at master - rust-bio/rust-bio](https://github.com/rust-bio/rust-bio/blob/master/src/data_structures/suffix_array.rs)
- [EgorGorshen/suffix-tier: Suffix trie for searching](https://github.com/EgorGorshen/suffix-tier)
- [generalized\_suffix\_tree - Rust](https://docs.rs/generalized_suffix_tree/latest/generalized_suffix_tree/)
