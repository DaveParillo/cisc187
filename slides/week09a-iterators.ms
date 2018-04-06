
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
.IT Example
.i1s
Given
.CW
  array<string, 3> names;
  names[0] = "Alice";
  names[1] = "Bob";
  names[2] = "Carol";
.R
.i1e
.bp
.IT How can we view each element of an ADT
.IT And remain ignorant of the implementation details?
.IT Example
.i1s
Given
.CW
  array<string, 3> names;
  names[0] = "Alice";
  names[1] = "Bob";
  names[2] = "Carol";
.R
.i1e

.IT How to operate on each member of names?

.bp
.IT How can we view each element of an ADT
.IT And remain ignorant of the implementation details?
.IT Example
.i1s
Given
.CW
  array<string, 3> names;
  names[0] = "Alice";
  names[1] = "Bob";
  names[2] = "Carol";
.R
.i1e

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
.SS Problems
.IT We need to know the container has a \*[c]size\*[r] function
.IT The container must implement \*[c]operator []\*[r]

.IT What about associative containers and lists?
.bp
.IT We need to know the container has a \*[c]size\*[r] function
.IT The container must implement \*[c]operator []\*[r]

.IT What about associative containers and lists?
.i1s
This code make no sense
.CW
  set<string> names {"Alice", "Bob", "Clara"};
  for (int i=0; i < names.size(); ++i) {
    cout << \m[red]names[i]\m[];
  }
.R
.i1e
.IT We can't access members of a \*[c]set\*[r] using an \fIindex\fR
.SS Solution
.IT Iterator Pattern
.i1 An abstract idea about how to solve this problem
.i1 Language independent

.IT What must all iterators provide?
.i1 Initialize iterator to some container element (often the beginning)
.i1 Move to the next element in the container
.i1 Stop when the 'end' is reached

.bp
.IT Iterator Pattern
.i1 An abstract idea about how to solve this problem
.i1 Language independent

.IT What must all iterators provide?
.i1 Initialize iterator to some container element (often the beginning)
.i1 Move to the next element in the container
.i1 Stop when the 'end' is reached

.IT Key idea
.i1 Iterators allow us to \fBview\fR any container sequentially

.SS Iterators in C++
.IT Each container type defines it's own iterator
.i1s
Get the first element using \*[c]begin()\*[r]
.CW
  set<string> names {"Alice", "Bob", "Clara"};
  auto it = names.begin();
.R
.i1e

.IT What is the type of \*[c]it\*[r]?

.bp
.IT Each container type defines it's own iterator
.i1s
Get the first element using \*[c]begin()\*[r]
.CW
  set<string> names {"Alice", "Bob", "Clara"};
  auto it = names.begin();
.R
.i1e

.IT What is the type of \*[c]it\*[r]?

.ce 1
\*[c]std::set<string>::iterator\*[r]

.IT Important to remember
.i1 Each type has its own distinct iterator
.i2 Which is also a type
.i2 \*[c]std::set<string>::iterator\*[r] is defined in the \*[c]std::set<string>\*[r] class
.i1 All different types
.i2 \*[c]std::set<string>::iterator\*[r]
.i2 \*[c]std::set<int>::iterator\*[r]
.i2 \*[c]std::set<uint64_t>::iterator\*[r]
.i2 \*[c]std::set<size_t>::iterator\*[r]


.IT Basic model
.IT Containers define \*[c]begin()\*[r] and \*[c]end()\*[r]
.i1 As appropriate for the container

.PSPIC -L images/iterator.eps
.IT The element defined by \*[c]begin\*[r] is part of the sequence
.IT The element defined by \*[c]end\*[r] is not! 
.i1 It is \fIone past the last\fR 
.i1 This is a common source of error

.IT By design, iterators \fIfeel like\fR pointers
.i1 But iterators are \fBnot\fR pointers
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

\fC*p\fR:refers to the element pointed to by \fBp\fR (dereferences \fBp\fR)

\fC*p = val\fR:writes \fCval\fR to the element
 :pointed to by \fBp\fR

\fCval = *p\fR:reads from the element
 :pointed to by \fBp\fR and writes to \fCval\fR 

\fC++p\fR:increments the pointer - making it 
 :point to the next element in the container, or to \*[c]end\*[r]
.TE
\s+4
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
    std::cout << ' ' << *it;
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
.SS A note about returning iterators
.IT Recall \fCend()\fR point to 1 past the end
.i1 \fINot\fR the last element
.i1 Needed to easily and consistently represent an empty sequence
.i2 If \fCbegin() == end()\fR
.IT The 'one past the end' location is not an element
.i1 You can't dereference it
.i1 You can compare it to another iterator
.IT Returning the end of the sequence is the standard idiom for 'not found'
.i1 A handy generalization for when you want to use an element other than \fCend()\fR as the last iterator in a sequence
.SS Summary
.IT Iterator Design Pattern
.i1 Every \fIiterable type\fR defines its own iterator
.i1 Recall \*[c]end()\*[r] points just past the last element in the container
.IT Iterator loops
.i1 Range-for loops
.i2 Preferred, when it makes sense to use it
.i1 Prefer iterators over indexed access
.IT Careful modifying containers with iterators
