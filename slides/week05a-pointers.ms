
.TL
.gcolor blue
Pointers
.gcolor
.LP
.ce 1
Week 5
.SS Overview
.IT Sections 17.2 - 17.4 & 21.4.3 of the text
.i1 Ch 17 should be a review of what you already learned about pointers last semester
.i1 Ch 21, section 21.4.3 gives a far too brief description of lambdas
.IT References review
.IT References and Pointers
.IT Pointers
.SS References
.IT We've been using these for several weeks
.i1s 
The \fIaddress of\fR operator \*[c]&\*[r] allows us to pass by reference
.CW
  void by_value(int x) 
  {
    x = 99;
    std::cout << "in by_value the address of x is " 
              << &x << '\\n';
  }
  void by_reference (int& x)
  {
    std::cout << "in by_ref the address of x is   " 
              << &x << '\\n';
    x = -1;
  } 
.i1e
.bp
.IT And no special character is needed of you want to use a function that takes a reference
.CW
  int main ()
  {
    int beta = 11;
    std::cout << "the address of beta is " 
              << &beta << '\\n';

    by_value(beta);       \m[green]// just pass in beta\m[]

    std::cout << "beta = " << beta << '\\n';

    by_reference(beta);  \m[green]// just pass in beta\m[]

    std::cout << "beta is now " 
              << beta << '\\n';
  }
.R
.SS Advantages and Disadvantages
.IT A reference must always be initialized
.i1 Therefore, can \fInever\fR be \*[c]null\*[r]
.IT A reference can't be reassigned to a different object
.i1 A \*[c]const\*[r] reference means you can't modify the value of the reference
.IT References are simpler, more limited, and safer than pointers

.IT Things you can't do with references
.i1 Assign an address to them
.i1 Operate on them 
.i2 i.e. increment the referred to memory address
.i2 Use a single reference to refer to more than one object
.i1 Use them in containers such as \*[c]vector\*[r]
.i2 Containers can only hold \fIassignable\fR entities

.IT But we need to be able to do all these kinds of memory 
.br
manipulations, How?
.SS Hello, Pointers!
.IT A \fIpointer\fR points to a location in memory
.i1 It's an address, so 'feels' like a reference
.i1 But it is much more powerful
.IT A pointer is defined by the operator \*[c]*\*[r] \fBand\fR a type
.CW
  int main() {
    int n = 5; \m[green]// a stack int\m[]
    int* p;    \m[green]// a pointer to an int\m[]
    p = &n;    \m[green]// p now points to n\m[]
  }
.R
.SS Using pointers
.IT The \fBaddressof operator\fR \*[c]&\*[r]
.i1s 
Get the address of a pointer variable
.CW
  int n = 2;
  int* p = &n;  \m[green]// points to n\m[]
  int* q = p;   \m[green]// points to n also\m[]
.R
.i1e
.i1 The value returned by \fC&n\fR will be an address 
.i2 Can be stored in another pointer variable of the same type
.IT The \fBdereference operator\fR \*[c]*\*[r]
.i1 Retrieves the value pointed to by a pointer
.i1s
Once dereferenced, it's treated exactly like any other variable of that type
.CW
  int n = 2;
  int* p = &n;
  *p = *p + *p; \m[green]// n = ?\m[]
.R
.i1e

.SS Free-store pointers
.IT Up to now, all our pointers have been \fIstack pointers\fR
.IT Can point to heap memory also
.IT The \*[c]new\*[r] operator
.i1s
Allocates \fInew memory\fR on the free-store
.CW
  \m[green]// get (allocate) a new uninitialized int\m[]
  int* p1 = new int;         \m[green]// dangerous\m[]

  \m[green]// get a new int initialized to 5\m[]
  int* p2 = new int{5};
  int* p3 = new int(5);  \m[green]// ditto\m[]
  int* p4 = new int[5];  \m[green]// an array of 5 \m[]
                         \m[green]// uninitialized ints\m[]
.R
.i1e
.IT Use the \*[c]delete\*[r] keyword to free memory allocated using \*[c]operator new\*[r]
.CW

  delete   p1;  \m[green]// free memory allocated for p1\m[]
  delete[] p4;  \m[green]// free array memory\m[]
.R
.SS Pointers and References
.IT We can pass pointers to a function that expects a reference
\s-8
.CW
  void by_reference (int& x)
  {
    std::cout << "in by_ref the address of x is   " 
              << &x << '\\n';
    x = -1;
  }

  int main() 
  {
    int* p = new int{5};    \m[green]// add p to free store\m[]
    by_reference(*p);       \m[green]// use p\m[]
    delete p;               \m[green]// release p memory\m[]
  }
.R
\s+8
.IT If we pass in only \fCp\fR, what happens?
.SS Pointers
.IT A pointer can point to \fIanything\fR
.i1 Or nothing
.IT The compiler will (almost) never complain about a value you assign to a pointer
.i1 A pointer is just an address
.i2 Once you have an address (even a wrong one), you can do anything 
.IT But you can't mix types
.i1 A pointer \fBis\fR a type
.CW

  double* p2 = new int[5];  \m[green]// error\m[]

.R
.i1 There is no 'implicit conversion' of pointer types
.i1 Pointer must know the size of the thing pointed to
.i1 But you can easily convert between pointers and references
.i1 And copy and assign pointers

.bp
.IT What does this program print?
\s-8
.CW
  #include <iostream>
  using std::cout;
  using std::endl;
  int main() 
  {
    int* p1 = new int;
    int* p2 = new int{5};

    int x = *p1;  \m[green]// put the int pointed to by p1 in x\m[]
    int y = *p2;

    cout << "P1:  " << p1  << "P2:  " << p2  << endl;
    cout << "X:   " << x   << "Y:   " << y   << endl;
    cout << "&X:  " << &x  << "&Y:  " << &y  << endl;
    cout << "*P1: " << *p1 << "*P2: " << *p2 << endl;
    cout << "&(*P1): " << &(*p1) << endl;
    cout << "&(*P2): " << &(*p2) << endl;
  }
.R
.bp
.SS Null pointers
.IT We mentioned that unlike a reference
.i1 A pointer might point to 'nothing'
.IT What exactly is 'nothing'?
.IT Prior to C++11, there was no unambiguous definition
.i1s
Typically the value 0 was used (often \fC0LL\fR)
.CW
  #define NULL 0LL
.R
.i1e
.IT This definition carries over from standard C

.IT Problem: null pointers are the same type as regular integral types
.i1 OK, not a valid address
.i1 But, creates problems regular old C never had to handle
.i2 Function overloads
.IT Problem: there is no standard definition for the macro \fCNULL\fR
.bp
.IT Solution
.i1s
C++11 introduces \*[c]nullptr\*[r] which is a distinct type
.CW
  #include <iostream>
  \m[green]// Three overloads of f\m[]
  void f(int)   { std::cout << "f(int)\\n"; }
  void f(bool)  { std::cout << "f(bool)\\n"; }
  void f(int*)  { std::cout << "f(int*)\\n"; }

  int main() {
    f(0);       \m[green]// calls f(int) overload, not f(int*)

    //f(NULL);  // might not compile, typically calls
                // f(int) overload.  
                // Never calls f(int*)\m[]
    f(nullptr);  \m[green]// calls f(int*) overload\m[]
  }
.R
.i1e
.bp
.IT Keep in mind that \*[c]nullptr\*[r] is a distinct type
.i1 Not a pointer type, pointer to member, integral type, etc.

.IT There are other reasons to favor \*[c]nullptr\*[r]
.i1 Clarity
.i1 Correctness
.i1 Templates
.i2 \*[c]nullptr\*[r] implicity converts to a pointer type

.IT See example source: 
.br
\fCweek05/item08-prefer-nullptr-to-NULL\fR
.SS Summary
.IT References refer to an object
.i1 Stored at some location (address)
.IT References are simple, safe, but limited
.IT Pointers store a memory address
.IT Pointers can point to anything
.i1 Pointers don't 'know' what they point to
.IT Use \*[c]new\*[r] to allocate space on the heap
.i1 a.k.a the \fCfree store\fR
.IT Use \*[c]delete\*[r] to recycle space on the heap
.i1 Use \*[c]delete\*[r] for single primitives & objects
.i1 Use \*[c]delete[]\*[r] for arrays
.IT Alternatives to \*[c]new\*[r] and \*[c]delete\*[r]
.i1 When we talk about 'memory management' after the mid-term
.IT Null pointers

