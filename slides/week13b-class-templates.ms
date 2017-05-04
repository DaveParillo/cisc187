
.TL
.gcolor blue
Class Templates
.gcolor
.LP
.ce 1
Week 13
.SS Overview
.IT Notes on two distinct topics
.i1 Accessing private class members
.i1 Class templates
.SS Accessing private class members
.IT Consider the vector from the book
\s-8
.CW
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
\s-8
.CW
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
.IT It is perfectly correct for a class instance
.i1 to refer directly to a private member of it's own class
.i1 when inside a member function
.SS Limits of templates as parameters
.IT When you have derived classes to consider
.IT Consider the following:
.CW
  class Circle : Shape { ...
.R
.i1s
What happens here?
.CW
  vector<Shape> vs;
  vector<Circle> vc;
  vs = vc; 
.R
.i1e
.i1s
Or here?
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
.i1e
.IT You can't use a container of a derived class
as a container of the base class
.i1 The derived class is effectively truncated
.i2 Technically called \fIslicing\fR
.i2 Any information in \fCvc\fR is lost when assigned to \fCvs\fR
.SS Summary
.IT Accessing private class members
.IT Slicing
