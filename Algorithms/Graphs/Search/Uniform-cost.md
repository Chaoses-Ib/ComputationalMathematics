# Uniform-cost Search
[Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)

**Uniform-cost search (Dijkstra's algorithm)**

The evaluation of uniform-cost search is the cost of the path from the root to the current node.

Pesudocode[^ai-modern]:
```
function UNIFORM-COST-SEARCH(problem) returns a solution node, or failure
  return BEST-FIRST-SEARCH(problem, PATH-COST)
```

[^ai-modern]: Russell, Stuart J. Artificial Intelligence a Modern Approach. Pearson Education, Inc.,