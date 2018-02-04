# Understand template type deduction

## Item 01

From Effective Modern C++ by Scott Meyers (O’Reilly). 
Copyright 2015 Scott Meyers, 978-1-491-90399-5.

Main ideas:

- During template type deduction, arguments that are references are treated as
  non-references, i.e., their reference-ness is ignored.

- When deducing types for universal reference parameters, lvalue arguments get
  special treatment.

- When deducing types for by-value parameters, const and/or volatile arguments
  are treated as non-const and non-volatile.

- During template type deduction, arguments that are array or function names
  decay to pointers, unless they're used to initialize references.

