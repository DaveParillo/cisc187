
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
      std::puts("Hello, world!");
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
.SS Interface and implementation
.IT A class is by default private
.i1s
Date class functions
.CW
  class Date {
    int y, m, d; \m[green]// private implied\m[]
    public:
      \m[green]// also a constructor\m[]
      Date (int y, int m, int d);
      \m[green]// NOT a constructor!\m[]
      Date get_date ();
  };
.R
.i1e
.IT This class does not allow direct access to y, m, and d
.i1 They can only be set using the 3 arg constructor provided
.i1 And can only be retrieved using \fCget_date\fR function
.IT Public member function are the class \fBinterface\fR
.IT Everything hidden are \fBimplementation details\fR
.i1 No one needs to know (or care) how a Date is implemented
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
.i1 OK to call a \fInon-modifying member function\fR
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
.SS Testing programs
.IT There are many ways to test
.i1 I provided a minimal test function with Project #1
.IT The Boost library provides a \fCBoost::Test\fR namespace
.i1 Composed of a collection of macros
.i1 Enables relatively easy \fIunit testing\fR
.IT Unit testing is a \fIpattern\fR
.RS
\s-4
1.  Call a function using known inputs
.br
2.  Compare the actual results received to the expected results
.RE
.IT Unit tests
.i1 Test a single \fBunit\fR of software (a function)
.i1 Test only public functions
.i1 Test 'significant' functions
.i2 Getters and setters are not normally unit tested
.SS Why bother?
.IT Unit testing makes you \fBbrave\fR
.IT Once you have a battery of good tests
.i1 You can rewrite the internals of a function
.i2 As long as you don't change the function interface
.i1 Rerun your unit tests and prove that your code works exactly the same as before the modification
.IT Efficiency improvements
.i2 Refactoring to use different containers
.i2 Or STL algorithms
.IT Unit tests are a form of documentation
.i2 Or an 'executable specification'
.i1 Improves clarity
.IT It's faster in the long run
.i1 As you project grows, regression testing takes longer
.i1 Automated tests reduce time spent regression testing
.i1 And allow automated execution by other software
.i2 Continuous integration
.i2 Integrated development environments
.SS Caveats
.IT There is no 'free lunch'
.i1 For this to work, your tests have to be \m[blue]\fBgood\fR\m[]
.i1s
Dijkstra quote:
.RS
.QP
\s-8
Program testing can be used to show the presence of bugs, 
.br
but never to show their absence!
.RE
.LP
.i1e
.i1 If your function interfaces are unstable
.i2 You'll find yourself rewriting a lot of unit tests
.i2 If your functions are small to start, this is not likely a problem
.SS Summary
.IT In C++ a class is a struct
.i1 With default private access
.IT Member functions
.IT Member access
.i1 \*[c]const\*[r] functions and objects
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
.IT Unit testing
