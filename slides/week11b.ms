
.TL
.gcolor blue
Iterators
.gcolor
.LP
.ce 1
Week 11
.SS Overview
.IT Iterators
.i1 Iterator Design Pattern
.i1 Iterator interfaces

.SS Question
.IT How can we view each element of an ADT
.IT And remain ignorant of the implementation details?
.SS Example
.IT Given
.CW
  array<string, 3> names;
  names[0] = "Alice";
  names[1] = "Bob";
  names[2] = "Carol";
.R
.IT How to operate on each member of names?
.i1s
Sure we could use a traditional loop
.CW
  for (int i=0; i < names.size(); ++i) {
    cout << names[i];
  }

  int i = 0;
  while(i < names.size()) {
    cout << names[i++];
  }
.R
.SS Avoiding explicit indexing
.IT The \fIrange-for\fR loop
.i1 aka the \fIfor each\fR loop
.CW
  for (string s: names) {
    cout << s;
  }
.R 
.IT This syntax isn't just better
.IT It is
.BI obviously better
.IT We have abstracted away the idea of moving from one element to the next
.IT We say the array is 
.BI Iterable
.SS Iterator Pattern
.IT Problem
.i1 View each element of container
.i1 Remain ignorant of all container implementation details
.IT Solution
.i1 Define an interface describing how to visit each element / node (the iterator)
.i1 Implement iterator interface in container
.i1 Clients (calling code) asks container to provide iterator object
.i2 Use iterator to retrieve correct element
