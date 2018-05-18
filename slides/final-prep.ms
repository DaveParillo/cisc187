.TL
.gcolor blue
Preparing for the final
.gcolor
.LP
.ce 1
Week 16
.SS What you need to know
.IT Major concepts
.i1 Iterators
.i1 Algorithms
.i1 Classes and class design
.i1 Memory management
.i1 Copying and Basic I/O
.SS Iterators
.IT How to iterate though a \*[c]std::set\*[r]
.i1 What operations are not allowed?
.i1 Differences between \*[c]std::set\*[r] and \*[c]std::multiset\*[r]
.i1 How to change sort order
.IT Given any container, what is the iterator type?
.IT Iterator operations
.IT End iterator is not part of the sequence
.IT Iterators and raw arrays
.IT Difference between
.i1 \*[c]std::begin\*[r], \*[c]rbegin\*[r] & \*[c]crbegin\*[r]
.i1 \*[c]std::end\*[r], \*[c]rend\*[r] & \*[c]crend\*[r]
.SS Algorithms
.IT What type is returned from \*[c]std::find\*[r]
.IT How to pass lambda expressions to algorithms
.IT Which algorithms modify elements, which don't
.IT Key Algorithms
.i1 \*[c]std::find\*[r], \*[c]std::find_if\*[r]
.i1 \*[c]std::count\*[r], \*[c]std::count_if\*[r]
.i1 \*[c]std::copy\*[r], \*[c]std::copy_if\*[r]
.i1 \*[c]std::generate\*[r], \*[c]std::iota\*[r], \*[c]std::transform\*[r]
.SS Classes
.IT Classes vs. structs
.i1 Private vs. public
.i1 \*[c]const\*[r] member functions
.IT Initializer list syntax
.IT Member access
.i1 Access reference type members
.i1 Access pointer type members
.IT Class templates
.i1 Recognize the syntax
.SS Inheritance and composition
.IT Correct syntax for public inheritance
.IT Inheritance means \fIIS-A\fR
.i1 Deriving a class froma non-virtual base mutable value class
.i2 Recall this breaks the equals contract
.IT Constructors
.i1 When are default constructors created?
.i1 When are default constructors \m[red]\fBnot\fP\m[] created?
.i1 Order constructors and destructors are called
.i2 Recall globals are created before main and destroyed after
.i1 Rule of 5/3/0
.i1 Access objects in a container of pointers to a base class
.IT Distinuish between
.i1 Construction
.i1 Copy construction
.i1 Copy assignment
.SS Overloads and virtual functions
.IT Signature for \*[c]std::ostream& operator<<(...\*[r]
.IT Function call operator overloads in classes
.i1 a.k.a Function Object / Functor
.IT How to pass a functor to an algorithm
.IT keyword \*[c]override\*[r]
.IT Shadowing
.SS Enumerated types
.IT C-style enums vs. class enums
.IT C-style enums 'gotchas'
.i1 Convert to int implicitly
.i1 Create a global name
.IT How to define and access class enums
.SS Memory management
.IT Pointer ownership
.i1 Pointer conversions - what compiles and what doesn't
.IT Destorying memory
.IT Pointer operations
.IT STL <memory> (\*[c]std::unique_ptr\*[r])
.IT Deep vs shallow copy, slicing
.IT What does \*[c]std::move\*[r] do?
.SS Basic I/O
.IT I/O stream concepts
.i1 You can't include void functions in an iostream
.IT Basic text formatted io. Recognise:
.i1 \*[c]std::ifstream is{"myfile.txt"};\*[r]
.i1 \*[c]while(is >> foo >> bar)\*[r] . . .
.IT How to declare a \*[c]std::stringstream\*[r]
.IT Return a \*[c]std::string\*[r] from a \*[c]std::stringstream\*[r]


.IT No serialization on the final

