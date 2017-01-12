
.TL
.gcolor blue
Pointers, casts & lambdas
.gcolor
.LP
.ce 1
Week 4
.SS Overview
.IT Constant pointers
.IT Destroying memory
.IT \*[c]#include <memory>\*[r] 
.IT Pointers to \*[c]void*\*[r]
.IT Casts
.IT Lambda expressions
.IT Lambda and their relation to classes
.SS Constant pointers
.IT Pointers can be declared \*[c]const\*[r] 
.i1 Same as any other type 
.IT Where const appears controls what is constant
.i1s
Same as \*[c]const\*[r] member functions
\s-4
.CW
    int x;
          int *       p1 = &x;  // non-const pointer to non-const int
    const int *       p2 = &x;  // non-const pointer to const int
          int * const p3 = &x;  // const pointer to non-const int
    const int * const p4 = &x;  // const pointer to const int 

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
    // calc returns a pointer to a double
    double* calc(int res_size, int max)
    // the caller is responsible for the memory allocated for res
    {
        double* p = new double[max];        //temp memory
        double* res = new double[res_size];
        // use p to calculate results to be put in res
        delete[] p;    // free temp memory 
        return res;    // can't free this here!
    }
    int main()
    {
        double* r = calc(100,1000);
        // use r
        delete[] r;    // easy to forget, error prone
    }
.i1e
.bp
.IT Rules of thumb
.IT If you \fBmust\fR use raw \*[c]new\*[r] and \*[c]delete\*[r]
.i1 Keep raw \*[c]new\*[r] in your constructors 
.i1 Keep raw \*[c]delete\*[r] in your destructors 
.IT This ensures you call \*[c]delete\*[r] once for each \*[c]new\*[r]
.IT Deleting a \fInull pointer\fR does nothing
\s-4
.CW
    double* d = nullptr;  // C++11 preferred syntax
    double* x = 0;        // 'classic' syntax
    delete d;
    delete d;
    delete d;   // unlike a non-null, no crash
.R
\s+4
.SS Dynamic memory management
.IT There are safer ways since C++11 to manage memory
.IT especially outside of constructors
.IT Raw \*[c]new\*[r] and \*[c]delete\*[r] aren't much better than 
the old C \*[c]malloc\*[r] and \*[c]free\*[r]
.i1 Still largely a manual process
.i1 \*[c]new\*[r] can throw exceptions
.IT C++11 provides the header \*[c]<memory>\*[r]
.i1 'Smart pointers'
.i1 Provides automatic, exception-safe, object lifetime management
.IT One of the first was \*[c]auto_ptr\*[r]
.i1 You'll still see lots of suggestions for it's use
.i1 It is deprecated since C++11 and will be removed in C++17
.IT Prefer \*[c]unique_ptr\*[r] and \*[c]shared_ptr\*[r] instead
.SS Using unique_ptr
.IT Unique pointers \fIown\fR their pointers.
.IT Use a \*[c]unique_ptr\*[r] like a local variable and it automatically destroys its pointer
.i1s
Given:
.CW
  #include <iostream>
  #include <memory>
     
  struct Foo
  {
    Foo()      { std::cout << "Foo::Foo\\n";  }
    ~Foo()     { std::cout << "Foo::~Foo\\n"; }
    void bar() { std::cout << "Foo::bar\\n";  }
  };
     
  void f(const Foo &)
  {
    std::cout << "f(const Foo&)\n";
  }
.bp
.R
.IT Use Foo on the heap safely
.i1s
Create a \*[c]unique_ptr\*[r] of Foo
.CW
\s-4
  int main()
  {
    std::unique_ptr<Foo> p1(new Foo);          // p1 owns Foo
    if (p1) p1->bar();
     
    {                                          // a scope for p2
      std::unique_ptr<Foo> p2(std::move(p1));  // now p2 owns Foo
      f(*p2);
     
      p1 = std::move(p2);                      // now p1 owns Foo
    }                                          // p2 scope ends
    std::cout << "destroyed p2...\\n";
     
    if (p1) p1->bar();
  }                           // Foo destroyed when p1 scope ends
.R
.i1e
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
  int i;           // declare an int
  void x;          // error!  void is not a type
  void print();    // function returns nothing
.R
.i1e
.i1s
\fBAny\fR pointer can be assigned to \*[c]void*\*[r]
.CW
  int*    i  = new int{5}; 
  double* x  = new double[10];
  int*    j  = i;             // OK
  void*   p1 = i;             // OK
  void*   p2 = d;             // OK
  int*    i2 = p1;            // error
.R
.i1e

.SS Using void pointers
.IT The compiler can't know the size of the value pointed to
.i1s
\*[c]void\*[r] isn't a type, so it has no size
.CW
  int*    i = new int{5}; 
  void*   p = i;             // OK
  int*    j = p;             // error
.R
.i1e
.IT We have to give the compiler size information
.IT Use one of C++ \fIcasts\fR to convert \*[c]void*\*[r]
.i1s
To another pointer type that has a size
.CW
  // explicit conversion with cast
  int*    j = static_cast<int*>(p);
.R
.i1e
.SS Casts
.IT Types of casts
.i1 \*[c]static_cast\*[r]
.i2 Explicitly converts a value to a new type
.i1 \*[c]dynamic_cast\*[r]
.i2 Safely converts pointers and references up & down the inheritance hierarchy
.i1 \*[c]const_cast\*[r]
.i2 Explicitly converts between types with different \*[c]const\*[r] qualifications
.i1 \*[c]reinterpret_cast\*[r]
.i2 Converts between types by reinterpreting the underlying bit pattern
.i3 Literally, treat the a sequence of bits \fIas if it were a new type\fR
.SS Lambdas
.IT Motivation
.i1 Many functions in the STL take a function as an argument.
.i1 Suppose we want to count the number of short strings in a vector
.i2 There is a count_if function in the STL
.i3 Takes a range of iterators and a \fIpredicate\fR function
.i2s
A simple \fCcount_if\fR example
.CW
  bool less_than_5(const string& str) {
    return str.size() < 5;
  }
  size_t num_short_strings(const vector<string>& v) {
    return count_if(v.begin(), v.end(), less_than_5);
  }
.R
.i2e
.IT We can write as many functions like this as we need
.i1 \fCless_than_10\fR, etc.
.IT Gets tedious quickly
.i1 And not very flexible 
.i2 Every new comaprison is a recompile
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
.IT Reduce 'boiler plate' code
.i1 Like the \fCShorterThan\fR class
.IT A syntactic short-cut for a functor
.i1 Anything you could do with a functor, you can do with a lambda
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
    vector<int> numbers { 1, 2, 3, 4, 5,
                          10, 15, 20, 25,
                          35, 45, 50 };

    auto gt_5 = count_if(numbers.begin(),
                         numbers.end(), 
\m[red]                         [](int x) { return (x > 5); }); \m[]

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
 void divisible_by(const vector<int>& numbers, 
                   const int divisor)
 {
   \m[green]// print all the numbers divisible by divisor\m[]
   for_each(numbers.begin(), numbers.end(), 
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
 int sum_divisible_by(const vector<int>& numbers, 
                      const int divisor)
 {
   int sum = 0;
    
   for_each(numbers.begin(), numbers.end(), 
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
.i1 Function pointers (from C)
.IT The wrapper allows us to pass a lambda as an argument to a function
.i1s
Provides a flexible way to reuse a lambda
.CW
 void 
 run_in_for_each(std::function<void (int)> func);
.R

This function can be called with a lambda expression
.i1e
.i2 That returns \*[c]void\*[r] and takes a single \*[c]int\*[r] parameter
.i1s
Function definition
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
.i1 Memory 'leaks' are the #1 source of bugs in C/C++ programs
.IT Prefer \*[c]unique_ptr\*[r] and \*[c]shared_ptr\*[r] over 
raw \*[c]new\*[r] and \*[c]delete\*[r]
.IT Pointers to \*[c]void*\*[r]
.i1 Use when you must, don't otherwise
.i2 You're giving up what little checking the compiler can do
.IT Casts
.i1 \*[c]static_cast\*[r] when you must
.i1 \*[c]dynamic_cast\*[r] when changing between types in a hierarchy
.IT Lambda expressions
.i1 Even less code than functors
.i1 Expressive, just-in-time functions, right when you need them
.i1 Passing lambdas using \fCstd::function\fR






