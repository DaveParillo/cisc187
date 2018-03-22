
.TL
.gcolor blue
Iterators
.gcolor
.LP
.ce 1
Week 9
.SS Overview
.IT Motivation
.IT Iterator Design Pattern
.IT Iterator categories
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
.BI 
obviously better
.R
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
.SS Iterators in C++
.IT Basic structure
.IT Define two iterators to define the beginning and end of a sequence
.PSPIC -L images/iterator.eps
.IT The element defined by \*[c]begin\*[r] is part of the sequence
.IT The element defined by \*[c]end\*[r] is not! 
.i1 It is \fIone past the last\fR 
.i1 This is a common source of error
.SS Basic iterator operations
\s-4
.TS
center tab(:);
lb lb
lb l.
Operation:Result
_
\fCp == q\fR:true if and only if \fBp\fR and \fBq\fR 
 :point to the same element or both point to \*[c]end\*[r]

\fCp != q\fR:negation of above

\fC*p\fR:refers to the element pointed to by \fBp\fR

\fC*p = val\fR:writes \fCval\fR to the element
 :pointed to by \fBp\fR

\fCval = *p\fR:reads from the element
 :pointed to by \fBp\fR and writes to \fCval\fR 

\fC++p\fR:increments the pointer - making it 
 :point to the next element in the container, or to \*[c]end\*[r]
.TE
\s+4

.SS Iterator categories
.IT Define the types of operations you can perform on them
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
.i2 C++17 adds a 'ContiguousIterator' specialization
.IT OutputIterator
.i1 Write
.i1 Increment (without multiple passes)
.SS Iterator loops
.IT Doing things the 'manual way'
.i1s
This is no fun and error prone
.CW
  std::vector<int> myvector = {1, 2, 3, 4, 5};
  std::cout << "myvector contains:";

  for (std::vector<int>::iterator 
       it = myvector.begin(); 
       it != myvector.end(); ++it)
    std::cout << ' ' << *it;
.R
.i1e
.i1 Produces \fC myvector contains: 1 2 3 4 5 \fR
.i1s
The \*[c]auto\*[r] keyword can help here
.CW
  \m[green]// the compiler knows what type begin() returns\m[]
  for (auto it  = myvector.begin(); 
            it != myvector.end(); ++it)
    std::cout << ' ' << it;
.R
.i1 Also produces \fC myvector contains: 1 2 3 4 5 \fR

.SS Containers and iterators
.IT Some container functions work only with iterators
.IT Common container functions
.i1 \fCinsert()\fR
.i2 \fCiterator insert( const_iterator pos, const T& value );\fR
.i1 \fCerase()\fR
.i2 erase one element: \fCiterator erase( iterator pos );\fR
.i2 erase a range: \fCiterator erase( iterator first, iterator last );\fR
.i1 \fCemplace()\fR
.IT \*[c]std::list\*[r] functions
.i1 \fCsplice()\fR
.IT \*[c]std::forward_list\*[r] functions
.i1 \fCerase_after()\fR
.i1 \fCinsert_after()\fR
.i1 \fCsplice_after()\fR
.SS Modifying containers with iterators
.IT Important note about using \fCinsert()\fR and \fCerase()\fR
.IT When iterating through a container
.i1 Both \fCinsert()\fR and \fCerase()\fR can invalidate the current iterator!
.i1 True for vector and deque
.i1 Not a problem for lists
.IT This is why \fCinsert()\fR and \fCerase()\fR return an iterator
.i1 The new value now points to the next valid iterator
.i2 No need to manually increment if you receive the returned iterator
.SS Summary
.IT Iterator Design Pattern
.i1 Recall \*[c]end()\*[r] points just past the last element in the container
.IT Iterator categories
.i1 InputIterator
.i1 ForwardIterator
.i1 BidirectionalIterator
.i1 RandomAccessIterator
.i1 OutputIterator
.IT Range-for loops
.i1 Preferred, when it makes sense to use it
.i1 Prefer iterators over indexed access
.IT \*[c]auto\*[r] keyword
.i1 No implicit type conversion
.IT Careful modifying containers with iterators

