
.TL
.gcolor blue
Function templates

and

Function overloads
.gcolor
.LP
.ce 1
Week 4
.SS Overview
.IT You have \fBalready\fR read the text
.IT Generic programming
.IT Function overloads
.IT Function templates
.SS Generic programming
.IT C provides only 2 ways to write \fIpolymorphic\fR code
.i1 Pointers and macros
.IT C++ provides more tools for writing reusable, polymorphic code
.IT Today we look at two of them
.i1 Function overloading
.i1 Function templates
.IT These two language features form the basis for 
.I
generic
.br
programming
.R 
in C++
.i1 When we get into classes, we will cover some more
.SS Function overloads
.IT In C++, two different functions can have the same name 
.i1 If their parameters are different 
.i2 Either because they have a different number of parameters, 
.i2 Or their parameters are of a different type. 
.i1s
For example
.CW
  #include <iostream>
  int operate (int a, int b) {
    return (a*b);
  }
  double operate (double a, double b) {
    return (a/b);
  }

  int main () {
    int x=5,y=2;
    double n=5.0,m=2.0;
    std::cout << operate (x,y) << '\\n';
    std::cout << operate (n,m) << '\\n';
  }
.R
.i1e
.IT This is a huge advantage over C
.i1 Where (nearly) every function is global
.i1 And every function name must be unique
.IT For example
.i1 7 different functions just for absolute value 
.i2 abs, llabs, fabs, fabsf, etc.
.i1 13 different functions for different types of division operation

.IT \fBNOTE\fR 
.i1 The return type is \fBnot\fR part of the overload
.i1 Two functions in the same namespace that differ only in return type will not compile
.SS Overload anti-patterns
.IT How many parameters are too many?
.i1s
For example
.CW
  int make_date (int day, int month, int year) { ...
.R
.i1e
.i1 Many parameters of the same type are easily mixed up
.i1 More parameters = more complexity
.i2 Limit the number of parameters you need in a given method, 
.i2 Or use a struct to combine parameters
.IT Be wary of overloads with the same number of parameters and different types
.i1s
For example
.CW
  int operate (double a, int b) { ...
  int operate (int a, double b) { ...
.R
.i1e
.i1 I \fIguarantee\fR you will invoke the wrong version on occasion

.SS Function templates
.IT Overloads help avoid writing many similar functions
.IT But there is still duplication to eliminate
.i1s
What if our functions do basically the same thing?
.CW
  #include <iostream>

  int sum (int a, int b) {
    return a+b;
  }

  double sum (double a, double b) {
    return a+b;
  }

  int main () {
    std::cout << sum (10,20) << '\\n';
    std::cout << sum (1.0,1.5) << '\\n';
  }
.R
.i1e
.bp
.IT In C++, we can define a \fItemplate\fR for a function
.i1 The template defines a function generating recipe 
.i1 Using a \fIgeneric type\fR as a placeholder
.IT New keyword: \*[c]template\*[r]
.i1 Followed by template parameters in angle brackets <>
.i1s
General form;
.CW
  template <template-parameters> function-declaration 
.R
.i1e
.IT Refactoring to a template
.i1 Using similarities of the two \*[c]sum\*[r] functions
.i1s
Identify the places where the types are duplicated:
.CW
  \m[red]int\m[] sum (\m[red]int\m[] a, \m[red]int\m[] b);

  \m[red]double\m[] sum (\m[red]double\m[] a, \m[red]double\m[] b);
.R

and replace with template parameters:
.CW
  \m[blue]template <class T>\m[]
  \m[red]T\m[] sum (\m[red]T\m[] a, \m[red]T\m[] b) {  
    return a+b;
  }
.R
.i1e
.SS Template identifiers
.IT The identifier 'T' is traditional placeholder for a generic type
.i1 But any valid variable name could be used
.i1s
Some examples:
.CW
  template <class AnyType>
  AnyType sum (AnyType a, AnyType b) {  
    return a+b;
  }

  template <class Addable>
  Addable sum (Addable a, Addable b) {  
    return a+b;
  }
.R
.i1e
.IT Templates are completely specified in header files normally
.i1 Placing the function defintion for a template in a cpp file is almost always an error.
.SS Using templated functions
.IT Not very different from a non-templated function
.i1s
You can explicitly provide the type
.CW
  int main () {
    std::cout << sum<int> (10,20) << '\\n';
    std::cout << sum<double> (1.0,1.5) << '\\n';

    \m[green]// or let the compiler deduce the type\m[]
    std::cout << sum (10,20) << '\\n';
    std::cout << sum (1.0,1.5) << '\\n';
    std::cout << sum (10,1.5) << '\\n';  \m[green]// error!\m[]

  }
.R
.i1e
.SS Multiple template parameters
.IT More than just 'T' is possible, of course!
\s-4
.CW
  #include <iostream>

  template <class T, class U>
  bool are_equal (T a, U b) {
    return (a==b);
  }
  int main () {
    if (are_equal(10,10.0)) {
      std::cout << "x and y are equal\\n";
    } else {
      std::cout << "x and y are not equal\\n";
    }
  }
.R
\s+4
.SS Non-type template parameters
.IT Not every template parameter has to be a class or a typedef
\s-4
.CW
  #include <iostream>

  template <class T, int N> T multiply (T val);

  int main() {
    std::cout << multiply<int,2>(10) << '\\n';
    std::cout << multiply<int,3>(10) << '\\n';
  }

  \m[green]// note the definition includes ALL of the declaration
  // including the template information \m[]
  template <class T, int N> T multiply (T val) {
    return val * N;
  }
.R
\s-4
.SS Concepts
.IT One things to be aware of with templates
.i1 When you declare a template with \*[c]class\*[r] or \*[c]typename\*[r]
.i1 Literally ANY \*[c]class\*[r] or \*[c]typename\*[r] could be passed in
.IT This is a weak area in templates and requires lots of messy defensive programming
.i1 What if your template assumes a type has a \fCpush_back()\fR function?
.IT In C++17 and C++20 two new ideas will enforce these types of template constraints
.SS Concepts and Requirements
.IT Concepts
.i1 Describes a \fBnamed set of requirements\fR for a type.
.i1 See: http://en.cppreference.com/w/cpp/concept
.IT Requires
.i1 A \fIrequires clause\fR is an additional constraint on template arguments or a function

.IT Currently, this is all part of an experimental techncial spec.

.IT Don't panic!
.i1 Concepts are not testable
.i2 But you should know the vocabulary exists
.SS Concepts example
.IT A 'cheater' way to use concepts
.i1 just define a name for \*[c]typename\*[r]
\s-4
.CW
  #include <iostream>
  #define Numeric typename

  \m[green]// Same template as before
  // 'typename' replaced with 'Numeric' \m[]
  template <Numeric T, int N> T multiply (T val) {
    return val * N;
  }
.R
\s-4

.IT We haven't really changed anything functional
.i1 Just made the source code indicate our \fIintent\fR
.SS Summary
.IT Templates and overloads 
.i1 The foundations for writing generic functions
.IT Valid overloads require different parameter lists
.IT New keyword: \*[c]template\*[r]
.IT Template type can be used like any other type
.i1 Return value
.i1 Type of local variable
.i1 Argument to another function
.IT Non-template arguments behave like function parameters
.IT Templates must be implemented in the include file

