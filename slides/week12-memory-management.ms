
.TL
.gcolor blue
Memory management
.gcolor
.LP
.ce 1
Week 12
.SS Overview
.IT Destroying memory
.IT 'Smart' pointers
.IT \*[c]#include <memory>\*[r] 
.IT Casts
.SS Destroying memory
.IT Some noticed on Monday how easy it is to incorrectly cleanup 
pointers even when they are all in a single function
.i1s 
Consider the following:
\s-4
.CW
    \m[green]// calc returns a pointer to a double\m[]
    double* calc(int res_size, int max)
    \m[green]// the caller is responsible for the memory allocated for res\m[]
    {
        double* p = new double[max];        \m[green]//temp memory\m[]
        double* res = new double[res_size];
        \m[green]// use p to calculate results to be put in res\m[]
        delete[] p;    \m[green]// free temp memory \m[]
        return res;    \m[green]// can't free this here!\m[]
    }
    int main()
    {
        double* r = calc(100,1000);
        \m[green]// use r\m[]
        delete[] r;    \m[green]// easy to forget, error prone\m[]
    }
.i1e
.bp
.IT Rules of thumb
.IT If you \fBmust\fR use raw \*[c]new\*[r] and \*[c]delete\*[r]
.i1 Keep raw \*[c]new\*[r] in your constructors 
.i1 Keep raw \*[c]delete\*[r] in your destructors 
.IT This ensures you call \*[c]delete\*[r] once for each \*[c]new\*[r]
.IT Deleting a \fInull pointer\fR does nothing
\s-4
.CW
    double* d = nullptr;  \m[green]// C++11 preferred syntax\m[]
    double* x = 0;        \m[green]// 'classic' syntax\m[]
    delete d;
    delete d;
    delete d;   \m[green]// unlike a non-null, no crash\m[]
.R
\s+4
.SS Dynamic memory management
.IT There are safer ways since C++11 to manage memory
.IT especially outside of constructors
.IT Raw \*[c]new\*[r] and \*[c]delete\*[r] aren't much better than 
the old C \*[c]malloc\*[r] and \*[c]free\*[r]
.i1 Still largely a manual process
.i1 \*[c]new\*[r] can throw exceptions
.IT C++11 provides the header \*[c]<memory>\*[r]
.i1 'Smart pointers'
.i1 Provides automatic, exception-safe, object lifetime management
.IT One of the first was \*[c]auto_ptr\*[r]
.i1 You'll still see lots of suggestions for it's use
.i1 It is deprecated since C++11 and will be removed in C++17
.IT Prefer \*[c]unique_ptr\*[r] and \*[c]shared_ptr\*[r] instead
.SS Using unique_ptr
.IT Unique pointers \fIown\fR their pointers.
.IT Use a \*[c]unique_ptr\*[r] like a local variable and it automatically destroys its pointer
.i1s
Given:
.CW
  #include <iostream>
  #include <memory>
     
  struct Foo
  {
    Foo()      { std::cout << "Foo::Foo\\n";  }
    ~Foo()     { std::cout << "Foo::~Foo\\n"; }
    void bar() { std::cout << "Foo::bar\\n";  }
  };
     
  void f(const Foo &)
  {
    std::cout << "f(const Foo&)\n";
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
    std::cout << "destroyed p2...\\n";
     
    if (p1) p1->bar();
  }                           \m[green]// Foo destroyed when p1 scope ends\m[]
.R
.i1e
.SS Casts
.IT Types of casts
.i1 \*[c]static_cast\*[r]
.i2 Explicitly converts a value to a new type
.i1 \*[c]dynamic_cast\*[r]
.i2 Safely converts pointers and references up & down the inheritance hierarchy
.i1 \*[c]const_cast\*[r]
.i2 Explicitly converts between types with different \*[c]const\*[r] qualifications
.i1 \*[c]reinterpret_cast\*[r]
.i2 Converts between types by reinterpreting the underlying bit pattern
.i3 Literally, treat a sequence of bits \fIas if it were a new type\fR
.SS Summary
.IT Destroy memory carefully
.i1 Too much gets you in as much trouble as too little
.i1 Memory 'leaks' are the #1 source of bugs in C/C++ programs
.IT Prefer \*[c]unique_ptr\*[r] and \*[c]shared_ptr\*[r] over 
raw \*[c]new\*[r] and \*[c]delete\*[r]
.IT Casts
.i1 \*[c]static_cast\*[r] when you must
.i1 \*[c]dynamic_cast\*[r] when changing between types in a hierarchy



