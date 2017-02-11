
.TL
.gcolor blue
Pointers
.gcolor
.LP
.ce 1
Week 4
.SS Overview
.IT Sections 17.2 - 17.4 & 21.4.3 of the text
.i1 Ch 17 should be a rview of what you already learned about pointers last semester
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
.IT References are simpler,more limited and safer than pointers

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
.i1 But it is much more powerful (and dangerous)
.IT A pointer is defined by the operator \*[c]*\*[r] \fBand\fR a type
.CW

  \m[green]// get (allocate) a new uninitialized int\m[]
  int* p1 = new int;         \m[green]// dangerous\m[]

  \m[green]// get a new int initialized to 5\m[]
  int* p2 = new int{5};
  int* p2 = new int(5);  \m[green]// ditto\m[]
  int* p2 = new int[5];  \m[green]// an array of 5 \m[]
                         \m[green]// uninitialized ints\m[]
.R
.IT And you can assign the value a pointer points to
.CW

  int x = *p1;  \m[green]// wonder what this points to...\m[]
  int y = *p2;

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
.SS Pointers 
.IT All the examples in the book assume you are not insane
.i1 It uses \*[c]operator[]\*[r] only when the type is an array.
.CW
  int* a = new int[3];
  a[0] = 6;
  a[1] = a[0] + 2;
  int* x = new int{3};
  int y = *x + 2;
.R
.IT But pointers provide no safeguards
.IT Does this compile?
\s-8
.CW
  #include <iostream>
  using std::cout;
  using std::endl;
  int main() 
  {
    int* x = new int{3};
    int y = x[99] + 2;
    cout << y << endl;
  }
\s+8
.R
.bp
.IT Yes.
.i1 Even with \fC -Wall -Wextra\fR
.i2 g++ does not make a peep
.i1s
Even in clang with \fC -Weverything\fR
.CW
  warning: generalized initializer lists are incompatible with C++98 [-Wc++98-compat]
    int* x = new int{3};
                    ^
.R
.i1e
.IT No compiler will inform you that
.i1 You just accessed a piece of memory 98 \*[c]int\*[r]s past the one you own
.i1 Whatever it is, you then added 2 to it
.i1 And assigned that value to \fCy\fR
.IT Heck, it doesn't even know your pointer is just to one \*[c]int\*[r] 
and not an \fIarray\fR of \*[c]int\*[r]s
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

