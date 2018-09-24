
.TL
.gcolor blue
Pointers & function pointers
.gcolor
.LP
.ce 1
Week 6
.SS Overview
.IT Constant pointers
.IT Using void pointers
.IT Function pointers
.SS Constant pointers
.IT Pointers can be declared \*[c]const\*[r] 
.i1 Same as any other type 
.i1s
\fBWhere\fR \*[c]const\*[r] appears controls \fBwhat\fR is constant
\s-4
.CW
    int x;
          int *       p1 = &x;  \m[green]// non-const pointer to non-const int\m[]




.R
\s+4
.i1e
.i1 In p1, either the pointer or the value being pointed to can change
.bp
.IT Pointers can be declared \*[c]const\*[r] 
.i1 Same as any other type 
.i1s
\fBWhere\fR \*[c]const\*[r] appears controls \fBwhat\fR is constant
\s-4
.CW
    int x;
          int *       p1 = &x;  \m[green]// non-const pointer to non-const int\m[]
    const int *       p2 = &x;  \m[green]// non-const pointer to const int\m[]



.R
\s+4
.i1e
.i1 In p1, either the pointer or the value being pointed to can change

.i1 For p2, the pointer can be reassigned, but x cannot be modified
.bp
.IT Pointers can be declared \*[c]const\*[r] 
.i1 Same as any other type 
.i1s
\fBWhere\fR \*[c]const\*[r] appears controls \fBwhat\fR is constant
\s-4
.CW
    int x;
          int *       p1 = &x;  \m[green]// non-const pointer to non-const int\m[]
    const int *       p2 = &x;  \m[green]// non-const pointer to const int\m[]
          int * const p3 = &x;  \m[green]// const pointer to non-const int\m[]


.R
\s+4
.i1e
.i1 In p1, either the pointer or the value being pointed to can change

.i1 For p2, the pointer can be reassigned, but x cannot be modified

.i1 For p3, the pointer can't be reassigned, but x can change
.bp
.IT Pointers can be declared \*[c]const\*[r] 
.i1 Same as any other type 
.i1s
\fBWhere\fR \*[c]const\*[r] appears controls \fBwhat\fR is constant
\s-4
.CW
    int x;
          int *       p1 = &x;  \m[green]// non-const pointer to non-const int\m[]
    const int *       p2 = &x;  \m[green]// non-const pointer to const int\m[]
          int * const p3 = &x;  \m[green]// const pointer to non-const int\m[]
    const int * const p4 = &x;  \m[green]// const pointer to const int\m[]

.R
\s+4
.i1e
.i1 In p1, either the pointer or the value being pointed to can change

.i1 For p2, the pointer can be reassigned, but x cannot be modified

.i1 For p3, the pointer can't be reassigned, but x can change

.i1 In p4, both are held constant
.SS Using void pointers
.IT The compiler can't know the size of the value pointed to
.i1s
\*[c]void\*[r] isn't a type, so it has no size
.CW
  int*    i = new int{5}; 
  void*   p = i;             \m[green]// OK\m[]
  int*    j = p;             \m[green]// error\m[]
.R
.i1e
.IT We have to give the compiler size information
.IT Use one of C++ \fIcasts\fR to convert \*[c]void*\*[r]
.i1s
To another pointer type that has a size
.CW
  \m[green]// explicit conversion with cast\m[]
  int*    j = static_cast<int*>(p);
.R
.i1e
.SS Pointers to functions
.IT In C++ you can point to anything with an address
.i1 Global variables
.i1 Stack and free store variables
.i1 Functions
.i2 Recall that when called, an activation record for a function is pushed onto the execution stack
.IT This means every function has an address
.i1s
What does this do?
.CW
  int foo() {
    return 5;
  }
  int main() {
    std::cout << foo;
  }
.R
.i1e
.i1 Hint: It doesn't call the function foo

.IT When a function is called using \*[c]operator()\*[r]
.i1 Execution jumps to the \fIaddress\fR of the function being called
.i2 Technically, the address of the activation record
.bp
.IT We can make use of this to store the address of the function
.i1s
A pointer to a function that returns an \*[c]int\*[r] and takes no parameters
.CW
  int (*ptr)();
.R
.i1e
.i2 The parentheses around \fC(*ptr)\fR are required: operator precedence

.i1s
A pointer to a function that returns an \*[c]double\*[r] and takes two parameters
.CW
  double (*func)(int x, int y);
.R
.i1e
.IT Once you have a valid definition
.i1s
You can assign to it to variables or use it directly.
.SS Using function pointers
.IT Given the following functions:
.i1s
Two functions that take a pair of ints and return a double
.CW
  double add     (int x, int y) { return x+y;}
  double multiply(int x, int y) { return x*y;}
.R
.i1e

.bp
.IT We can assign a function to a variable:
.i1s
Assign \*[c]add\*[r] and \*[c]multiply\*[r] to the variable \*[c]func\*[r]
.CW
  double add     (int x, int y) { return x+y;}
  double multiply(int x, int y) { return x*y;}


  int main () {
    \m[green]// doesn't look like variable initialization!\m[]
    double (*func)(int x, int y) = add;
    cout << (*func)(2,3); \m[green]// prints 4\m[]

    func = multiply;      \m[green]// reassign func\m[]
    cout << (*func)(2,3); \m[green]// prints 6\m[]
  }
.R
.i1e

.bp
.IT We can assign a function to a variable:
.i1s
Common errors
.CW
  double add     (int x, int y) { return x+y;}
  double multiply(int x, int y) { return x*y;}
  double pi      ()             { return 3.14159265;}

  int main () {
    \m[green]// doesn't look like variable initialization!\m[]
    double (*func)(int x, int y) = add;
    cout << (*func)(2,3); \m[green]// prints 4\m[]

    func = multiply;      \m[green]// reassign func\m[]
    cout << (*func)(2,3); \m[green]// prints 6\m[]

    func = add();         \m[green]// error\m[]
    func = pi;            \m[green]// error\m[]
  }
.R
.i1e
.i1 Errors 
.i2 Using function call operator \*[c]operator()\*[r] when using function pointer
.i2 Using or passing function pointers with mismatched signature
.bp
.IT This doesn't look like the initialization syntax we are used to
.IT We can simplify this a bit with a \*[c]using\*[r] statement
.i1s
C++11 \*[c]using\*[r] alias allows defining a name that refers to a previously defined type
.CW
  \m[green]// Looks more like variable initialization\m[]
  using func = double(*)(int x, int y);
.R
.i1e

.i1s
The rot13 cipher example source uses this technique:
.CW
  \m[green]// a pointer to the function that\m[]
  \m[green]// transforms a character\m[]
  using transform = char (*)(const char c);
.R
.i1e
.IT \*[c]transform\*[r] is the name of a variable
.i1 That points to a function that takes a \*[c]const char\*[r]
.i1 And returns a \*[c]char\*[r]
.bp
.IT The \*[c]using\*[r] statement is one way to simplify our call syntax
.i1 and signals our intent
.i2 but obscures the fact that handler is a function
.i1s
Use it like this:
.CW
  void render_text(string message, 
                   transform handler) 
  {
    for (const auto& c: message) {
        cout << handler(c);
    }
    cout << endl;
  }

  int main() {
    transform handler = rot13;
    render_text(\m[green]"Howdy"\m[], handler);
  }
.R
.i1e
.i1 Whether you consider this an improvement is largely a matter of taste
.i1 See week06 function pointer examples and jump table
.SS std::function wrapper
.IT Allows standardized way to pass around
.i1 Function pointers and other function-like objects
.IT \*[c]std::function\*[r] added in C++11
.i1 \*[c]#include <functional>\*[r]
.i1 Provides a more explicit method for passing functions
.i1s
The return type and parameters are template parameters
.CW
 void 
 apply_func(const vector<int>& v, 
            function<double (int)> func);
.R

The \fCapply_func\fR function can be passed any function or lambda
.i1e
.i2 That returns \*[c]double\*[r] and takes a single \*[c]int\*[r] parameter
.bp
.IT Suppose we implement \fCapply_func\fR
.i1s
Sample function definition
.CW
  void
  apply_func(const vector<int>& numbers, 
                   function<double (int)> func) {
    for (auto n: numbers) {
      cout << func(n) << endl;
    }
  }
.R
.i1e
.bp
.IT Once defined
.i1s
We can send different functions to apply_func
.CW
  double pi_multiple (int y) {
    static constexpr double pi = 3.141592653;
    return pi * y;
  }

  double square (int z) {
    return z * z;
  }

  int main() {
    vector<int> v = {1,2,3,4,5};
    apply_func(v, pi_multiple);
    apply_func(v, square);
  }
.R
.i1e
.SS Summary
.IT Pointers and \*[c]const\*[r]
.i1 Where \*[c]const\*[r] appears controls what is constant
.IT Pointers to \*[c]void*\*[r]
.i1 Can assign anything to \*[c]void*\*[r]
.i2 Must cast to associate size with \*[c]void*\*[r]
.IT Function pointers
.i1 Traditional syntax
.i1 C++11 \*[c]std::function\*[r] syntax


