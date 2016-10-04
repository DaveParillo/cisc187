
.TL
.gcolor blue
Pointers
.gcolor
.LP
.ce 1
Week 7
.SS Overview
.IT Destroying memory
.IT \*[c]#include <memory>\*[r] 
.IT Pointers to \*[c]void*\*[r]
.IT Casts
.SS Destroying memory
.IT Some noticed on Monday how easy it is to incorrectly cleanup 
pointers even when they are all in a single function
.i1s 
Consider the following:
\s-4
.CW
    // calc returns a pointer to a double
    double* calc(int res_size, int max)
    // the caller is responsible for the memory allocated for res
    {
        double* p = new double[max];        //temp memory
        double* res = new double[res_size];
        // use p to calculate results to be put in res
        delete[] p;    // free temp memory 
        return res;    // can't free this here!
    }
    int main()
    {
        double* r = calc(100,1000);
        // use r
        delete[] r;    // easy to forget, error prone
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
    double* d = nullptr;  // C++11 preferred syntax
    double* x = 0;        // 'classic' syntax
    delete d;
    delete d;
    delete d;   // unlike a non-null, no crash
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
.i1s
Use a unique_ptr like a local variable and it automatically destroys its pointer
.CW
  #include <iostream>
  #include <memory>
     
  struct Foo
  {
    Foo()      { std::cout << "Foo::Foo\n";  }
    ~Foo()     { std::cout << "Foo::~Foo\n"; }
    void bar() { std::cout << "Foo::bar\n";  }
  };
     
  void f(const Foo &)
  {
    std::cout << "f(const Foo&)\n";
  }
.bp     
  int main()
  {
    std::unique_ptr<Foo> p1(new Foo);  // p1 owns Foo
    if (p1) p1->bar();
     
    {
      std::unique_ptr<Foo> p2(std::move(p1));  // now p2 owns Foo
      f(*p2);
     
      p1 = std::move(p2);  // ownership returns to p1
      std::cout << "destroying p2...\n";
    }
     
    if (p1) p1->bar();
    // Foo instance is destroyed when p1 goes out of scope
  }
.R
.SS void pointers
.IT \*[c]void*\*[r] means
.i1 Pointer to some memory the compiler doesn't know the type of
.i2 It is (almost) a raw machine address
.IT Legitimate uses
.i1 Calls between functions in different languages
.i1 Templates where the provided value could literally be \fIanything\fR
.i2 Like the actual implementation of \*[c]new\*[r] in C++
.IT Important!
.i1 \*[c]void*\*[r] is not the same as \*[c]void\*[r]
.i1s
There are no objects of type void
.CW
  int i;           // declare an int
  void x;          // error!  void is not a type
  void print();    // function returns nothing
.R
.i1e
.i1s
\fBAny\fR pointer can be assigned to \*[c]void*\*[r]
.CW
  int*    i  = new int{5}; 
  double* x  = new double[10];
  int*    j  = i;             // error
  void*   p1 = i;             // OK
  void*   p2 = d;             // OK
  int*    i2 = p1;            // error
.R
.i1e

.SS Using void pointers
.IT The compiler can't know the size of the value pointed to
.i1s
\*[c]void\*[r] isn't a type, so it has no size
.CW
  int*    i = new int{5}; 
  void*   p = i;             // OK
  int*    j = p;             // error
.R
.i1e
.IT We have to give the compiler size information
.IT Use one of C++ \fIcasts\fR to convert \*[c]void*\*[r]
.i1s
To another pointer type that has a size
.CW
  // explicit conversion with cast
  int*    j = static_cast<int*>(p);
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
.i3 Literally, treat the a sequence of bits \fIas if it were a new type\fR
.SS Summary
.IT Destroy memory carefully
.i1 Too much gets you in as much trouble as too little
.i1 Memory 'leaks' are the #1 source of bugs in C/C++ programs
.IT Prefer \*[c]unique_ptr\*[r] and \*[c]shared_ptr\*[r] over 
raw \*[c]new\*[r] and \*[c]delete\*[r]
.IT Pointers to \*[c]void*\*[r]
.i1 Use when you must, don't otherwise
.i2 You're giving up what little checking the compiler can do
.IT Casts
.i1 \*[c]static_cast\*[r] when you must
.i1 \*[c]dynamic_cast\*[r] when changing between types in a hierarchy





