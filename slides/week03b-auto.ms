
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 3
.SS Overview
.IT Declarations and definitions
.i1 \*[c]const\*[r]
.i1 \*[c]auto\*[r]
.IT Functions
.IT Scope
.IT Recursion
.SS Chapter review
.IT Big idea
.i1 What matters is how ideas can be expressed in code
.i2 not the individual language features
.IT Declarations
.i1 A \fIdeclaration\fR is a statement that introduces a name into a scope
.i2 specifying a type and optionally, an initializer
.i1 Before a name can be used in a C++ program, it must be declared
.i1 A declaration specifies \fIhow\fR something can be used
.i2 it specifies the interface for a function, variable, or class
.i1 In a header file the compiler reads the declarations it needs to understand our code
.IT Definitions
.i1 A \fIdefinition\fR is an implementation of a declaration
.i1 A declaration may also fully specify the entity declared 
.i2 This is called a \fIdefinition\fR
.bp
.IT Declarations and definitions
.i1 A \fIdefinition\fR of a variable allocates \fBmemory\fR for that variable
.i2 You cannot define a variable twice
.i2 In other words: You cannot allocate memory for the same name twice
.i1 The declaration/definition distinction 
.i2 Allows separating a program into many parts that can be compiled separately
.IT The \*[c]extern\*[r] keyword
.i1 States that a declaration is not a definition
.i1 Use sparingly.
.IT The \*[c]const\*[r] keyword
.i1 Constants have the same declaration syntax as variables 
.i2 They have \*[c]const\*[r] as part of their type and 
.i2 Require an initializer
.bp
.IT Functions
.i1 A function declaration with a body (a function body) is a function definition.
.i1 The key to managing declarations of facilities defined "elsewhere" in C++ is the header file.
.i1 The \fBstd_lib_facilities.h\fR header file from the text 
.i2 Common declarations used in the Programming Princliples book 
.i3 \*[c]cout\*[r], \*[c]vector\*[r], and \*[c]sqrt()\*[r], 
.i3 and a couple of simple utility functions 
.i3 I don't use it, but you should be aware it exists.
.i3 Some example code fromt he book needs it to compile.
.i3 The version on his website now only works with MS Visual Studio and old *nix compilers.
.i2 Most of the book examples in my github respository removed the dependency on \fCstd_lib_facilities.h\fR
.IT Scope
.i1 A scope is a region of program text. 
.i2 A variable or function declared in some scope
.i3 is valid (in scope) from the point of declaration to the end of that scope
.i1 Whenever you can, avoid complicated nesting of scopes. Keep it simple.
.SS Keyword: \fCextern\fP
.IT A major source of confusion!
.IT Primarily handy for global variables
.i1 You'll inherit code with globals, I'm sure
.i1 Prefer to minimize globals in your own code
.i1s
Declare the existence of a variable
.BI
in a header file
.R
.CW
  #ifndef HEADER_H
  #define HEADER_H

  \m[green]// any source file that includes this 
  // will be able to use "global_x"\m[]
  extern int global_x;

  void print_global_x();

  #endif
.R
.i1e
.i1 At this point, the compiler only knows the type and the name
.i2 We have \fIdeclared\fR, but not yet \fIdefined\fR \fCglobal_x\fR
.bp
.IT Now we need to define \fCglobal_x\fR
.i1s
We can define it in \fBonly 1 place\fR, or the compiler complains
.br
Source file 1:
.CW
  #include "header.h"
  \m[green]// it needs to be defined\m[]
  int global_x; \m[green]// but only once\m[]
  int main() {
      \m[green]// and initialized!\m[]
      global_x = 5;
      print_global_x();
  }
.R
.br
Source file 2:
.CW
  #include "header.h"
  #include <iostream>
  \m[green]// int global_x;  // this would be an error\m[]
  void print_global_x() {
      \m[green]// global_x is in scope everywhere!\m[]
      std::cout << global_x << std::endl;
  }
.R
.SS The \fCauto\fP keyword
.IT This may be 'old news', but here it is
.IT \*[c]auto\*[r] determines a type based on an initializer
.i1 This is a redefinition of what \*[c]auto\*[r] meant before C++11
.IT
General syntax: 
.CW
  auto x = initial_value;
.R

.IT
Prefer auto over explicit types:
.i1s 
Prefer 
.br
\fC  auto s = "Hello";\fR 
.br
over
.br
\fC  const char* s = "Hello";\fR
.i1e
.i1s
Prefer 
.br
\fC  auto w = get_widget(); \fR
.br
over
.br
\fC  widget w = get_widget();\fR
.i1e
.i1s
Prefer 
.br
\fC  for (const auto& c: my_string)\fR
.br
over
.br
\fC  for (int i = 0; i < my_string.size(); ++i)\fR
.i1e
.bp
.IT
If you must commit to a type:
.i1s
Prefer 
.br
\fC  auto e = employee{empid};\fR
.br
over
.br
\fC  employee e {empid};\fR
.i1e
.i1s
Prefer 
.br
\fC  auto w = widget {12, 34};\fR
.br
over
.br
\fC  widget w {12, 34};\fR
.i1e
.IT
In general:
.CW
   auto x = Type { init_value };
.R

.IT Although uncommon (and generally not needed) this syntax works with all C++ types.
.CW
   auto gamma = double { 0.57721566490 };
.R
.bp
.IT
Why is this useful?
.IT Guarantees:
.i1 \fBNo\fR implicit conversions
.i1 \fBNo\fR narrowing conversions
.i1 \fBNo\fR uninitialized variables
.IT And all your code looks much more consistent
.i1 It \fIis\fR much more consistent!!
.IT Easier to read, fewer bugs
.IT Avoid "C++ most vexing parse"
.IT Effective Modern C++
.i1 #5: Prefer auto to explicit type declarations
.i1s
#6: Use the explicit types initializer idiom when auto deduces undesired types
.CW
   auto x = Type { init_value };
.R
.i1e
.SS Recursion
.IT My expectation is this is a 'reminder'

.IT A text definition
.i1 A statement defined in terms of itself
.i1 For example,
.i2 An \fBIinteger literal constant\fR is either
.i3 A digit (one of 0,1,2,3,4,5,6,7,8,9), or
.i3 A digit followed by a \fBinteger literal constant\fR
.IT A math definition
.i1s
The N\*{th\*} Fibonacci number
.EQ
F sub n = F sub {n-1} + F sub {n-2} roman {", with "} F sub 1 = 1, F sub 2 = 1
.EN
.i1e
.IT A software definition
.i1 Any method that calls itself
.SS Definitions
.IT Recursive functions are not infinite loops
.i1 Base case
.i2 Provides final conditions
.i2 Values for which no recursion required
.i2 Prevents the definition from being completely circular
.i3 \fCF1 = 1, F2 = 1\fR
.i1 Recursive case
.i2 Implements the definition of the recursion
.i2 Typically a simple algorithm
.i2 Calls itself as part of the algorithm
.SS Recursive functions
.IT Two flavors
.IT Directly recursive
.i1 Function A calls A
.CW 
  long factorial(int n) {
    if (n == 1) return 1;
    return n * factorial (n-1);
  }
.R
.IT Indirectly recursive
.i1 Function A calls B (which calls C), which  calls A
.i2 Use sparingly!
.SS Usefulness
.IT Recursion is useful because it is often the simplest solution to a problem
.IT Aids in analysis
.IT It is often neither the most time or space efficient solution!
.IT But some compilers can create an iterative function form the recursive source
.i1 Typically the function needs to be \fItail recursive\fR
.i1 That is, the recursive call is the last line of the function
.SS When to use recursion
.IT Given some problem, \fIP\fR
.IT If there is a smallest problem of type \fIP\fR
.i1 Can solve directly and trivially
.i1 This is your base case
.IT For problems larger than the smallest type
.i1 Can the problem be broken into a smaller version of the same type of problem as \fIP\fR?
.i1 It \fBmust\fR approach the base case
.i1 This is your recursive case
.SS Recursion and iteration
.IT Recursion and iteration are equivalent
.i1 Any while loop 
.IT can be rewritten as a recursive function
.IT Any recursive function
.i1 Can be rewritten as a while loop
.IT Trade-offs
.i1 Recursive functions can be easier to write and understand
.i1 Fibonacci sequence, Towers of Hanoi, Grammar / Syntax checking
.IT Recursive solutions are (almost) guaranteed to use more memory and run more slowly
.i1 Some recursive solutions are impossible due to stack space limits
.i1 This 'rule' is language dependent (i.e. Scala, Smalltalk, LISP)
.IT Rule of thumb
.i1 If the recursive function is easy to write, use it
.i1 If time and space costs are important
.i2 Take the extra time to write an iterative equivalent
.SS Summary
.IT Big ideas
.i1 How \fBideas\fR are \fIexpressed\fR in \fBcode\fR
.i1 Declarations and definitions
.i1 Scope
.i2 \*[c]extern\*[r]
.IT Using \*[c]auto\*[r]
.i1 Prefer auto over explicit types
.i1 \*[c]auto\*[r] can make code easier to read
.i1 Use an explicit initializer when \*[c]auto\*[r] deduces an undesired type
.i1 We'll find more uses for auto later
.IT Recursive functions
.i1 vs. iterative functions
.i1 Base and recursive case

