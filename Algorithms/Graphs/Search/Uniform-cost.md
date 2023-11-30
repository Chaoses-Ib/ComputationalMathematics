# Uniform-cost Search
[Wikipedia](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm)

**Uniform-cost search (Dijkstra's algorithm)**

The evaluation of uniform-cost search is the cost of the path from the root to the current node.

Pesudocode[^ai-modern]:
```
function UNIFORM-COST-SEARCH(problem) returns a solution node, or failure
  return BEST-FIRST-SEARCH(problem, PATH-COST)
```

```c
function Dijkstra(Graph, source):
    
    for each vertex v in Graph.Vertices:
        dist[v] ← INFINITY
        prev[v] ← UNDEFINED
        add v to Q
    dist[source] ← 0
    
    while Q is not empty:
        u ← vertex in Q with min dist[u]
        remove u from Q
        
        for each neighbor v of u still in Q:
            alt ← dist[u] + Graph.Edges(u, v)
            if alt < dist[v]:
                dist[v] ← alt
                prev[v] ← u

    return dist[], prev[]
```


[^ai-modern]: Russell, Stuart J. Artificial Intelligence a Modern Approach. Pearson Education, Inc.,