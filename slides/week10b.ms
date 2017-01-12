
.TL
.gcolor blue
Operator Overloading
.gcolor
.LP
.ce 1
Week 4
.SS Overview
.IT General Syntax of operator overloading
.IT Basic Rules of operator overloading
.IT Member or Non-member?
.IT Common operators to overload
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
.IT Don't change expected behavior
.i1 it is perfectly legal to overload \*[c]operator+\*[r] to subtract from the right operand
.i1 Just don't
.IT Overload all related operators
.i1 When overloading addition, for example
.i2 consider postfix and prefix \*[c]operator++\*[r] 
.i1 Don't overload \*[c]operator<\*[r] without also \*[c]operator>\*[r]
.IT When we get to maps at the end of the semster, we will spend a whole day on overloading \*[c]operator==\*[r]
.i1 Yes, it's that important.   
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
    std::swap(rhs);
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
    // write rhs object to stream

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
    Foo& operator++()         // prefix ++
    {
      // do actual increment
      return *this;
    }
    Foo operator++(int)       // postfix ++
    {
      Foo tmp(*this);         // copy!
      operator++();
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
      // actual addition of rhs to *this
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
.i1 Can perform \fIimplicit conversion\fR
.i1 or \fIexplicit conversion\fR
.IT Implicit conversion operators can be troublesome
.i1 They can get used by the compiler when you don't expect it
.i2 It \fBis\fR an \fIimplicit conversion\fR, after all!
.IT Explicit conversion
.i1 As the name implies, only get called when code uses an explicit conversion
.RS
\s-8
.CW
  class Foo {
    public:
      explicit operator bool() const {return true;}
    private:
      int _x;
  };
.R
.RE
.IT A complete example is at
.i1 http://en.cppreference.com/w/cpp/language/explicit
