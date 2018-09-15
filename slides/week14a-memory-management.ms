
.TL
.gcolor blue
Memory management
.gcolor
.LP
.ce 1
Week 14
.SS Overview
.IT Pointer ownership
.IT "Smart" pointers
.IT GSL \*[c]owner<T*>\*[r]
.IT Destroying memory
.SS Relation to week 5
.IT Introduced pointers during week 5
.i1 Sections 17.2 - 17.4
.i1 Should be a review of first semester pointer work
.IT Why are we coming back to pointers again?
.i1 Object oriented memory management tools
.IT Chapter 19.5 covered some topics we weren't ready to discuss
.i1 Until now
.SS Ownership issues from week 5
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
.SS GSL \fCowner<T*>\fP
.IT GSL is the \fIGuidelines Support Library\fR
.i1 https://github.com/Microsoft/GSL
.i1 Implementation of suggestions from the C++ Core Guidelines
.i1 Requires C++14, uses some C++17 features
.IT GSL pointers contains 'ownership pointers'
.i1s
Defined as a templated type alias
.CW
  namespace gsl { template <typename T> owner = T; }
.R
.i1e
.IT Operations that would cause the pointer to point elsewhere are disabled
.i1 \*[c]operator++()\*[r], \*[c]operator--()\*[r], etc.
.i1 \*[c]operator+=(std::ptrdiff_t)\*[r]
.i1 \*[c]operator[](std::ptrdiff_t) const\*[r]
.i1 Anything that adds/subtracts from pointer value
.SS GSL Example
.IT \*[c]owner<T*>\*[r] is easy to use
.i1 But still just a marker.
.i1s
A wrapper around a pointer type
.CW
  #include <cassert>
  #include <gsl/pointers>
  void func (int*);
  
  int main() {
    gsl::owner<int*> p = new int(13);
    assert (*p == 13);
    func(p);
    assert (*p == 14);
    delete p;
  }
  void func (int* i) {
    *i += 1;
  }
.R
.i1e
.bp
.IT More examples
.i1s
Return an owner from a function
.CW
  gsl::owner<int*> meaning_of_life() { 
    return gsl::owner<int*>(new int(42)); 
  }
.R
.i1e

.i1s
Owners must be assigned to owners
.CW
  int* foo =  meaning_of_life(); \m[green]// bad\m[]
  gsl::owner<int*> baz =  meaning_of_life(); \m[green]// good\m[]
.R
.i1e

.i1s
Do not assign references to owners
.CW
  int foo = 13;
  gsl::owner<int*> owned =  &foo; \m[green]// bad\m[]
.R
.i1e
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

.IT Use \fBvalgrind\fR to check for memory leaks



