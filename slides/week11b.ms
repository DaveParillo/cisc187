
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
.SS Iterattor categories
.IT The 5 iterator categories define the types of operations you can perform on them
.IT InputIterator
.i1 Read
.i1 Increment (without multiple passes)
.IT ForwardIterator
.i1 All input iterator operations, plus
.i1 Increment with multiple passes
.IT BidirectionalIterator
.i1 All forward iterator operations, plus
.i1 Decrement
.IT RandomAccessIterator
.i1 All bi-directional iterator operations, plus
.i1 Random access

.IT OutputIterator
.i1 Write
.i1 Increment (without multiple passes)

.IT ContiguousIterator (since C++17)
.SS Iterator loops
.IT Doing things the 'manual way'
.CW
 std::vector<int> myvector;
  for (int i=1; i<=5; i++) myvector.push_back(i);

  std::cout << "myvector contains:";
  for (std::vector<int>::iterator it = myvector.begin() ; it != myvector.end(); ++it)
    std::cout << ' ' << *it;
  std::cout << '\n';
.R
.IT Prduces \fC myvector contains: 1 2 3 4 5 \fR
.SS Compare to range-for
.IT The range-for, while 'obviously better' has limits
.IT Non-linear steps
.IT No equivalent to
.CW
  for (int i=n; i>0; i/=2) {...
.R
.IT Filtering
.i1 If you need to traverse a collection 
.i1 and remove items you need an explicit iterator so that you can call it’s remove method
.IT Transforming
.i1 Likewise, if you need to add or modify the collection, you need an iterator or array index
.IT Parallel iteration
.i1 Walking through multiple collections
.i1 Possibly at different rates (i++, j+=2)

