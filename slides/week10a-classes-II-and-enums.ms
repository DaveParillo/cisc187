
.TL
.gcolor blue
Classes and enumerations
.gcolor
.LP
.ce 1
Week 10
.SS Overview
.IT Read Chapter 9, \*[sect]9.5 - 9.8
.IT Classes
.i1 Writing good interfaces
.IT Using \*[c]const\*[r] in classes
.IT Default behaviors
.i1 Copying
.i1 Constructors
.IT Enumerations
.SS Class interfaces
.IT Introduced last week
.i1 Interface and implementation
.i1 Keep data private
.i1 Keep interfaces simple

.IT What else is there?
.bp
.IT Provide constructors
.IT Make copying efficient (or prevent it)
.i1 We will cover this in weeks 12 and 13
.IT Use types correctly
.i1 To provide good argument checking
.IT Identify non-modifying member functions
.IT Free resources correctly
.i1 We'll get to this in week 12
.SS Constructors
.IT Initialize objects
.IT Every class has one
.IT Compiler will attempt to write one if not present
.IT BUT

.IT The compiler will only generate
.i1 Default constructors
.br 
AND
.IT The compiler will not generate a default constructor
.i1 If a class already has a constructor
.bp
.IT A non-default contructor inhibits generation of the default
.i1s
This program does not compile
.CW
  class Date {
  public:
    Date(int year, int mon, int day); \m[green]// constructor\m[]
    Month month() const { return m; }
    int   day()   const { return d; }
    int   year()  const { return y; }
  private:
    int y; int m; int d;
  };

  int main() {
    Date d;
  }
.R
.i1e
.IT If you write a non-default constructor
.i1 You \fBmust\fR implement the default one also
.i1s 
Or you should explicitly delete it
.CW
  Date() = delete;
.R
.i1e
.SS Argument types
.IT The same rules that apply to writing good functions aply here
.i1 A good class is built using good functions
.IT Avoid confusing parameter lists
.i1 Sequentiial parameters of the same type
.i1 Even something as simple as Date can be a problem
.i1s
Given a constructor 
.CW
  Date(int, int, int)
.R
.i1e
.i1s
Is a new Date constructed using
.CW
  Date d = {1776, 7, 4};
.R
.i1e
.i1s
Or
.CW
  Date d = {7, 4, 1776};
.R
.i1e
.i1 Or some other combination?
.i1 There is no way to know without reading the documentation
.i2 or the source code
.i1 Or you'll just find the problem at runtime!
.bp
.IT Simply defining appropriate types can do wonders for readability
.i1s
For example
.CW
  class Year {
    int y;
    public:
      Year (int val) : y{val} {}
      int year() { return y; }
  };
  enum class Month {
    JAN=1, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC
  };
.R
.i1e
.i1s
Now a new Date constructed using
.CW
  Date d = {Year{1776}, Month::JUL, 4};
.R
.i1e
.IT Any other combination of parameters is a compile error


.SS Using const in classes
.IT Classes add more situations where the \*[c]const\*[r] keyword can be used
.i1 In the definition of a new object
.i1 In the signature of a member function
.IT Creating new objects
.i1s
You can declare an object \*[c]const\*[r] just like any other type
.CW
  const Fibonacci foo = {5, 8, 13};
.R
.i1e
.i1 Just as with \fCconst int i = 3;\fR
.i2 It means no changes allowed to the object
.i1 A \fInon-modifying member function\fR
.IT Calling member functions
.i1s
You can declare an object \*[c]const\*[r] just like any other type
.CW
  bool verbose() const {return true;}
.R
.i1e
.i1 Here \*[c]const\*[r] tells the compiler 
.i2 This function \fBwill not change\fR the object state
.i1 It is a promise
.i2 If a const function attempts to change any class member, a compile error occurs
.IT Only member functions can be marked const
.SS A const object
.i1s
Does this compile?
.CW
  class Foo {
      int value_ = 0;
    public:
      Foo() {}
      void value (const int x) { 
        value_ = x; 
      }
      int value() { 
        return value_;
      }
  };
  int main () {
    const Foo a;
    a.value(13);
    std::cout << a.value() << '\\n';
  }
.R
.SS Adding a const function
.i1s
Does this compile?
.CW
  class Foo {
      int value_ = 0;
    public:
      void value (const int x) {
        value_ = x;
      }
      int value() const {
        return value_;
      }
  };
  int main () {
    Foo a;
    a.value(13);
    const Foo b = a;
    std::cout << b.value() << '\\n';
  }
.R
.SS Classes and static members
.IT Just because you put something in a class doesn't guarantee it's 'local'
.IT Putting a static in a member function doesn't change the nature of a static variable
.i1s
What is output from this program?
.CW
  struct Foo {
    int value() {
      static int x;
      return ++x;
    }
  };
  int main () {
    Foo a, b;

    for (int i=0; i<10; ++i) {
      std::cout << "a: " << a.value() << '\\n';
      std::cout << "b: " << b.value() << '\\n';
    }
  }
.R
.i1e
.SS Enumerations
.IT Consider the following program:
\s-8
.CW
  #include <iostream>
  enum Direction { north, south, east, west };

  static void show_direction(const int direction) {
    std::cout << "Direction: " << direction << "\\n";
  }

  int main() {
    Direction dir = west;
    show_direction(dir);
    int num = dir;
    show_direction(num);

    for (int i = north; i < 8; ++i) show_direction(i);
    return 0;
  }
.R
\s+8
.bp
.nr step 1 1
\n[step].  Does this program compile without error?  

.RS
Without warning? 

Without actually compiling, list them.
.RE


\n+[step].  What problems \fIdoes\fR this program have?

.bp
.RS
a.  The old-style enum \fCDirection\fR is not type safe.

b.  The old-style enum means that \fCDirection\fR 
.RS
can be assigned any \fCint\fR.
.RE

c.  The line \fCint num = dir;\fR also assigns the enum to an int,
.RS
which is meaningless.
.RE

d.  The function \fCshow_direction\fR 
.RS
implies it takes a direction as argument, 

but any integer value is processed without complaint.
.RE

e.  The function \fCshow_direction\fR 
.RS
never prints an actual direction, 

the value is always a number.

Even when the number is a valid \fCDirection\fR.
.RE

.RE
.SS Fixing the Direction enum
.IT Old style enums are limited and not type safe
.IT C++11 \*[c]class enum\*[r]s are type safe
.i1 But still lack many of the conveniences found in other languages
.i2 A C++ \*[c]class enum\*[r] is \fBnot\fR a \*[c]class\*[r]
.i2 Compare to Java, where it actually is a class
.i1 A \*[c]class enum\*[r] is lightweight for 'efficiency reasons'
.i2 But we can add convenience functions
.bp
.IT Change our \*[c]enum\*[r] to be a \*[c]class enum\*[r]
.IT move \fCDirection.h\fR to a separate compilation unit
.IT Provide machinery to transform our enum in a controlled way
.i1 A \*[c]map\*[r] to associate enum values with printable strings
.i1 An array to allow iterating over the \*[c]class enum\*[r] values.

.IT See this weeks example code

.SS Summary
.IT Classes
.i1 Class interfaces
.IT \*[c]const\*[r] objects and \*[c]const\*[r] member functions 
.IT \*[c]static\*[r] variables
.IT Default behaviors
.i1 Copying
.i1 Constructors
.IT Enumerations
.i1 Prefer \*[c]class enum\*[r] to plain \*[c]enum\*[r]


