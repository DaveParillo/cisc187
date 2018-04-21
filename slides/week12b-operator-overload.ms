
.TL
.gcolor blue
Operator Overloading
.gcolor
.LP
.ce 1
Week 12
.EQ
delim $$
.EN
.SS Overview
.IT The \*[c]*this\*[r] pointer
.IT General syntax of operator overloading
.IT Basic rules of operator overloading
.IT Member or Non-member?
.IT Common operators to overload
.IT User-defined casts
.IT Overloading operator()
.i1 Motivation
.i1 Predicates
.i1 Functions and overloads
.i1 Function objects
.SS The \fIthis\fP pointer
.IT Every class function has access to a pointer to the current object
.i1 Stored in \*[c]*this\*[r]
.IT Not just any old object
.i1 *this is immutable
.SS The \fIthis\fP pointer
.IT Every class function has access to a pointer to the current object
.i1 Stored in \*[c]*this\*[r]
.IT Not just any old object
.i1 *this is immutable
.IT Typical uses
.i1s
Modify and return the current object
.CW
  Foo& operator+=(const Foo& rhs) {
    \m[green]// actual addition of rhs to *this\m[]
    return *this;
  }
.R
.i1e
.SS The \fIthis\fP pointer
.IT Every class function has access to a pointer to the current object
.i1 Stored in \*[c]*this\*[r]
.IT Not just any old object
.i1 *this is immutable
.IT Typical uses
.i1s
Modify and return the current object
.CW
  Foo& operator+=(const Foo& rhs) {
    \m[green]// actual addition of rhs to *this\m[]
    return *this;
  }
.R
.i1e
.i1s
Resolve ambiguity between member variables and function parameters.
.CW
  struct Dog
    string dog_name = "Fido";
    void   set_name (string dog_name) const {
      this->dog_name = dog_name;
    }
  };
.R
.i1e
.SS Why bother with operator overloads?
.IT When we say \fIoperator overload\fR in C++
.i1 We \fIdon't\fR mean \fCMyClass.subtract()\fR
.IT We want to be able to write code like
.RS
\s-8
.CW
 Complex root;
 Rational a {2,3}, b{6,1}, c{5,3};
 root = (-b + std::sqrt(b*b + 4*a*c)) / (2*a);
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
      / (a.multiply(2)));
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
 Rational operator+(Rational lhs, i
                    const Rational& rhs)
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
.i2e
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
  s += a;
.R
.i1e
.bp
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
Example compiler message
.CW
  error: no viable overloaded '+='
  candidate function not viable: 
  no known conversion from 'Rational' to
  'const std::__1::basic_string<char>' for 1st argument
  _LIBCPP_INLINE_VISIBILITY basic_string& operator+=(const basic_string...
.R
.i2e
.bp
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
Example compiler message
.CW
  error: no viable overloaded '+='
  candidate function not viable: 
  no known conversion from 'Rational' to
  'const std::__1::basic_string<char>' for 1st argument
  _LIBCPP_INLINE_VISIBILITY basic_string& operator+=(const basic_string...
.R
.i2e
.i1 Solution
.i2s
Overload \*[c]operator <type>() const\*[r] as a member function
.CW
  Rational::\m[blue]operator\m[] \m[red]std::string\m[] () \m[red]const\m[] {
    std::stringstream ss;
    \m[green]// n_ & d_ are private members of Rational\m[]
    ss << n_ << '/' << d_;
    return ss.str();
  }
.R
.i2e
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

.SS Function objects
.IT A \fIfunction object\fR is an object that encapsulates an overloaded  \*[c]operator()\*[r]
.IT Introduced in C++ before lambdas existed
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
      \m[red]explicit ShorterThan\m[](size_t max) 
         : sz(max) {}
      \m[green]// Is str less than the stored size limit?\m[]
      \m[red]bool operator()\m[] (const string& str) const {
        return str.size() < sz;
      }
    private:
      \m[red]const size_t sz;\m[]
  };
.R
.i1e
.SS Using functors
.IT A 'functor' is another term for 'function object'
.IT Use a functor much like a lambda
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
.i1 \*[c]std::function\*[r] accepts function objects
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


