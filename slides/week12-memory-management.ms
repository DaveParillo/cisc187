
.TL
.gcolor blue
Memory management
.gcolor
.LP
.ce 1
Week 12
.SS Overview
.IT Chapter 17 of the text
.IT Pointer ownership
.IT "Smart" pointers
.IT Destroying memory
.i1 The right way!
.SS Relation to week 4
.IT Introduced pointers during week 4
.i1 Sections 17.2 - 17.4
.i1 Should be a review of first semester pointer work
.IT Why are we coming back to pointers again?
.i1 Classes give us some better tools
.i1 Ensure our classes don't leak
.IT Chapter 19.5 covered some topics we weren't ready to discuss
.i1 Until now
.SS Ownership issues
.IT Notice how easy it is to incorrectly cleanup 
pointers even when they are all in a single function
.i1s 
Consider the following:
.CW
    \m[green]// calc returns a pointer to a double\m[]
    \m[green]// the caller is responsible for 
    // the memory allocated for res\m[]
    double* calc(int res_size, int max) {
        double* p = new double[max];    \m[green]//temp memory\m[]
        double* res = new double[res_size];
        \m[green]// use p to calculate results to be put in res\m[]
        delete[] p;    \m[green]// free temp memory \m[]
        return res;    \m[green]// can't free this here!\m[]
    }
    int main() {
        double* r = calc(100,1000);
        \m[green]// use r\m[]
        delete[] r;    \m[green]// easy to forget, error prone\m[]
    }
.i1e
.SS Pointer ownership
.IT Modern C++ is very much interested is solving the 'ownership problem'
.IT Given the previous example
.i1 What function 'owns' \fCres\fR?
.IT Design problems
.i1 The function that created the resource can't destroy it
.i1 \fCmain\fR uses it after \fCcalc\fR goes out of scope
.i1 It's not obvious (from main) which \*[c]delete\*[r] is correct
.IT One way to address this problem
.i1s 
Use a class to manage your resources
.CW
  class calc {
    double* p;
    double* res;
    \m[blue]public:\m[]
      calc() = delete;
      calc(int res_size, int max);
      ~calc();
      double* calculate();
  };
.R
.i1e
.SS calc Implementation
.i1s
Class calc owns the pointer
.CW
  #include "calc.h"
  calc::calc(int res_size, int max)
    : p {new double[max]} ,
      res {new double[res_size]} {
      for (int i = 0; i< res_size; ++i) {
        res[i] = i;
      }
    }
  calc::~calc() {
    puts(\m[green]"destroying calc resources"\m[]);
    delete [] p;
    delete [] res;
    res = nullptr;
  }
  double* calc::calculate() {
    \m[green]// use p to calculate results to be put in res\m[]
    return res;
  }
.R
.i1e
.SS Usage
.i1s
Resource cleanup handled automatically
.CW
  int main() {
    double* r = nullptr;

    {  \m[green]// define a scope to contain calc\m[]
      calc c = {100,1000};  \m[green]// acquire resource\m[]
      r = c.calculate();
      printf(\m[green]"some r is: %.2f\\n"\m[], r[42]);
    }  \m[green]// delete resource\m[]
  }
.R
.i1e
.IT This is called
.BI RAII
.i1 Resource Acquisition Is Initiallization
.SS Dynamic memory management
.IT There are safer ways since C++11 to manage memory
.i1 especially outside of constructors
.IT Raw \*[c]new\*[r] and \*[c]delete\*[r] are fairly thin wrappers 
.i1 around C's \*[c]malloc\*[r] and \*[c]free\*[r]
.i1 Still largely a manual process
.i1 \*[c]new\*[r] can throw exceptions
.IT C++11 provides the header \*[c]<memory>\*[r]
.i1 so-called "Smart pointers"
.i1 Provides automatic, exception-safe, object lifetime management
.IT One of the first was \*[c]auto_ptr\*[r]
.i1 You'll still see lots of suggestions for it's use
.i1 It is deprecated since C++11 and will be removed in C++17
.IT Prefer \*[c]unique_ptr\*[r] and \*[c]shared_ptr\*[r] instead
.SS Exploring unique_ptr
.IT Unique pointers \fIown\fR their pointers.
.i1 A \*[c]unique_ptr\*[r] HAS-A pointer as a member variable
.IT Use a \*[c]unique_ptr\*[r] like a local variable and it automatically destroys its pointer
.i1s
Given:
.CW
  #include <cstdio>
  #include <memory>

  struct Foo {
    Foo() {puts("Foo::Foo");};
    ~Foo() {puts("Foo::~Foo");};
    void bar() const {puts("Foo::bar");};
  };

  void f (const Foo& x) {
    puts("f (const Foo&)");
    x.bar();
  }
.bp
.R
.IT Use Foo on the heap safely
.i1s
Create a \*[c]unique_ptr\*[r] of Foo
.CW
\s-4
  int main()
  {
    std::unique_ptr<Foo> p1(new Foo);          \m[green]// p1 owns Foo\m[]
    if (p1) p1->bar();
     
    {                                          \m[green]// a scope for p2\m[]
      std::unique_ptr<Foo> p2(std::move(p1));  \m[green]// now p2 owns Foo\m[]
      f(*p2);
     
      p1 = std::move(p2);                      \m[green]// now p1 owns Foo\m[]
    }                                          \m[green]// p2 scope ends\m[]
    puts("destroyed p2");
     
    if (p1) p1->bar();
  }                           \m[green]// Foo destroyed when p1 scope ends\m[]
.R
.i1e
.SS Smart pointer calc
.IT Adding \*[c]unique_ptr\*[r] to our calc function
.i1s
Revert back to our function implementation
.CW
  #include <cstdio>
  #include <memory>

  double* calc(const int res_size, const int max) {
    double* p = new double[max];        \m[green]//temp memory\m[]
\m[red]
    std::unique_ptr<double[]> res {new double[res_size]()};\m[]

    for (int i = 0; i< res_size; ++i) { res[i] = i; }

    \m[green]// use p to calculate results to be put in res\m[]
    delete[] p;    \m[green]// free temp memory \m[]
    return res.release();    \m[green]// give away pointer\m[]
  }
.bp
  int main() {
    double* r = calc(100,1000);
    printf("some r is: %.2f\n", r[42]);
    \m[green]// no delete here because r is about to go out of scope\m[]
  }
.R
.i1e
.IT But now calc releases a free pointer into 'the wild'
.i1 Which the caller has to manage

.SS Changing ownership
.IT A \*[c]unique_ptr\*[r] cannot be copied
.i1s
But it \fBcan\fR be \fImoved\fR
.CW
  #include <memory>
  #include <vector>
  #include "make_unique.h"

  \m[red]std::unique_ptr<vector<double>>\m[]
  calc(const int res_size, const int max) {
    double* p = new double[max];        \m[green]//temp memory\m[]
    auto res = mesa::make_unique <vector<double>>();

    for (int i = 0; i< res_size; ++i) {
      res->push_back(i);
    }
    \m[green]// use p to calculate results to be put in res\m[]
    delete[] p;    \m[green]// free temp memory \m[]
    \m[green]// return and transfer ownership\m[]
    return \m[red]std::move(res)\m[];
  }
.bp
  int main() {
    auto r = calc(100,1000);
    printf("some r is: %.2f\n", r->at(42));
  }
.R
.i1e 
.IT Advantages
.i1 No unnecessary classes
.i1 No uncertainty about ownership
.i1 Pointer is destroyed when leaving a scope
.i2 Unless explicitly moved
.i1 users retain a clean functional syntax
.i1 Practically zero cost
.SS Summary
.IT Destroy memory carefully
.i1 Too much gets you in as much trouble as too little
.i1 Memory 'leaks' are the #1 source of bugs in C/C++ programs
.IT Ownership issues
.i1 Use RAII whenever possible
.IT Rules of thumb
.i1 Prefer \*[c]<memory>\*[r] over raw \*[c]new\*[r] and \*[c]delete\*[r]
.i1 If you \fBmust\fR use raw \*[c]new\*[r] and \*[c]delete\*[r]
.i2 Keep raw \*[c]new\*[r] in your constructors 
.i2 Keep raw \*[c]delete\*[r] in your destructors 
.i1 This ensures you call \*[c]delete\*[r] once for each \*[c]new\*[r]
.IT Initializing and moving \*[c]unique_ptr\*[r]

.IT Use \fBvalgrind\fR to check for memory leaks



