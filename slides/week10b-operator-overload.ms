
.TL
.gcolor blue
Operator Overloading
.gcolor
.LP
.ce 1
Week 10
.EQ
delim $$
.EN
.SS Overview
.IT General Syntax of operator overloading
.IT Basic Rules of operator overloading
.IT Member or Non-member?
.IT Common operators to overload
.IT User-defined casts
.IT Overloading operator()
.i1 Motivation
.i1 Predicates
.i1 Functions and overloads
.i1 Function objects
.SS Why bother?
.IT When we say \fIoperator overload\fR in C++
.i1 We \fIdon't\fR mean \fCMyClass.subtract()\fR
.IT We want to be able to write code like
.RS
\s-8
.CW
 Complex x;
 Rational a {2,3}, b{6,1}, c{5,3};
 x = (-b + std::sqrt(b*b + 4*a*c)) / (2*a);
.R

\s+8
instead of
\s-8
.br
.CW
 Complex  x   = new Complex(0,0);
 Rational a   = new Rational(2,3);
 Rational b   = new Rational(6,1);
 Rational c   = new Rational(5,3);
 x.setComplex((-1.0 * b.add(
      Math.sqrt(b.multiply(b)
      .add(c.multiply(a.multiply(4)))))) 
      / (a.multiply(2));
.R
.RE
.SS General syntax
.IT You cannot change the meaning of operators for built-in types 
.i1 The \fC+\fR for int, double is fixed
.IT Overloads must be user-defined types
.i1 At least one of the operands has to be of a user-defined type
.i1 Operators can be overloaded for a certain set of parameters only once
.i2 You can overload more often, but the parameter list must be different.
.IT Operator overloads are just functions with special names
.RS 
.CW
 Rational operator+(Rational lhs, const Rational& rhs)
.R
.RE
.IT Generally implemented as either
.i1 A member function of their left operand's type or 
.i1 As non-member functions 
.SS Basic concepts
.IT Don't overload everything
.i1 Whenever the meaning of an operator is not obviously clear and undisputed, it should not be overloaded 
.i2 Use a function instead and use a clear function name
.i2s
There is not universal agreement on the wisdom of using \*[c]cout\*[r] and overloading
the bitshift operator \*[c]<<\*[r].
.12e
.i3 Partly because the iostream library is huge compared to stdio
.IT Don't change expected behavior
.i1 it is perfectly legal to overload \*[c]operator+\*[r] to subtract from the right operand
.i1 Just don't
.IT Overload all related operators
.i1 When overloading addition, for example
.i2 consider postfix and prefix \*[c]operator++\*[r] 
.i1 Don't overload \*[c]operator<\*[r] without also \*[c]operator>\*[r]
.IT Some classes only work when overloading a specific operator
.i1 set: \*[c]operator<\*[r]
.i1 unordered_map: \*[c]operator==\*[r]
.SS Member or Non-member?
.IT In general, the choice is yours, but there are some guidelines
.IT \*[c]operator<<\*[r] and \*[c]operator>>\*[r] are almost always non-member
.i1 The LHS parameter (the left operand) cannot be modified by you
.IT \*[c]operator[]\*[r], \*[c]operator=\*[r] (assignment), and a few others
must \fIalways\fR be member functions.
.i1 This is a C++ language requirement
.IT For other operators
.i1 If the operator is \fIunary\fR
.i2 Implement the overload as a \fBmember\fR function
.i1 If the operator is \fIbinary\fB and\fR the operator does not change either operand
.i2 Implement the overload as a \fBnon-member\fR function
.i1 If the operator is \fIbinary\fB and\fR the operator does not treat the two operands the same
.i2 As in, the left operand might change
.i1 Consider implementing the overload as a \fBmember\fR function
.i2 If it needs access to private class functions
.SS Common operators to overload
.IT Most overloads are 'boiler-plate'
.i1 Good solutions already exist, no need to reinvent.
.i1 Overloads in different classes tend to look very similar
.i1 Assignment
.RS
.CW
  Foo& Foo::operator=(const Foo& rhs)
  {
    \m[green]// copy data from rhs to
    // current instance\m[]
    return *this;
  }
.R
\s+8
.RE
.i1 Stream I/O
.RS
.CW
  std::ostream& operator<<(std::ostream& os, const T& rhs)
  {
    \m[green]// write rhs object to stream\m[]
    return os;
  }
.R
.RE
.SS Comparison operators
.IT Some algorithms, like \*[c]sort()\*[r] expect \*[c]operator<\*[r] to be overloaded
.IT However, if you overload 1 boolean operator
.i1 Users of your classes will expect them all
.IT Define \*[c]operator<\*[r] and \*[c]operator==\*[r] first
.RS
\s-8
.CW
  inline bool operator==(const T& lhs, const T& rhs)
  { 
    /* do actual comparison */ 
  }

  inline bool operator< (const T& lhs, const T& rhs)
  { 
    /* do actual comparison */ 
  }
.R
.RE
.bp
.IT Then define the others in terms of \*[c]operator<\*[r] and \*[c]operator==\*[r] 
.RS
\s-8
.CW
  inline bool operator!=(const T& lhs, const T& rhs)
  {
    return !operator==(lhs,rhs);
  }
  inline bool operator> (const T& lhs, const T& rhs)
  {
    return  operator< (rhs,lhs);
  }
  inline bool operator<=(const T& lhs, const T& rhs)
  {
    return !operator> (lhs,rhs);
  }
  inline bool operator>=(const T& lhs, const T& rhs)
  {
    return !operator< (lhs,rhs);
  }
.R
.RE
.SS Arithmetic operators
.IT Unary operators come in two flavors
.i1 \fCpostfix\fR and \fCprefix\fR
.IT The \fCpostfix\fR version takes an additional dummy \*[c]int\*[r] argument
.i1 Always implement both
.RS
.CW
  class Foo {
    Foo& operator++()      \m[green]// prefix ++\m[]
    {
      \m[green]// do actual increment\m[]
      return *this;
    }
    Foo operator++(int)    \m[green]// postfix ++\m[]
    {
      Foo tmp(*this);      \m[green]// copy!\m[]
      ++tmp;
      return tmp;
    }
  };
.R
.RE
.SS Binary arithmetic operators
.IT Always overload normal infix and compound assignment
.i1 For example, \fC+\fR and \fC+=\fR
.RS
.CW
  class X {
    X& operator+=(const X& rhs)
    {
      \m[green]// actual addition of rhs to *this\m[]
      return *this;
    }
  };
  inline X operator+(X lhs, const X& rhs)
  {
    lhs += rhs;
    return lhs;
  }
.R
.RE
.IT Notice the different returns (reference vs copy)
.i1 Really no way around this
.i1 When you type \fCa + b\fR, you expect the result to be a new value
.SS Conversion operators
.IT C++ allows you to create operators to convert between your type and other ADT's
.i1s
Suppose we want to concatenate a Rational to a string?
.CW
  Rational a {2,3};
  std::string s = {"A = "};
  s += a;                   \m[green]// will not compile\m[]
.R
.i1e
.i2s
\fCerror: no viable overloaded '+='\fR
.RS
\s-8
.CW
  candidate function not viable: no known conversion from 'Rational' to
  'const std::__1::basic_string<char>' for 1st argument
  _LIBCPP_INLINE_VISIBILITY basic_string& operator+=(const basic_strin...
.R
.RE
.i2e
.i1s
Overload \*[c]operator <type>() const\*[r] as a member function
.CW
  Rational::operator std::string () const {
    std::stringstream ss;
    \m[green]// n_ & d_ are private members of Rational\m[]
    ss << n_ << '/' << d_;
    return ss.str();
  }
.R
.i1e
.bp
.IT Conversion are implicit by default
.i1 Can perform \fIimplicit conversion\fR
.i1 or \fIexplicit conversion\fR
.IT Implicit conversion operators can be troublesome
.i1 They can get used by the compiler when you don't expect it
.i2 It \fBis\fR an \fIimplicit conversion\fR, after all!
.IT Explicit conversion
.i1s
As the name implies, only get called when code uses an explicit conversion
\s-4
.CW
  class Foo {
    public:
      explicit operator bool() const {return true;}
    private:
      int _x;
  };
.R
.i1e
.IT A complete example is at
.i1 http://en.cppreference.com/w/cpp/language/explicit
.SS One last overload...

.ce 99
.CW
operator ()

.R
The function call operator

.ce 0
.SS Motivation
.IT Many functions in the STL take a function as an argument.
.IT Suppose we want to count the number of short strings in a vector
.i1 There is a count_if function in the STL
.i2 Takes a range of iterators and a \fIpredicate\fR function
.i1s
A simple \fCcount_if\fR example
\s-4
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
.i1 We need a \fIfunction object\fR
.SS Functions and overloads
.IT We have been overloading functions all semester
.IT One operator we haven't discussed yet
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
      \m[green]// Accept and store an int parameter\m[]
      \m[red]explicit ShorterThan(size_t max) 
         : sz(max) {}\m[]
      \m[green]// Is the string length is less than \m[]
      \m[green]// the stored size limit?\m[]
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
  ShorterThan st_pred (5);    \m[green]// declare object\m[]

  size_t num_short_strings(const vector<string>& v) {
                              \m[green]// pass as parameter\m[]
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
.SS Advantages of functors
.IT Function objects are "smart functions." 
.i1 Objects that behave like pointers are smart pointers
.i1 Function objects may have other member functions and attributes
.i2 Function objects have a state
.IT Each function object has its own type.
.i1 Ordinary functions have different types only when their signatures differ
.i1 Function objects can have different types when their signatures are the same
.i2 Each functional behavior defined by a function object has its own type
.i2 Implication: you can pass functional behavior as a template parameter
.bp
.IT Function objects are usually faster than ordinary functions
.i1 Templates usually allow better optimization 
.i2 More details are defined at compile time
.IT BUT
.i1 This seems like a lot of code for such a simple task
.i1 \fCShorterThan\fR only uses \*[c]operator()\*[r]
.i2 But we still had to wrap it in a class
.IT Is there a way to get the compiler to generate the 'boiler plate' code around our function?
.i1 Yes!
.i1 A lambda expression compiles into a function object
.i1 Reduces 'boiler plate' code
.i2 Like the \fCShorterThan\fR class
.i1 A syntactic short-cut for a functor
.i2 Anything you could do with a functor, you can do with a lambda

.SS Summary
.IT Operator Overloads
.i1 UDT's only
.i1 Do what makes sense
.i2 Don't overload everything
.i1 Follow best-practices
.i2 Member vs non-member guidelines
.IT Function call overload
.i1 Allows creating Function objects
.i2 a.k.a \fIfunctor\fR
.i2 Write fewer repetitive functions
.i2 A class that can be called like a function
.i2 Many STL classes take an optional functor


