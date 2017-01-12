
.TL
.gcolor blue
Function Objects 
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

.SS Motivation
.IT Many functions in the STL take a function as an argument.
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
.i1 This is what lambda expressions provide

.SS Summary
.IT Function objects
.i1 a.k.a \fIfunctor\fR
.i1 Write fewer repetitive functions
.i1 A class that can be called like a function
.i1 Many STL classes take an optional functor

