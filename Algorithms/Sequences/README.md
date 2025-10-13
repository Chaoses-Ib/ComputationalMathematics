# Sequences
[Wikipedia](https://en.wikipedia.org/wiki/Sequence)

## Libraries
### Rust
- [slotmap: Slotmap data structure for Rust](https://github.com/orlp/slotmap)

  > Those solutions either can not reclaim memory from deleted elements or suffer from the ABA problem. The keys returned by `slotmap` are versioned. This means that once a key is removed, it stays removed, even if the physical storage inside the slotmap is reused for new elements. The key is a permanently unique\* reference to the inserted value. Despite supporting versioning, a [`SlotMap`](https://docs.rs/slotmap/latest/slotmap/struct.SlotMap.html "struct slotmap::SlotMap") is often not (much) slower than the alternative, by internally using carefully checked unsafe code. Finally, `slotmap` simply has a lot of features that make your life easy.
