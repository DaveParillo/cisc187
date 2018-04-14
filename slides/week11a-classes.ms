
.TL
.gcolor blue
Introduction to 

Data Structures and Classes 
.gcolor
.LP
.ce 1
Week 9
.SS Overview
.IT Sections 9.1 - 9.4, 9.7 of the text
.IT Review of procedures
.IT Data Structures
.IT Member access
.IT Using \*[c]const\*[r] in classes
.IT Interfaces and implementation
.SS Procedural programming
.IT The first half of this course emphasized \fIprocedural programming\fR
.IT A program composed of \fBprocedures\fR
.i1 Executes procedures (aka functions)
.i1 One at a time
.i1 Working towards a desired end state
.IT Functions usually exist independently from each other
.i1 Can group functions
.i2 In a namespace
.i2 In a compilation unit
.i1 Data is passed around or returned from functions
.IT Data management issues
.i1 In very large programs
.i1 Who actually owns a piece of data can be a problem
.i1 Object-Oriented Programming is one solution to this data management problem
.SS Data Structures
.IT It's not enough to have data
.IT It must be organized to be useful
.IT A data structure is 
.i1s
A meaningful representation of data 
.br
 \fBand\fR
.i1e
.i1 The operations associated with the data
.IT Together, the data and operations form an \fIabstract data type\fR
.IT When you write a class
.i1 Your are creating a new Abstract Data Type (ADT)
.i1 Sometimes called a \fIuser defined type\fR
.SS Relationship to struct
.IT In C++, a struct is a class
.i1s
With default public access
.CW
  struct Talk {
    void hello() {
      std::puts("Hello, world!");
    }
  };

  int main() {
    Talk say;     \m[green]// Create an object from a class\m[]
    say.hello();  \m[green]// Call a function in the object\m[]
  }
.R
.i1e
.SS Simple class
.IT In C++, a class has private default member access by default
.i1s
This class does nothing
.CW
  class Talk {
    void hello() {
      puts("Hello, world!");
    }
  };
.R
.i1e
.i1s
Compare to
.CW
  class Talk {
    \m[red]public:\m[]
      void hello() {
        std::puts("Hello, world!");
      }
  };
  int main() {
    Talk say;
    say.hello();
  }
.R
.i1e
.SS Class member access
.IT Use the member access operator to access members
.i1 General syntax is \fIobject_name\fR.\fImember_name\fR
.i1s
For example:
.CW
  \m[green]// define a simple struct, a 'POD'\m[]
  struct Fibonacci {
    short f5; short f6; short f7;
  };

  int main() {
    \m[green]// create foo with initial values\m[]
    Fibonacci foo = {5, 8, 13};
    \m[green]// use member access operator . to get values\m[]
    std::cout << "The fifth, sixth and seventh Fibonacci numbers are: " 
      << foo.f5 << ", "
      << foo.f6 << ", and "
      << foo.f7 << ".\\n";
.R
.i1e
.bp
.IT To access a member via a pointer, be careful of precedence
.i1s
Continuing the definition of Fibonacci from the previous slide
.CW
    \m[green]// The -> operator is used to 
    // access members of a pointer to a class
    // it's a convenience only:
    // a->b is generally easier to read than
    // (*a).b \m[]
    Fibonacci* bar = &foo;
    \m[green]// member access operator .\m[]
    \m[green]// has higher precedence than\m[]
    \m[green]// dereference operator *\m[]
    std::cout << "The fifth, sixth and 
         seventh Fibonacci numbers are (still): " 
      << bar->f5 << ", "
      << bar->f6 << ", and "
      << (*bar).f7 << ".\\n ";   \m[green]// same as ->\m[]
  }
.R
.i1e
.SS Constructors
.IT A function that \fIconstructs\fR an object from a class definition
.IT A constructor is a class member function
.i1 The function name is the same name as the class name
.i1 Has no return type
.IT \fBAll\fR classes have at least 1 \fBconstructor\fR
.i1 If you don't write one, the compiler will try to create it
.i2 Which is what our Fibonacci class did
.i1s
Date functions
.CW
  struct Date {
    int y, m, d;
    \m[green]// constructor\m[]
    Date ();
    \m[green]// also a constructor\m[]
    Date (int y, int m, int d);
    \m[green]// also a constructor\m[]
    Date (const Date& d);
    \m[green]// NOT a constructor!\m[]
    Date get_date ();
  };
.R
.i1e
.SS Questions

What are the issues with the original \*[c]Date struct\*[r] presented in the chapter?
.CW

  struct Date
  {
    int y;    \m[green]// year\m[]
    int m;    \m[green]// month\m[]
    int d;    \m[green]// day\m[]
  }
.R

.bp

What are the invariants of the \*[c]Date class\*[r] in the chapter?
.bp


When should functions be put in the class definition?



When should they be defined outside of the class?  


Why?
.bp



When is it acceptable to use a \*[c]struct\*[r]?  


When is it not acceptable?
.SS Interface and implementation
.IT A class is by default private
.i1s
Date class functions
.CW
  class date {
    int y, m, d; \m[green]// private implied\m[]
    public:
      date ();
      date (int y, int m, int d);
      std::tuple<int,int,int> date ();
  };
.R
.i1e
.IT This class does not allow direct access to y, m, and d
.i1 They can only be set using the 3 arg constructor provided
.i1 And can only be retrieved using \fCtuple date\fR function
.IT Public member function are the class \fBinterface\fR
.IT Everything hidden are \fBimplementation details\fR
.i1 No one needs to know (or care) how a Date is implemented
.bp
.IT Declare interfaces in your header files
.i1s
File date.h
.CW
  \m[green]#include <tuple>\m[]
  class date {
    int y, m, d;
    public:
      date ()
        : y{1776}, m{7}, d{4}
      { }
      date (int y, int m, int d);
      std::tuple<int,int,int> as_tuple ();
      int year ();
      int month ();
      int day ();
  };
.R
.i1e
.bp
.IT Implement interfaces in your cpp files
.i1s
File date.cpp
.CW
  \m[green]#include "date.h"\m[]
  \m[green]#include <tuple>\m[]
  \m[green]// could have implemented default constructor here
  // date::date () 
  //  : y{1776}, m{7}, d{4}
  // { } \m[]
  date::date (int year, int mon, int day)
      : y{year}, m{mon}, d{day}
  { }

  std::tuple<int,int,int> date::as_tuple () {
    return std::make_tuple(y, m,d);
  }
  int date::year ()  { return y; }
  int date::month () { return m; }
  int date::day ()   { return d; }
.R
.i1e
.IT As is, this class still needs a lot of work!
.SS Abstraction
.IT A poorly abstracted car class
.i1s
File car.h
.CW
  class Car {
    private:
      double speed_;
      double heading_;
      int    x_;
      int    y_;
    public:

      double car::speed ();
      double car::heading ();
      int    car::x ();
      int    car::y ();

      void car::speed (double speed);
      void car::heading (double direction);
      void car::x (int new_x);
      void car::y (int new_y);
  };
.R
.bp
.IT Better
.i1 Not every private member needs to be visible
.i1s
It makes no sense to modify location directly
.CW
  \m[green]// some helper types\m[]
  enum class Direction { CENTER, LEFT, RIGHT };
  \m[green]// a location on a cartesian grid\m[]
  struct Point {
    double x;   
    double y;
  };

class Car {
  private:
    string name_;       \m[green]// Make/model of this car\m[]
    double speed_;
    double heading_;
    Point  location_;   \m[green]// relative position of car\m[]
.bp
    \m[green]// OK in C++11\m[]
    double angle_ = 0;  \m[green]// current steering angle\m[]
    double rate_ = 0;   \m[green]// current change in speed\m[]

  public:
    Car(const std::string& name) 
      : name_{name}, speed_{0}, 
        heading_{90}, location_{0, 0} 
    {}
    \m[green]//mutator functions (setters)\m[]
    double steer (Direction dir);
    double accelerate (double rate);

    \m[green]//accessor functions (getters)\m[]
    std::string name() const;
    double speed()    const;
    double heading()  const;
    Point  location() const;
    void   update();
.R
.i1e
.SS Summary
.IT In C++ a class is a struct
.i1 With default private access
.IT Member functions
.IT Member access
.IT Constructors
.IT Data must be organized to be useful
.IT Data + operations = ADT (abstract data type)
.IT Why Bother?
.i1s
.B Abstraction
.i1e
.IT General principles
.i1 Keep data private
.i1 Keep class interfaces simple & minimal
.i1 Watch those invariants!
