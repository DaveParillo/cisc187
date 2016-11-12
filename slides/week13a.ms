
.TL
.gcolor blue
Function Objects 

and

Lambda Expressions
.gcolor
.LP
.ce 1
Week 13
.EQ
delim $$
.EN
.SS Overview
.IT Motivation
.IT Predicates
.IT Functions and overloads
.IT Function objects
.IT Lambda expressions
.IT Lambda and their relation to classes
.SS Motivation
.IT Many functions in the STL take a functor as an argument.
.IT Suppose we want to count the number of short strings in a vector
.i1 There is a count_if function in the STL
.i2 Takes a range of iterators and a \fIpredicate\fR function
.i1s
A simple \fCcount_if\fR example
.CW
  bool less_than_5(const string& str) {
    return str.size() < 5;
  }
  size_t num_short_strings(const vector<string>& v) {
    return count_if(v.begin(), v.end(), less_than_5);
  }
.R
.i1e
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
.i1 We need a \fIfunction object\fR
.SS Functions and overloads
.IT We have been overloading operators and functions all semester
.IT One operator we haven't overloaded yet
.i1 \*[c]operator ()\*[r]
.IT The \fIfunction call operator\fR
.IT No magic here
.i1 Any class can override this operator
.i1 Allows a class to be called like a function
.IT Also commonly referred to as a \fIfunctor\fR for short

.IT Problem
.i1s
The \fCcount_if\fR function needs a unary function 
.br
 that returns whether a string is less than an arbitrary length
.i1e
.SS Functors
.IT Solution
.i1 Create a \fIunary function object\fR
.i2 Whose constructor takes 1 parameter
.i2 And stores it as a class member
.i1 The \*[c]operator()\*[r] function takes a single string parameter 
.i1s
And determines if it is short enough
.CW
  class ShorterThan {
    public:
      // Accept and store an int parameter
      \m[red]explicit ShorterThan(size_t max) 
         : sz(max) {}\m[]
      // Is the string length is less than 
      // the stored size limit?
      \m[red]bool operator() (const string& str) const {
        return str.size() < sz;
      }\m[]
    private:
      \m[red]const size_t sz;\m[]
  };
.R
.i1e
.SS Using functors
.IT Use a functor like any other class
.i1s
We can use it like this
.CW
  ShorterThan st_pred (5);    // declare object

  size_t num_short_strings(const vector<string>& v) {
                              // pass as parameter
    return count_if(v.begin(), 
                    v.end(), st_pred);
  }
.R

or omit the temporary object

.CW
  size_t num_short_strings(const vector<string>& v) {
    return count_if(v.begin(), 
                    v.end(), ShorterThan(5));
  }
.R
.i1e
.SS Advanges of functors
.IT Function object are "smart functions." 
.i1 Objects that behave like pointers are smart pointers
.i1 Function objects may have other member functions and attributes
.i2 Function objects have a state
.IT Each function object has its own type.
.i1 Ordinary functions have different types only when their signatures differ
.i1 Function objects can have different types when their signatures are the same
.i2 Each functional behavior defined by a function object has its own type
.i2 Implication: you can pass functional behavior as a template parameter
.IT Function objects are usually faster than ordinary functions
.i1 Templates usually allow better optimization 
.i2 More details are defined at compile time
.IT BUT
.i1 This seems like a lot of code for such a simple task
.i1 ShorterThan only uses \*[c]operator()\*[r]
.i2 But we still had to wrap it in a class
.IT Is there a way to get the compiler to generate the 'boiler plate' code around our function?
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
.IT Function objects
.i1 a.k.a \fIfunctor\fR
.i1 Write fewer repetitive functions
.i1 A class that can be called like a function
.i1 Many STL classes take an optional functor
.IT Lambda expressions
.i1 Even less code than functors
.i1 Expressive, just-in-time functions, right when you need them
.i1 Passing lambdas using \fCstd::function\fR

