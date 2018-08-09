
.TL
.gcolor blue
Abstraction
.gcolor
.LP
.ce 1
Week 11
.SS Overview
.IT Using \*[c]const\*[r] in classes
.IT A word about unit testing
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
.bp
.IT Calling member functions
.i1s
You can declare a \fImember function\fR \*[c]const\*[r]
.CW
  bool verbose() \m[red]const\m[] {
    return \m[blue]true\m[];
  }
.R
.i1e
.i1 Here \*[c]const\*[r] tells the compiler 
.i2 This function \fBwill not change\fR the object state
.i1 It is a \fIpromise\fR
.i2 If a \*[c]const\*[r] function attempts to change \fBany\fR class member, 
.i2 Then a compile error results

.IT Important compiler note:
.i1 Only member functions can be marked \*[c]const\*[r]
.SS A const object
.IT What is \*[c]const\*[r] here
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
.i1e
.SS Adding a const function
.IT What is \*[c]const\*[r] here
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
.i1e
.SS Testing programs
.IT There are many ways to test
.i1 Labs and example source use \fCdoctest\fR
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

.IT There are loads of examples for this course
.i1 Nearly every lab is unit tested using \*[c]check187\*[r]
.i1 Find them in \fClabs/test_cases\fR on github or on buffy
.SS Summary
.IT Member access
.i1 \*[c]const\*[r] functions and objects
.IT General principles
.i1 Keep data private
.i1 Keep class interfaces simple & minimal
.IT Unit testing
