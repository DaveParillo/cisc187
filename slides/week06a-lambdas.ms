
.TL
.gcolor blue
Lambda functions
.gcolor
.LP
.ce 1
Week 6
.SS Overview
.IT Lambda expressions
.i1 Motivation
.i1 Syntax
.i1 Usage
.IT std::function again
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
.IT Lambda expressions
.i1 Expressive, just-in-time functions, right when you need them
.i1 Standardize passing functions and lambdas 
.i2 Using \fCstd::function\fR


