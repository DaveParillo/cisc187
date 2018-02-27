
.TL
.gcolor blue
Pointers & lambda functions
.gcolor
.LP
.ce 1
Week 6
.SS Overview
.IT Constant pointers
.IT Function pointers
.IT Pointers to \*[c]void*\*[r]
.SS Constant pointers
.IT Pointers can be declared \*[c]const\*[r] 
.i1 Same as any other type 
.i1s
Where \*[c]const\*[r] appears controls what is constant
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

.SS Destroying memory
.IT Some noticed on Monday how easy it is to incorrectly cleanup 
pointers even when they are all in a single function
.i1s 
Consider the following:
\s-4
.CW
  \m[green]// calc returns a pointer to a double\m[]
  double* calc(int res_size, int max)
  \m[green]// the caller is responsible for the memory allocated for res\m[]
  {
    double* p = new double[max];        \m[green]//temp memory\m[]
    double* res = new double[res_size];
    \m[green]// use p to calculate results to be put in res\m[]
    delete[] p;    \m[green]// free temp memory \m[]
    return res;    \m[green]// can't free this here!\m[]
  }
  int main()
  {
    double* r = calc(100,1000);
    \m[green]// use r\m[]
    delete[] r;    \m[green]// easy to forget, error prone\m[]
  }
.R
.i1e
.IT Note
.i1 Deleting a \fInull pointer\fR does nothing
.CW
    double* d = nullptr;  \m[green]// C++11 preferred syntax\m[]
    double* x = 0;        \m[green]// 'classic' syntax\m[]
    delete d;
    delete d;
    delete d;   \m[green]// unlike a non-null, no crash\m[]
.R
\s+4
.SS void pointers
.IT \*[c]void*\*[r] means
.i1 Pointer to some memory the compiler doesn't know the type of
.i2 It is (almost) a raw machine address
.IT Legitimate uses
.i1 Calls between functions in different languages
.i1 Templates where the provided value could literally be \fIanything\fR
.i2 Like the actual implementation of \*[c]new\*[r] in C++
.IT Important!
.i1 \*[c]void*\*[r] is not the same as \*[c]void\*[r]
.i1s
There are no objects of type void
.CW
  int i;           \m[green]// declare an int\m[]
  void x;          \m[green]// error!  void is not a type\m[]
  void print();    \m[green]// function returns nothing\m[]
.R
.i1e
.i1s
\fBAny\fR pointer can be assigned to \*[c]void*\*[r]
.CW
  int*    i  = new int{5}; 
  double* x  = new double[10];
  int*    j  = i;             \m[green]// OK\m[]
  void*   p1 = i;             \m[green]// OK\m[]
  void*   p2 = d;             \m[green]// OK\m[]
  int*    i2 = p1;            \m[green]// error\m[]
.R
.i1e

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
.bp
.IT We can make use of this to store the address of the function
.i1s
Pointer to a function that returns an \*[c]int\*[r] and takes no parameters
.CW
  int (*ptr)();
.R
.i1e
.i2 The parentheses around \fC(p*ptr)\fR are required: operator precedence

.i1s
Pointer to a function that returns an \*[c]double\*[r] and takes two parameters
.CW
  double (*func)(int x, int y);
.R
.i1e
.IT Once you have a valid definition
.i1s
You can assign to it
.CW
  double add     (int x, int y) { return x+y;}
  double multiply(int x, int y) { return x*y;}
  double pi      ()             { return 3.14159265;}
  int main () {
    double (*func)(int x, int y) = add;
    cout << (*func)(2,3); \m[green]// prints 4\m[]
    func = multiply;
    cout << (*func)(2,3); \m[green]// prints 6\m[]
    func = pi;            \m[green]// error\m[]
    func = add();         \m[green]// error\m[]
  }
.R
.i1e
.bp
.IT This doesn't look like the initialization syntax we are used to
.i1s
C++11 \*[c]using\*[r] alias allows defining a name that refers to a previously defined type
.CW
  using func = double(*)(int x, int y);
.R
.i1e
.i1s
Consider the rot13 cipher example:
.CW
  \m[green]// a pointer to the function that will transform a character\m[]
  using transform = char (*)(const char c);
.R
.i1e
.i1s
And use it:
.CW
  void render_text(std::string message, transform handler) {
    for (const auto& c: message) {
        std::cout << handler(c);
    }
    std::cout << std::endl;
  }

  int main() {
    transform handler = rot13;
    render_text(message, handler);
  }
.R
.i1e
.i1 Whether you consider this an improvement is largely a matter of taste

.IT See week06 function pointer examples and jump table
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
 run_in_for_each(std::function<void (int)> func);
.R

This function can be called with any function or lambda
.i1e
.i2 That returns \*[c]void\*[r] and takes a single \*[c]int\*[r] parameter
.bp
.IT Suppose we implement \fCrun_for_each\fR
.i1s
Sample function definition
.CW
 void 
 run_in_for_each(std::function<void (int)> func) {
  vector<int> numbers{1, 2, 3, 4, 5};
  for_each(numbers.begin(), numbers.end(), func);
 }
.R
.i1e
.IT Once defined
.i1s
We can send different lambdas to the function
.CW
  auto func1 = [](int y) {
    cout << y << endl;
  };

  auto func2 = [](int z) {
    cout << z * 2 << endl;
  };

  run_in_for_each(func1);
  run_in_for_each(func2);
.R
.i1e
.SS Summary
.IT Destroy memory carefully
.i1 Too much gets you in as much trouble as too little
.i1 Memory leaks are the #1 source of bugs in C/C++ programs
.IT Pointers to \*[c]void*\*[r]
.i1 Use when you must, don't otherwise
.i2 You're giving up what little checking the compiler can do
.IT Using \fCstd::function\fR


