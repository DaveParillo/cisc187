
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 2
.SS Overview
.IT Chapter review
.IT Potentially useful information (backup slides)
.i1 Using \*[c]auto\*[r]
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
.i1 The \*[c]extern\*[r] keyword states that a declaration is not a definition
.i2 Use sparingly.  You'll see why in lab
.i1 The declaration/definition distinction 
.i2 Allows separating a program into many parts that can be compiled separately
.i1 Constants have the same declaration syntax as variables 
.i2 but they have \*[c]const\*[r] as part of their type and require an initializer
.i1 A function declaration with a body (a function body) is a function definition.
.i1 The key to managing declarations of facilities defined "elsewhere" in C++ is the header file.
.i1 The \fBstd_lib_facilities.h\fR header file from the text 
.i2 Common declarations used in the book 
.i3 \*[c]cout\*[r], \*[c]vector\*[r], and \*[c]sqrt()\*[r], 
.i3 and a couple of simple utility functions 
.i3 I don't use it, but you should be aware it exists.
.bp
.IT Scope
.i1 A scope is a region of program text. 
.i2 A variable or function declared in some scope
.i3 is valid (in scope) from the point of declaration to the end of that scope
.i1 Whenever you can, avoid complicated nesting of scopes. Keep it simple.
.SS Keyword: extern
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
We can define it in only 1 place, or the compiler complains
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
.SS Summary
.IT Big ideas
.i1 How \fBideas\fR are \fIexpressed\fR in \fBcode\fR
.i1 Declarations and definitions
.i1 Scope
.i2 \*[c]extern\*[r]
.IT Functions
.i1 Keep them short
.i1 Avoid \fIpremature optimization\fR
.i1 Avoid \fIpremature pessimization\fR
.SS Backups
.DS
Useful information to follow

Read and ask questions if you have any.
.DE

.SS "The \fCauto\fP keyword"
.IT This may be 'old news', but here it is
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
.IT
In general: 
.CW

  auto x = initial_value;
.R
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
.bp
.IT
Why do I care?
.IT Guarantees:
.i1 \fBNo\fR implicit conversions
.i1 \fBNo\fR narrowing conversions
.i1 \fBNo\fR uninitialized variables
.IT And all your code looks much more consistent
.i1 It \fIis\fR much more consistent!!
.IT Easier to read, fewer bugs
.IT Avoid "C++ most vexing parse"
.IT Summary
.i1 #5: Prefer auto to explicit type declarations
.i1s
#6: Use the explicit types initializer idiom when auto deduces undesired types
.CW
   auto x = Type { init_value };
.R
.i1e
.SS Summary
.IT Using \*[c]auto\*[r]
.i1 Prefer auto over explicit types
.i1 \*[c]auto\*[r] can make code easier to read
.i1 Use an explicit initializer when \*[c]auto\*[r] deduces an undesired type

