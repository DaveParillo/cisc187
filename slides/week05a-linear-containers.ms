
.TL
.gcolor blue
Linear Containers
.gcolor
.LP
.ce 1
Week 5
.SS Overview
.IT Chapter 20 of the text
.IT Containers in the STL
.IT Linear ADT's
.i1 \*[c]array\*[r]
.i1 \*[c]vector\*[r]
.i1 \*[c]list\*[r]
.i1 \*[c]stack\*[r]
.i1 \*[c]queue\*[r]
.i1 \*[c]deque\*[r]
.SS Containers
.IT Back in the day... 
.i1 Arrays used to manage groups of data
.IT Containers provide more flexibility
.i1 Add & remove data dynamically
.i1 Polymorphic data types
.IT And at a higher level of abstraction
.IT A container is an ADT
.IT Different containers use different techniques & have different tradeoffs (costs)
.SS Basic operations
.IT Add object to the container
.i1 And remove objects from it
.IT Find out if an object is in the container
.i1 Or a group of objects
.IT Retrieve an object without removing it
.IT Walk through the container
.i1 Looking at each object in turn
.SS Standard Template Library
.IT The Standard Template Library (STL)
.i1 Provides implementation of many containers
.i1 Can work with data at different abstraction levels
.IT The STL provides abstract classes, interfaces and concrete classes 
.i1 Algorithms & operations on provided classes
.SS Basic Flavors
.IT Lists
.i1 Things stored in a sequence
.IT Queues
.i1 Things listed in order to be processed
.IT Sets
.i1 Unique things
.IT Maps
.i1 Things stored with a unique ID
.SS Flavor Enhancers
.IT Ordered
.i1 You can iterate through the container in a specific order
.i1 'Natural order' is a type of sort
.i2 Strings: A, B, C
.i2 Integers: 1, 2, 3
.IT Sorted
.i1 The container order is defined by rules: the sort order
.i1 Sorting is based on object properties
.i1 Containers can \fInever\fR be sorted \fBand\fR unordered
.SS Linear ADT's
.IT We've been working with one all semester
.i1 \*[c]vector\*[r] is a \fIlinear ADT\fR
.IT A \fIList\fR has methods related to the \fIindex\fR
.CW
  at(size_t pos), operator[], front(), back()
.R
.IT Vectors, lists and arrays are ordered ADT's
.i1 Ordered by \fIindex\fR
.SS Linear ADT's
.IT \*[c]std::array\*[r] 
.i1 A container that encapsulates a fixed size array
.i1 Doesn't collapse into a \fCT*\fR automatically
.CW
  std::array<int, 3> a = {1,2,3};
.R
.IT \*[c]std::vector\*[r] 
.i1 A container that encapsulates a dynamically sized array
.IT \*[c]std::list\*[r] 
.i1 A group of elements each containing a reference to the next and previous element in the list
.IT \*[c]std::deque\*[r] 
.i1 A container that provides fast access to both ends of the ADT
.IT \*[c]std::stack\*[r] 
.i1 Provides the functionality of a stack 
.i2 A FILO (first-in, last-out) data structure
.IT \*[c]std::queue\*[r] 
.i1 Provides FIFO (first-in, first-out) data structure
.SS List
.IT Compare to array
.i1 An array stores elements in adjacent memory locations
.i1 Can quickly calculate the address of any element
.i2 Given the address of any element in the array
.i1 Array access is a \fIrandom direct access ADT\fR
.IT Linked Lists
.i1 Composed of \fInodes\fR
.i1s
Each node points to the next node in the list
.PS
boxht = .5
boxwid = .5
box "0"
arrow <->
box "1"
arrow <->
box "2"
arrow <->
box "3"
.PE
.i1e
.i1 Nodes are created as needed
.i2 Typically not in adjacent memory locations
.i1 Impossible to \fIcalculate\fR the address of any node
.i2 Given the address of any other node
.i1 A linked structure is a \fIsequential access ADT\fR
.SS Linked Lists
.IT Singly linked list
.i1 Each node contains
.i2 A reference to the next node in the list
.i3 Or null, if the last node in the list
.PS
boxht = .5
boxwid = .5
box "0"
arrow ->
box "1"
arrow ->
box "2"
arrow ->
box "3"
.PE
.i2 The node data: it's value, which is some type \fCT\fR
.IT Doubly linked list
.i1 Each node contains
.i2 A reference to the next node in the list
.i3 Or null, if the last node in the list
.i2 A reference to the previous node in the list
.i3 Or null, if the first node in the list
.PS
boxht = .5
boxwid = .5
box "a"
arrow <->
box "b"
arrow <->
box "c"
arrow <->
box "d"
.PE
.i2 The node data
.SS Stack
.mk
.PSPIC -R images/stack-rocks.eps
.rt 
.IT A stack is
.i1 A Last-In-First-Out (LIFO) ADT
.IT Values: items of type T
.IT Operations
.i1 \fCvoid push(T)\fR: Put element on top of stack
.i1 \fCvoid pop()\fR: Remove element from top of stack
.i1 \fCT top()\fR (also known as 'peek')
.PSPIC images/stack.eps
.SS Real-world examples
.IT Undo/redo function
.i1 Text editor, drawing
.i1 Returns document to previous state
.IT CPU Call stack
.IT Syntax parsing
.i1 Postfix arithmetic: 4 3 +
.IT Backtracking along a path
.SS Stack Properties
.IT As a linear ADT, 
.IT stack operations are limited to one end of the backing store
.i1 By convention, called the 'top'
.IT A \*[c]stack\*[r] is a \fIcontainer adapter\fR
.i1 It \fIadapts\fR another linear container
.i1 To provide the properties of a \*[c]stack\*[r]
.i1 The container must be able to provide
.i2 \fCback(), push_back(),\fR and \fC pop_back()\fR
.IT The containers \*[c]vector\*[r], \*[c]list\*[r], and \*[c]deque\*[r]
.i1s
Can be adapted to create a \*[c]stack\*[r]
.CW
 template< 
    class T, 
    class Container = std::deque<T> 
 > class stack;
.R
.i1e
.IT If a \*[c]vector\*[r] is used to form a \*[c]stack\*[r], 
which element of the vector is the 'top' of the \*[c]stack\*[r]? 
.i1 Why is this a good choice?
.SS Queue
.IT A queue is
.i1 A fancy name for waiting in line
.i1 A First-In-First-Out (FIFO) ADT
.IT Values: items of type T
.IT Operations
.i1 \fCvoid push(T)\fR: Place element at back of line
.i1 \fCvoid pop()\fR: Remove element from front of line
.i1 \fCT front()\fR: Look at the front of the queue
.i1 \fCT back()\fR: Look at the back of the queue
.PSPIC images/queue.eps
.SS A queue
.IT A 'different' kind of queue
.PSPIC images/queue-bank.eps
.LP
.ce 3
\s-(16
Song Zhipeng, Next Please. Retrieved from http://www.creativebloq.com/3d/how-queue-tooled-bank-robbers-was-created-11410532
\s+(16

.SS Real-world examples
.IT Print spooling
.IT CPU schedulers
.IT Network packet routing
.SS Queue Properties
.IT A \*[c]queue\*[r] is a \fIcontainer adapter\fR
.i1 It \fIadapts\fR another linear container
.i1 To provide the properties of a \*[c]queue\*[r]
.i1 The container must be able to provide
.i2 \fCback(), front(), push_back(),\fR and \fC pop_front()\fR
.IT The containers \*[c]list\*[r] and \*[c]deque\*[r]
.i1s
Can be adapted to create a \*[c]queue\*[r]
.CW
 template< 
    class T, 
    class Container = std::deque<T> 
 > class queue;
.R
.i1e

.SS Deque
.IT A Deque is a 'double ended queue'
.i1 Element add and removal can be done on the front or the back
.i1 Memory is not contiguous, but still as fast as a vector
.i2 For the ends
.i2 Accessing data in the middle of a deque is still like a \*[c]list\*[r]
.i1 Resize does not involve an expensive memory copy operation
.IT In C++, one of it's more important roles is as an adapter
.SS Overview
.IT Containers in the STL
.IT Linear ADT's
.i1 \*[c]array\*[r]
.i1 \*[c]vector\*[r]
.i1 \*[c]list\*[r]
.i1 \*[c]stack\*[r]
.i1 \*[c]queue\*[r]
.i1 \*[c]deque\*[r]
.IT Wednesday
.i1 Iterators
