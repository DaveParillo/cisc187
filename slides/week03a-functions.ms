
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 3
.SS Overview
.IT You have \fBalready\fR read the text
.IT Transitioning to Modern C++
.IT Using \*[c]const\*[r]
.IT Passing parameters and return values
.IT Using \*[c]namespace\*[r]s
.IT A word about the compiler...

.SS Transitioning to Modern C++
.IT C is a fairly simple language
.IT All it really offers is 
.i1 fundamental types, macros, pointers, structs, arrays, and functions.
.IT All problems in C get solved using these basic constructs
.IT These tools still exist in C++
.i1 But there are \fImany\fR more tools in C++
.i2 Especially in the standard library: the STL
.i1 Only functions don't have C++ 'replacements'
.IT The trick is to know when to use them
.i1 Generally, the alternatives in C++ are improvements
.i2 Assuming code clarity, maintenance, and type safety are key goals
.IT In general
.i1 I don't often say 'never do this' or 'never use that'
.i1 Rather: \fBprefer\fR \fIthis\fR over \fIthat\fR.
.SS What is preferred
.IT Small functions over large ones
.IT \*[c]const\*[r] and \*[c]constexpr\*[r] over \*[c]#define\*[r]
.i1 When creating constants
.IT \*[c]vector\*[r] as a container over \*[c]array\*[r]
.IT Range-for loops over manual iteration
.SS Functions
.IT A group of statements that work together to perform a task
.i1 A function has a \fIname\fI
.i1 It may optionally take \fIparameters\fR
.i1 It may optionally return a value
.i1s
For example
.CW
 return_type function_name (argument list)
 {
    \m[green]// zero or more statements\m[]
 }
.R
.i1e
.IT Once defined, a function can be called
.i1 And its task can be executed as often as needed
.i1 See \fCexamples/week03/add.cpp\fR and \fCcall-stack.cpp\fR 
.SS "Passing parameters"
.IT In C, parameter passing defaults to \fIpass by value\fR
.i1 See \fCexamples/week03\fR
.IT Unless you specify otherwise 
.i1 Function parameters are initialized with \fIcopies\fR of the actual arguments, 
.i1 Function callers get back a copy of the value returned by the function
.IT For large / complex data types, this becomes expensive even in small programs
.IT
Prefer passing references over pass by value:
.i1 Effective C++ #22: Prefer pass-by-reference to pass-by-value
.i1s 
For example, we prefer 
.br
\s-4\fC  mesa::Student get_student (const std::string& name);\fR 
.br
over
.br
\fC  mesa::Student get_student (const std::string name);\fR \s+4
.i1e
.IT Finally
.i1 Don't return a reference when you must return a value
.i1 In other words
.i2 Don't go so crazy on pass-by-reference that you strive to \fInever\fR return a value
.SS General function writing guidelines
.IT Write for clarity and correctness \fBfirst\fR

.IT Avoid \fIpremature optimization\fR

.IT Avoid \fIpremature "pessimization"\fR
.i1 That is, prefer faster when \fBequally\fR clear
.IT Minimize side-effects
.i1 See \fCexamples/week03/anti-patterns/side-effects\fR
.bp
.IT Keep functions short
.i1 A function should do \fIone\fR thing well
.i2 If you see a function doing more then one thing
.i3 Consider breaking it up into multiple functions
.i1 Is this (slightly) more work?
.i2 In the short run, maybe.
.i2s 
In the long run, your total time spent 
.br
debugging, testing, maintaining, and modifying
.br
will be far, far less than if you packed everything into one monster function
.i2e
.i2 Unit testing is practically impossible once functions reach a certain size.
.IT Strive to write a function \fIonce\fR and never have to touch it again.
.IT Check function parameters for validity
.i1 Unless you \fIcompletely\fR trust the caller (and their caller...)
.i2 Capt. Obvious says: do not trust \fCargv[]\fR
.SS Using const
.IT Use \*[c]const\*[r] to instruct the compiler to hold something constant
.IT The \*[c]const\*[r] keyword can modify the behavior of anything, depending on where it is used
.i1 fundamental types
.i1 structs or classes
.i1 functions and function parameters
.i1 pointers and references 
.i2 or the values stored in pointers and references
.IT C99 added the \*[c]const\*[r] keyword, so now it's in both languages
.i1 But you don't see it nearly as often in C
.i1 Many programmers use \*[c]#define\*[r] instead
.i1 Prefer \*[c]const\*[r] to \*[c]#define\*[r] 
.i1s
\*[c]const\*[r] is part of a type
.CW
  const double pi = 3.1415926;
  double   two_pi = pi * 2.0;
  two_pi = pi + 2.0;  \m[green]// OK, sadly\m[]
  pi     = 3.14;      \m[green]// luckily, a compile error\m[]

.R
.i1e
.SS Using const with parameters
.IT \*[c]const\*[r] can be provided as part of a function signature
.IT Tells the compiler a parameter may not be modified
.i1s
These variables are defined and can be used, but not changed
.CW
  int add(const int& x, const int& y) {
    return x+y;
  }
.R
.i1e

.i1s
This is a compile error
.CW
  int add(const int& x, const int& y) {
    ++x; ++y;
    return x+y;
  }
.R
.i1e

.SS \s-8Use \fCconst\fP and \fCconstexpr\fP whenever possible\s+8
.IT \fIEffective C++\fR item #21 and \fIEffective Modern C++\fR item #15 
.IT The term for using \*[c]const\*[r] correctly is called \fIconst-correctness\fR
.IT \*[c]constexpr\*[r] was added in C++11
.i1 But still pretty limited in C++11 - far more powerful and flexible in C++14 and 17
.IT There is enough going on with \*[c]const\*[r] that we will be re-visiting it many times throughout the semester.
.IT Guidelines for now
.i1 When creating local variables
.i2 Ask: "Should this variable ever change?"
.i3 If the value can be evaluated at compile time, consider \*[c]constexpr\*[r] 
.i3 Otherwise, consider \*[c]const\*[r]
.i1 When passing parameters to functions
.i2 Prefer passing by \*[c]const\*[r] reference
.i3 Applies only to object types
.i3 Avoids making an extra (unneeded) copy
.i3 Prevents unintended modification

.SS Partition the global namespace
.IT Effective C++ #28
.IT The main problem with the global namespace?
.i1 There is only 1 of them
.i1 Name conflicts can be common on large projects
.i1 Complicates mixing third party libraries
.IT \fIWell-behaved\fR third party libraries will not put much (if anything) in the global namespace.
.IT A word about namespaces for you java programmers...
.IT Namespaces are not packages
.i1 Java packages enforce a class taxonomy
.i1 This is \fInot\fR the case in C++
.i1 A class taxonomy is neither required \fInor desired\fR in C++
.IT Keep C++ namespaces simple

.SS Using namespaces
.IT What's wrong with \*[c]using namespace std;\*[r]?
.i1 Nothing, technically.
.i1 It was a simplification in your first semester classes
.i2 To avoid 'burdening' you with having to care about this technical detail
.IT \fIBUT\fR
.i1 Realize the standard namespace is huge
.i2 It contains thousands of classes and functions
.IT If you do use \*[c]using namespace std;\*[r], then
.i1 All of these names are now 'out of bounds'
.i1 You can't use them yourself
.i1 \fBAnd\fR avoid a conflict (name clash) with something already defined in the standard namespace
.IT If this doesn't bother you, then go right ahead
.IT You have been warned!
.SS Compiling functions (and other code)
.IT Prefer compile-time and link-time errors to runtime errors
.i1 Effective C++ item #46
.IT C++ doesn't offer much of a 'safety net'
.i1 Once past the compiler you are on your own
.i2 The things we got away with in the week 1 lab hopefully convinced you...
.IT Pay attention to compiler warnings
.i1 Effective C++ item #48
.IT Many projects ignore compiler warnings or turn them off
.i1 Compilers and their warnings get better constantly
.i1 We already know that once past the compiler, you're on your own
.i1 Ignoring warnings effectively throws away a powerful resource
.IT It's important to understand what the compiler is trying to tell you
.i1 But don't use the compiler as a syntax checker
.i2 i.e. don't over rely on it to do your syntax checking for you
.i2 You're supposed to be the programmer here!
.SS Summary
.IT Functions
.i1 Keep them short
.i1 Avoid \fIpremature optimization\fR
.i1 Avoid \fIpremature pessimization\fR
.IT Split large problems into small ones
.i1 This takes practice
.IT Prefer \fCconst\fP 
.i1 Use \*[c]const\*[r] and \*[c]constexpr\*[r] whenever possible
.IT Parameter passing
.IT Namespaces
.i1 Use namespaces - they are your friends
.i1 Avoid \*[c]using namespace std;\*[r] 
.i1 \fBNever\fR put \*[c]using namespace std;\*[r] in a header file!
.IT Compiler warnings
.i1 Pay attention to compiler warnings
.i1 Prefer compile-time and link-time errors to runtime errors

