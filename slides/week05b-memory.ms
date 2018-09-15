
.TL
.gcolor blue
STL memory management
.gcolor
.LP
.ce 1
Week 5
.SS Overview
.IT Pointer ownership
.IT "Smart" pointers
.IT Destroying memory
.i1 The right way!
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
.SS STL memory management
.IT The STL provides tools to make ownership explicit
.IT Raw \*[c]new\*[r] and \*[c]delete\*[r] are fairly thin wrappers 
.i1 around C's \*[c]malloc\*[r] and \*[c]free\*[r]
.i1 Still largely a manual process
.i1 \*[c]new\*[r] can throw exceptions
.IT C++11 provides the header \*[c]<memory>\*[r]
.i1 so-called "Smart pointers"
.i1 Provides automatic, exception-safe, object lifetime management
.IT One of the first was \*[c]auto_ptr\*[r]
.i1 You'll still see lots of suggestions for it's use
.i1 It is deprecated since C++11 and was removed in C++17
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
Doesn't improve much.
.CW
  #include <cstdio>
  #include <memory>

  double* calc(const int res_size, const int max) {
    double* p = new double[max];        \m[green]//temp memory\m[]
\m[red]
    std::unique_ptr<double[]> res {
             new double[res_size]()};\m[]

    for (int i = 0; i< res_size; ++i) { res[i] = i; }
    \m[green]// use p to calculate results to be put in res\m[]
    delete[] p;    \m[green]// free temp memory \m[]
    return res.release();    \m[green]// give away pointer\m[]
  }
.bp
  int main() {
    double* r = calc(100,1000);
    printf("some r is: %.2f\n", r[42]);
    delete[] r;
  }
.R
.i1e
.IT Calc still returns a raw pointer
.i1 Which the caller has to manage
.i1 Never transfer ownership with a raw pointer (T*)
.SS Changing ownership
.IT A \*[c]unique_ptr\*[r] cannot be copied
.i1s
But it \fBcan\fR be \fImoved\fR
.CW
  #include <memory>
  #include <vector>
  \m[red]std::unique_ptr<vector<double>>\m[]
  calc(const int res_size, const int max) {
    double* p = new double[max];        \m[green]//temp memory\m[]
    auto res = std::make_unique <vector<double>>();

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
.SS Avoiding manual memory management
.IT The calc example doesn't need pointer management
.i1s
A \*[c]vector\*[r] manages its own memory
.CW
  #include <vector>

  \m[red]vector<double>\m[]
  calc(const int res_size, const int max) {
    \m[green]// vector data is on the free store\m[]
    vector<double>  res (res_size);
    for (int i = 0; i< res_size; ++i) {
      res.push_back(i);
    }
    return \m[red]res\m[];    \m[green]// vectors know how to move \m[]
  }

  int main() {
    auto r = calc(100,1000);
    printf("some r is: %.2f\n", r->at(42));
  }
.R
.i1e 
.SS Summary
.IT Destroy memory carefully
.i1 Too much gets you in as much trouble as too little
.i1 Memory 'leaks' are the #1 source of bugs in C/C++ programs
.IT Ownership issues
.IT Rules of thumb
.i1 Prefer containers over \*[c]<memory>\*[r]
.i1 Prefer \*[c]<memory>\*[r] over raw \*[c]new\*[r] and \*[c]delete\*[r]
.i1 We will cover more techniques in week 14

.IT Use \fBvalgrind\fR to check for memory leaks



