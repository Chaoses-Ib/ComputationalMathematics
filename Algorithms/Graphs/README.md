# Graphs
[The Hunt for the Missing Data Type](https://www.hillelwayne.com/post/graph-types/) ([Hacker News](https://news.ycombinator.com/item?id=39592444))

[Are Graphs hard in Rust?](https://payasr.github.io/Are%20Graphs%20hard%20in%20Rust.pdf)

## Types
- Directed/undirected
- Simple/multi-edge
- Hypergraphs, where an edge can connect three or more nodes
- Ubergraphs, where edges can point to other edges

[Category:Extensions and generalizations of graphs - Wikipedia](https://en.wikipedia.org/wiki/Category:Extensions_and_generalizations_of_graphs)

## Representations
- Adjacency matrix: `[0 1 0; 0 0 1; 1 1 0]`
  - Suitable for dense graphs
- Adjacency list: `[[b], [c], [a, b]]`
- Edge list: `[[a, b], [b, c], [c, a], [c, b]]`
- Adjacency array
- Doubly connected edge list (DCEL)
- Pointer-and-struct
- A set of these structs with references to each other

> What about implementing node data? Edge data? Different types of nodes and edges? Most third party libraries roughly fall in one of two categories:
- Offer a single rich datatype that covers all use-cases at the cost of efficiency.
  - NetworkX stores graph as a dict of dicts of dicts, so that both nodes and edges can have arbitrary data.
- Offer separate graph types for each representation, and rely on the user to store node and edge data separately from the graph type.
  - petgraph

## Implementations
### Rust
- [petgraph: Graph data structure library for Rust.](https://github.com/petgraph/petgraph)
  - [Graph types](https://docs.rs/petgraph/latest/petgraph/index.html#graph-types)
    - [How can we define multiple edges between 2 nodes? - Issue #697](https://github.com/petgraph/petgraph/issues/697)
      - [Parallel Edges in GraphMap - Issue #459](https://github.com/petgraph/petgraph/issues/459)
    - Adjacency list/matrix

  [Graphs in Rust: An Introduction to Petgraph | Depth-First](https://depth-first.com/articles/2020/02/03/graphs-in-rust-an-introduction-to-petgraph/)
- [gryf: Graph data structure library aspiring to be convenient, versatile, correct and performant.](https://github.com/pnevyk/gryf)

  [Gryf - a new graph data structure library aspiring to be convenient, versatile, correct and performant : r/rust](https://www.reddit.com/r/rust/comments/13nons9/gryf_a_new_graph_data_structure_library_aspiring/)
- [gotgraph: A type-safe, scope-aware graph library that leverages Rust's type system to prevent common graph-related bugs at compile time](https://github.com/yasuo-ozu/gotgraph)
- [gamma: A graph library for Rust.](https://github.com/metamolecular/gamma) (discontinued)

  [Graphs in Rust: Introducing Gamma | Depth-First](https://depth-first.com/articles/2020/02/17/graphs-in-rust-introducting-graphcore/)
- [fast-graph: A fast, lightweight and extensible implementation of a graph data structure.](https://github.com/henke443/fast-graph) (discontinued)

  [fast-graph: A fast, lightweight and extensible implementation of a graph data structure. : r/rust](https://www.reddit.com/r/rust/comments/1bvbfhb/fastgraph_a_fast_lightweight_and_extensible/)

[pnevyk/rusty-graphs: Collection of examples for showcasing various Rust graph data structure libraries.](https://github.com/pnevyk/rusty-graphs)

### Python
- [graphlib: Functionality to operate with graph-like structures](https://docs.python.org/3/library/graphlib.html)
- [NetworkX: Network Analysis in Python](#networkx)
  - [rustworkx: A high performance Python graph library implemented in Rust.](https://github.com/Qiskit/rustworkx)
- [python-igraph: Python interface for igraph](https://github.com/igraph/python-igraph)
- [graph-tool: Efficent network analysis with python](https://graph-tool.skewed.de/)
- [EasyGraph: An open source graph processing library, which covers advanced graph processing methods in structural hole spanners detection, graph embedding and several classic methods.](https://github.com/easy-graph/Easy-Graph)

[Python Graph Libraries - Python Wiki](https://wiki.python.org/moin/PythonGraphLibraries)

#### [NetworkX](https://github.com/networkx/networkx)
[Tutorial](https://networkx.org/documentation/latest/tutorial.html)

[nx-guides](https://networkx.org/nx-guides/index.html)

Representations:
- A dict of dicts of dicts, so that both nodes and edges can have arbitrary data
- [`adjacency_matrix()`](https://networkx.org/documentation/stable/reference/generated/networkx.linalg.graphmatrix.adjacency_matrix.html#networkx.linalg.graphmatrix.adjacency_matrix)

`MultiGraph`:
- `add_edge()` can specify the keys used to distinguish multiedges between a pair of nodes.