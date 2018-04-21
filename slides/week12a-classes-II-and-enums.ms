
.TL
.gcolor blue
Classes and enumerations
.gcolor
.LP
.ce 1
Week 12
.SS Overview
.IT Read Chapter 9, \*[sect]9.5 - 9.8
.IT Classes
.i1 Writing good interfaces
.IT Default behaviors
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
.i1 We will cover this in weeks 13 and 14
.IT Use types correctly
.i1 To provide good argument checking
.IT Identify non-modifying member functions
.IT Free resources correctly
.i1 We'll get to this in week 14
.IT Composition
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
.SS Initialization syntax
.IT This gave people a lot of trouble in last weeks lab
.i1s
Make an object of type Car
.CW
  Car c();
.R
.i1e
.i1 Many people were thrown why this did not compile
.i1 I was thrown by why anyone felt compelled to do this...
.IT The above code does \fBnot\fR create a Car object

.IT It tells the compiler you are declaring a new function
.i1 It's name is \*[c]c\*[r]
.i1 It takes no parameters
.i1 And returns a \fCCar\fR object

.IT Other languages require \fC()\fR's when creating an object
.i1 C++ does not, 
.i1 Unless you are passing parameters to a non-default constructor
.bp
.IT Bottom line
.i1 If it looks like a function, C++ will attempt to interpret it as a function
.i2 This is a side-effect of the ability to overload basically everything in C++
.i1 This is the motivation behind C++11 'initializer syntax'
.i1 See examples/week07/sequential_containers/item06-most-vexing-parse
.i1s
For a Car
.CW
  Car c;
.R
.i1e
.i1 Is good enough
.i1 Same thing we have been doing with \fCvector\fR all semester
.i1s
Your objects are not any different from those in the STL
.CW
  vector<int> numbers;
  Clock test;
  Car c {"Mesa Jolt"};
  vector<Dog> dogs = {Dog(Size::SMALL), 
                      Dog(Size::LARGE)};
  vector<Dog> dogs = {{Size::SMALL}, 
                      {Size::LARGE}};

  vector<int> numbers(5); \m[green]// what does this do?\m[]
  vector<int> numbers{5}; \m[green]// vs. this?\m[]
.R
.i1e
.SS Argument types
.IT The same rules that apply to writing good functions apply here
.i1 A good class is built around good functions
.IT Avoid confusing parameter lists
.i1 Sequential parameters of the same type
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
.nr step 0 1
\n+[step].  Does this program compile without error?  

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
.IT \*[c]static\*[r] variables
.IT Default behaviors
.i1 Know when the compiler will generate constructors
.i1 And when it won't
.IT Enumerations
.i1 Prefer \*[c]class enum\*[r] to plain \*[c]enum\*[r]

