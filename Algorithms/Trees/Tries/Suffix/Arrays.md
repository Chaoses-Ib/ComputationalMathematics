# Suffix Arrays
[Wikipedia](https://en.wikipedia.org/wiki/Suffix_array)

> Suffix arrays are closely related to suffix trees:
> - Suffix arrays can be constructed by performing a depth-first traversal of a suffix tree. The suffix array corresponds to the leaf-labels given in the order in which these are visited during the traversal, if edges are visited in the lexicographical order of their first character.
> - A suffix tree can be constructed in linear time by using a combination of suffix array and LCP array. For a description of the algorithm, see the corresponding section in the LCP array article.
> 
> It has been shown that every suffix tree algorithm can be systematically replaced with an algorithm that uses a suffix array enhanced with additional information (such as the LCP array) and solves the same problem in the same time complexity. Advantages of suffix arrays over suffix trees include improved space requirements, simpler linear time construction algorithms (e.g., compared to Ukkonen's algorithm) and improved cache locality.

## [→Implementations](../README.md#implementations)
