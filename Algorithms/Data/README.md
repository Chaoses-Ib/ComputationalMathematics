# Data Types
[Wikipedia](https://en.wikipedia.org/wiki/Data_type#Composite_types)

A **data type** or simply type is an attribute of data which tells the compiler or interpreter how the programmer intends to use the data.

### Primitive data types
- Machine data types

  Machine data types need to be exposed or made available in systems or low-level programming languages, allowing fine-grained control over hardware.
- Boolean type
- Enumerations
- Numeric types
  - Integer data types
  - Floating point data types
  - Fixed point data types
  - Arbitrary-precision numeric types (bignums)
- String and text types

### Composite types
Composite types are derived from more than one primitive type. This can be done in a number of ways. The ways they are combined are called data structures.

- Array (or vector, list, sequence)

  An array stores a number of elements and provides random access to individual elements.

- Record (or tuple, struct)

  A record is a value that contains other values, typically in fixed number and sequence and typically indexed by names.

- Union

  A union type definition will specify which of a number of permitted primitive types may be stored in its instances, e.g. "float or long integer".

- Tagged union

  A tagged union (or variant, variant record, discriminated union, disjoint union) contains an additional field indicating its current type for enhanced type safety.

- Set

  A set is an abstract data structure that can store certain values, without any particular order, and no repeated values.

- Object

  An object contains a number of data fields, like a record, and also a number of subroutines for accessing or modifying them, called methods.

### [→Abstract Data Types](Abstract.md)

### Other types
Types can be based on, or derived from, the basic types explained above.

- Reference

  A reference is a value that enables a program to indirectly access a particular data, such as a variable's value or a record, in the computer's memory or in some other storage device.

  - Pointer

    Pointer is a data type whose value refers directly to (or "points to") another value stored elsewhere in the computer memory using its address.

- Function types

- Meta types

  Some programming languages represent the type information as data, enabling [type introspection](https://en.wikipedia.org/wiki/Type_introspection) and [reflection](https://en.wikipedia.org/wiki/Reflection_(computer_programming)). In contrast, higher order type systems, while allowing types to be constructed from other types and passed to functions as values, typically avoid basing computational decisions on them.

- Convenience types

  For convenience, high-level languages and databases may supply ready-made "real world" data types, for instance times, dates, and monetary values (currency).