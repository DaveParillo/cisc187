
.TL
.gcolor blue
Pointers & lambda functions
.gcolor
.LP
.ce 1
Week 4
.SS Overview
.IT Constant pointers
.IT Function pointers
.IT Pointers to \*[c]void*\*[r]
.IT Lambda expressions
.IT Lambda and their relation to classes
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
.SS Casts
.IT Types of casts
.i1 \*[c]static_cast\*[r]
.i2 Explicitly converts a value to a new type
.i1 \*[c]dynamic_cast\*[r]
.i2 Safely converts pointers and references up & down the inheritance hierarchy
.i2 We won't care about this until week 11
.i1 \*[c]const_cast\*[r]
.i2 Explicitly converts between types with different \*[c]const\*[r] qualifications
.i3 Used if a type doesn't provide const and non-const versions of a function (most do)
.i1 \*[c]reinterpret_cast\*[r]
.i2 Converts between types by reinterpreting the underlying bit pattern
.i3 Literally, treat a sequence of bits \fIas if it were a new type\fR
.i2 Most often seen in file I/O or other serialized read / write operations
.i3 Covered at the end of the semester

.IT General rule of thumb
.i1 If you have a lot of casts in your code
.i1 Then you probably have a design problem
.i2 Have you chosen the most apporpriate type for the job?
.i2 Not every task is solved using \*[c]int\*[r]
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
.i1 Whether you consider this an improvement is largely a matter of taste

.IT See week04 function pointer examples and jump table
.SS Lambdas
.IT Motivation
.i1 Many functions in the STL take a function as an argument.
.i1 Suppose we want to count the number of short strings in a vector
.i2 There is a count_if function in the STL
.i3 Takes a range of pointers and a \fIpredicate\fR function
.i2s
A simple \fCcount_if\fR example
.CW
  bool less_than_5(const string& str) {
    return str.size() < 5;
  }
  size_t num_short_strings(const vector<string>& v) {
    const string* begin = v.data(); \m[green]// must be const\m[]
    const auto end = begin + v.size();
    return count_if(begin, end, less_than_5);
  }
.R
.i2e
.IT We can write as many functions like this as we need
.i1 \fCless_than_10\fR, etc.
.IT Gets tedious quickly
.i1 And not very flexible 
.i2 Every new comparison is a recompile
.bp
.IT Goal
.i1 Avoid writing a new function for every value to compare
.i1s
Simple: let's add a parameter \fCsize\fR:
.CW
  bool less_than(const string& str, size_t size) {
    return str.size() < size;
  }
.R

Sadly, we can't use this function in \fCcount_if\fR
.i1e
.IT The new function is arguably more generic
.i1 But we can't use our 'improved' \fCless_than\fR in \fCcount_if\fR
.i2 Predicate must be a \fIunary\fR function
.IT The improved function is less useful than the old
.i1 Even though we made it 'generic'
.IT We need a way to pass more than one parameter
.i1 to a function that can only take 1 parameter

.SS Lambda expressions
.IT Introduced in C++11
.i1 a.k.a closures, lambda functions, function literals, or just lambdas
.IT Lambda basic syntax
\s-8
.CW
  [ captures ] (parameters) -> returnType { lambda_body; }
.R
\s+8
.i1 Captures
.i2 Specify variables from the enclosing scope available for the lambda 
.i2 A capture clause is \fBalways\fR required
.i2 Use an empty clause, \fC[]\fR to capture nothing
.i1 Parameters
.i2 Parameters passed to the lambda.  Optional.
.SS Lambda Hello
.IT The 'hello world' of lambda expressions
.i1s
For example
.CW
  #include <iostream>
  using namespace std;
   
  int main()
  {
      auto lambda = [] { 
        cout << "Hello, lambda!" << endl; 
      };
      lambda();
  }
.R
.i1e
.SS Count_if again
.IT Now we can eliminate a functor completely
.i1s
Count the elements > 5
\s-4
.CW
  int main()
  {
    vector<int> numbers { 1, 2, 3, 4, 5, 10, 15, 20, 25,
                          35, 45, 50 };
    const int* begin = numbers.data();
    const auto end = begin + numbers.size();

    auto gt_5 = count_if(begin, end, 
                  \m[red][](int x) { return (x > 5); }); \m[]

    cout << "The # of elements > 5 is: "
         << \m[red]gt_5\m[] << ".\\n";
  }
.R
\s+4
.SS Captures
.IT Use variables from the enclosing scope
.i1s
Using the \*[c]for_each\*[r] algorithm
.CW
 void divisible_by(const int* begin, const int* end, 
                   const int divisor)
 {
   \m[green]// print all the numbers divisible by divisor\m[]
   for_each(begin, end, 
       \m[red][divisor]\m[] (int y) {
         if (y % divisor == 0) {
           cout << y << endl;
         }
       });
 }
.R
.i1e
.IT The \fCdivisor\fR parameter is local to the scope of the function
.i1 Same scope that contains the lambda
.IT The \fIcapture\fR \fC[divisor]\fR makes it available to the lambda
.IT The \fIcapture\fR \fC[=]\fR makes \fBall\fR local variables available
.SS Capture pass by reference
.IT Can pass by reference or value into a capture
.i1s
Return the sum of all values divisible by divisor
.CW
 int sum_divisible_by(const int* begin, const int* end, 
                      const int divisor)
 {
   int sum = 0;
    
   for_each(begin, end, 
       \m[red][divisor, &sum]\m[] (int y) {
         if (y % divisor == 0) {
           sum += y;
         }
       });

   return sum;
 }
.R
.i1e
.bp
.IT \fC[=, &sum]\fR
.i1 Captures any referenced variable within the lambda by value (making a copy), 
.i2 Except \fCsum\fR that has to be captured by reference
.IT \fC[&, divisor]\fR
.i1 Captures any referenced variable within the lambda by reference, 
.i2 Except \fCdivisor\fR that has to be captured by value
.SS Lambda relation to classes
.IT Under the hood every lambda is a new class
.i1 i.e. a new \fItype\fR
.IT Even when many lambda expressions receive the same arguments 
.i1 And return the same type, 
.i1 Each will be a different class
.IT Is it possible to reuse a lambda?
.i1 Yes.
.SS std::function wrapper
.IT Allows standardized way to pass around
.i1 Lambda expressions
.i1 Function objects
.i1 Function pointers
.IT \*[c]std::function\*[r] added in C++11
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
.i1s
Sample function definition
.CW
 void 
 run_in_for_each(std::function<void (int)> func)
 {
  vector<int> numbers{1, 2, 3, 4, 5};
  for_each(numbers.begin(), numbers.end(), func);
 }
.R
.i1e
.bp
.IT Once defined
.i1s
We can send different lambdas to the function
.CW
  auto func1 = [](int y)
  {
    cout << y << endl;
  };

  auto func2 = [](int z)
  {
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
.IT Casts
.i1 \*[c]static_cast\*[r] when you must
.i1 Too many casts is a code smell 
.IT Lambda expressions
.i1 Expressive, just-in-time functions, right when you need them
.i1 Standardize passing functions and lambdas 
.i2 Using \fCstd::function\fR


