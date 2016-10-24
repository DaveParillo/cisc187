
.TL
.gcolor blue
Templates
.gcolor
.LP
.ce 1
Week 10
.SS Overview
.IT Project #1
.IT Accessing private class members
.IT Finishing the \*[c]vector\*[r] API
.IT Templates
.IT 
.SS Accessing private class members
.IT Consider the vector from the book
.CW

\s-8
  class vector {
      int \m[red]sz\m[];
      double* \m[red]elem\m[];
      void copy(const vector& arg);
    public:
      vector(int s) :sz(s), elem(new double[s]) { }
      ~vector() { delete[] elem; }

      int size() const { return sz; } 

      double get(int n) { return elem[n]; } 
      void set(int n, double v) { elem[n]=v; } 
      vector& operator=(const vector&); 
  };
.R
.bp
.IT and two member functions
.CW
\s-8
  void \m[blue]vector\m[]::copy(const \m[blue]vector\m[]& arg) {
      for (int i = 0; i<\m[red]arg.sz\m[]; ++i) elem[i] = \m[red]arg.elem[i]\m[];
  }
  vector& \m[blue]vector\m[]::operator=(const \m[blue]vector\m[]& a) {
      double* p = new double[\m[red]a.sz\m[]];
      copy(a);
      delete[ ] elem;
      elem = p;
      sz = \m[red]a.sz\m[];
      return *this;
  }
.R
.IT When this came up in class I said it was an error
.i1 The error was mine
.IT It is perfectly correct for a class instance
.i1 to refer directly to a private member of it's own class
.i1 when inside a member function
.SS Finishing the vector API
.IT Real containers, like \*[c]vector\*[r], 
always include an optimization to anticipate storage needs
.CW
\s-8
  class vector {
      int sz;       // number of elements
      double* elem; // address of first element
      int space;    // number of elements plus "free space"/"slots"
                    // for new elements ("the current allocation")
  public:
      vector();
      // ...
  };
.R

\s+8
and graphically:
.PS 5.0
boxwid = .5
boxht = .5

A: box
B: box with .n at A.s
C: box with .n at B.s
T: box with .w at B.e + (1,0)
U: box with .w at T.e 
W: box wid 2.5 dashed with .w at U.e
X: box dashed with .w at B.e + (4,0)
Y: box wid 2.5 dashed with .w at X.e
Z: box dashed with .w at Y.e



spline dashed from A.n up boxwid right boxwid \
	then up boxwid*0.8 right 1.75 \
	then right 1.75 down boxwid*0.8 \
	then right boxwid down -> to X.n
arrow dashed from B.e to T.w
spline dashed from C.s down boxwid right boxwid \
	then down boxwid*0.8 right 3.2 \
	then right 3.2 up boxwid*0.8 \
	then right boxwid up -> to Z.s


"\s-8sz:\s+8" with .e at A.w + (-1.15,0)
"\s-8elem:\s+8" with .e at B.w + (-1.4,0)
"\s-8space:\s+8" with .e at C.w + (-1.5,0)

"\s-80\s+8" with .s at T.n + (0, 0.3)
"\s-(10Elements\s+(10" "\s-(10(initialized)\s+(10" with .n at T.s + (0.5, -0.5)
"\s-8sz\s+8" with .n at X.s + (0, -0.3)
"\s-(10Free space\s+(10" "\s-(10(uninitialized)\s+(10" with .s at Y.n + (0, 0.5)


.PE
.SS Changing size
.IT Initially, there is no free space
.i1 Don't allocate extra memory until \fCpush_back\fR is called
.i2 What happens then?
.IT We \fIreserve\fR enough memory to store the current element and then some
\s-8
.CW
  void vector::reserve(int newalloc)
  {
      if (newalloc<=space) return;      // never decrease allocation
      double* p = new double[newalloc]; // allocate new space
      for (int i=0; i<sz; ++i) {
        p[i] = elem[i];                 // copy old elements
      }
      delete[ ] elem;                   // deallocate old space
      elem = p;
      space = newalloc;        
  }
.R
\s+8
.bp
.IT Each time \fCpush_back\fR us called
.i1 The free \fCspace\fR is checked
.i1 If \fCsz == space\fR need to call reserve to make more space
.i1s 
The \fCcapacity\fR function
.CW
  int vector::capacity() const { return space; }
.R

allows users to know if a reallocation of memory is about to occur
.i1e
.IT Every function that may add an element to the vector
.i1s
Needs to call reserve
.CW
  void vector::push_back(double d)
  {
      // no more free space: get more
      if (space==0)
          reserve(8);
      else 
      if (space==sz)
          reserve(2*space);

      elem[sz] = d;    // add d at end
      ++sz;            // increase the size
  }
.R
.IT Keep in mind \fCsz\fR is keeping track of the number of elements used
.i1 Not the capacity of the array
.IT Doubling the reserve each time capacity is reached
.i1 Is a fairly typical strategy
.IT Strikes a balance between competing goals
.i1 Creating storage never used
.i1 Excessive array copy operations when storage is used up
.SS Our vector so far
.IT A fairly complete implementation
\s-8
.CW
  class vector {
    int sz;           // the number of elements stored
    double* elem;     // backing storage
    int space;        // size plus number of free slots
  public:
    vector() 
      : sz(0), elem(0), space(0) { }
    vector(int s) 
      : sz(s), elem(new double[s]), space(s)
    {
        for (int i=0; i<sz; ++i) elem[i]=0;
    }    

    // copy and delete functions
    vector(const vector&);
    vector& operator=(const vector&);
    ~vector() { delete[ ] elem; }
.bp
    // access to individual elements using [ ]
    double& operator[ ](int n);
    const double& operator[ ](int n) const;

    int size() const { return sz; }    
    int capacity() const { return space; }

    // change the size of the vector
    void resize(int newsize);
    void push_back(double d);
    void reserve(int newalloc);
  };
.R
\s+8
.IT As long as we only want to store vectors of doubles
.IT We want one class to 'be a vector' regardless of type
.i1 Repeating all this work for every data type would be a lot of work
.SS Templates
.IT You have been using these all semester
.IT A template defines a type to be substituted in a class 
.i1 or function
\s-8
.CW 
                        // declare a type 'T'
                        // now every 'double' in the old class
                        // can be replaced with 'T'
  template<typename T>
  class vector {
    int sz;        // the number of elements stored
    T* elem;       // backing storage
    int space;     // size plus number of free slots

    public:
      T& operator[ ] (int n);
      ...
.R
\s+8
.IT Can use \fCtemplate<class T>\fR instead
.i1 Since a \*[c]class\*[r] defines a \fItype\fR
.IT Now we can use any type in our vector
.CW
  vector<double> d;
  vector<int>    vi;
  vector<Person> p;
  vector<std::unique_ptr<Widget>> w;

  vector<vector<int>> two_d_vector;
.R
.IT In the last case, a vector is composed of vectors
.i1 The first \fCvector<T>\fR the \fCT\fR is \fCvector<int>\fR
.i1 In the inner \fCvector<T>\fR the \fCT\fR is \fCint\fR
.SS Limits of templates as parameters
.IT Consider the following:
.CW
  class Circle : Shape { ...
.R
.IT What happens here?
\s-8
.CW
  vector<Shape> vs;
  vector<Circle> vc;
  vs = vc; 
.R
\s+8
.IT Or here?
\s-8
.CW
  void func(vector<Shape*>& v)
  {
    v.push_back(new Rectangle());
  }
  
  int main() 
  {
    vector<Shape*> vs;
    vector<Circle*> vc;
    vs = vc; 
    func (vc);
  }
.R
\s+8
.IT You can't use a container of a derived class
as a container of the base class
.i1 The derived class is effectively truncated
.i2 Technically called \fIslicing\fR
.SS Function Templates
.IT Templates can be used to make generic functions in the same was as a generic class
.IT Suppose we want to make a smarter array:
\s-8
.CW
  template<class T, int N> struct array {
    T elem[N];        // hold N elements in member array

    // rely on the default constructors, destructor, and assignment

    T& operator[ ] (int n) { return elem[n]; } 
    const T& operator[ ] (int n) const { return elem[n]; }

    T* data() { return elem; }  // conversion to T*
    const T* data() const { return elem; }

    int size() const  { return N; }    
  };

.R
\s+8
.bp
.IT We can initialize our smart array:
\s-8
.CW
  array<int,256>  g_ai;  // 256 integers
  array<double,6> g_ad = { 0.0, 1.1, 2.2, 3.3, 4.4, 5.5 };
.R
\s+8
.IT And use them
\s-8
.CW
  // print a container
  template<class C> void printout(const C& c) {
    for(int i = 0; i<c.size(); ++i) cout << c[i] <<'\\n';
  }
  int main() {
    //double* p = g_ad;      // error: no implicit conversion
    double* q = g_ad.data(); // ok: explicit conversion

    vector<int> vi;

    printout(g_ad);          // print array
    printout(vi);            // print vector
  }

.R
\s+8
.SS Summary
.IT Accessing private class members
.IT Finishing the \*[c]vector\*[r] API
.i1 \*[c]reserve\*[r] and \*[c]capacity\*[r]
.IT Templates    
.i1 Foundation of \fIgeneric programming\fR
.i1 Relies on compile-time resolution
.IT Compare to object-oriented programming
.i1 Inheritance, overriding \*[c]virtual\*[r] functions
.i1 Relies on run-time resolution
.IT Slicing
.IT Function Templates
.i1 Template argument deduction