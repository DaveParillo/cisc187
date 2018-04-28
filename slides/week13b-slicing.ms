
.TL
.gcolor blue
Object Slicing
.gcolor
.LP
.ce 1
Week 13
.SS Overview
.IT What is \fIslicing\fR
.IT Assignment
.IT Pass by reference and pass by value
.SS Object slicing
.SS Assigning derived classes
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
.IT Slicing
.i1 Careful with copy assignment
.IT Pass by reference
.i1 Use \*[c]std::ref\*[r]

