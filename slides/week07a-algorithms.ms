.ds title STL ALgorithms
.pdfinfo /Title \*[title]
.TL
.gcolor blue
\*[title]
.gcolor
.LP
.ce 1
Week 7
.EQ
delim $$
.EN
.SS Overview
.IT Chapter 21 of the text
.IT Motivation
.IT Generic programming
.IT Algorithms and parameterization
.IT Standard algorithms
.i1 copy, sort, ...
.IT Input and output iterators
.IT Algorithms not in the STL
.SS Review
.IT A \fBcontainer\fR is a generic collection
.i1 Allows storing data using well-known data structures
.i2 Linear ADT's
.i3 \*[c]vector\*[r], \*[c]array\*[r], \*[c]list\*[r], \*[c]forward_list\*[r], \*[c]stack\*[r], etc.
.i2 Associative ADT's
.i3 \*[c]set\*[r], \*[c]map\*[r], \*[c]unordered_map\*[r], etc.
.IT A pair of \fBiterators\fR defines a sequence
.PSPIC images/iterator.eps
.IT An iterator is a \fBtype\fR that supports pointer-ish operations
.i1 \*[c]++\*[r], \*[c]*\*[r], \*[c]==\*[r]
.IT Some iterators support more operations (\*[c]--\*[r], \*[c]+\*[r],\*[c][ ]\*[r])
.i1 Although these look like pointers, an iterator is \fInot\fR a pointer!
.SS Motivation
.IT So now we have these two great tools in our library
.i1 We want to use them effectively
.IT And many activities occur repeatedly in software
.i1 find, copy, sum, count, sort
.i2 \fIActions\fR that we perform on \fIsequences\fR of data
.IT What can we do to
.i1 Avoid repetitive code
.i1 Define a consistent, portable interface

.IT Consider that counting elements in a \*[c]list\*[r], 
.br 
is not very different from counting them in a \*[c]vector\*[r]
.SS Goals
.IT Create a common library
.IT That allows people to write code that is
.i1 Easy to read & modify 
.i2 That is, the code is \fBclear\fR
.i1 Enables use of regular, compact syntax
.i1 Fast
.i2 Fast retrieval, addition, and deletion
.i1 Type-safe
.i1 Makes it easy to traverse data


.IT These are the goals of the STL
.SS The STL
.IT Part of the ISO C++ standard
.IT Algorithms are organized into broad categories
.i1 Non-modifying sequence operations
.i2 \fCfor_each\fR, \fCcount(_if)\fR, \fCfind(_if)\fR, \fCsearch\fR
.i1 Modifying sequence operations
.i2 \fCcopy(_if)\fR, \fCmove\fR, \fCfill\fR, \fCtransform\fR, \fCgenerate\fR
.i1 Partitioning operations
.i2 Groups of elements divided based on a predicate
.i1 Sorting operations
.i2 \fCsort\fR, \fCstable_sort\fR, \fCis_sorted_util\fR, \fCnth_element\fR
.i1 Min/max operations
.i1 Numeric operations
.i1 Uninitialized memory operations
.i1 Some algorithms require sorted input
.i2 Binary search operations
.i3 \fCupper_bound\fR, \fClower_bound\fR
.i2 Set operations
.i3 \fCmerge\fR, \fCdifference\fR, \fCintersection\fR, \fCunion\fR
.i2 Heap operations
.i3 Operations on specially sorted trees
.IT Mostly non-numeric in nature
.i1 Only 5 standard algorithms specifically do computations
.i2 \fCiota\fR, \fCaccumulate\fR, \fCinner_product\fR, \fCpartial_sum\fR, \fCadjacent_difference\fR
.i3 Of these, \fCiota\fR and \fCaccumulate\fR are by far most commonly used
.i2 C++17 will add 6 more
.IT STL algorithms work with strings and container types
.i1 Anything \fBiterable\fR
.IT Other standard libraries and algorithms exist
.i1 Boost, Microsoft, SGI, ...
.SS STL and loops
.IT STL algorithms are essentially wrappers around loops
.i1 Most tasks you've written so far could be rewritten using algorthms
.IT Why prefer algorithms to hand-written loops?
.i1 Efficiency
.i2 Algorithms are often more efficient than the loops programmers produce
.i1 Correctness
.i2 Writing loops is more subject to errors than is calling algorithms
.i1 Maintainability
.i2 Algorithm calls often yield code that is clearer and more straightforward than the corresponding explicit loops

.i1 But . . .
.i1 STL algorithms take time to master
.i1 And loops are obviously still important!
.SS Basic Model
.IT Recall our goals:
.i1 Avoiding repetition & using regular, compact syntax
.IT The STL achieves these goals using \fIseparation of concerns\fR
.i1 \m[blue]\fBContainers\fR\m[] store data
.i2 But are ignorant about algorithms
.PS
boxwid = .5
boxht = .25

CV: box invis "vector"; move
CL: box invis "list"; move 2
CM: box invis "map"; move
CS: box invis "set" 

I: box fill 0.2 height .7 wid 2 "iterators" with .w at CL.e + (0, -1.0)

AS: box invis "sort" with .w at CV.w + (0, -2.2); move
AF: box invis "find"; move 2
AC: box invis "copy"; move 1
AT: box invis "transform" 
arrow <-> from CV.se to I.nw
arrow <-> from CL.s to 1/2 between I.nw and I.n
arrow <-> from CM.s to 1/2 between I.ne and I.n
arrow <-> from CS.sw to I.ne
arrow from AS.ne to I.sw
arrow from AF.ne to 1/2 between I.sw and I.s
arrow from AC.nw to 1/2 between I.s and I.se
arrow from AT.nw to I.se
.PE
.i1 \m[blue]\fBAlgorithms\fR\m[] manipulate data
.i2 But remain ignorant about containers

.i1 Algorithms and containers interact through \m[blue]iterators\m[]
.SS Basic Model in Action: find()
.IT Goal
.i1 Find the first element in a container that equals a value
.i1s
Suppose we want to find an int in a vector
.CW
  \m[green]// hand-rolled loop  \m[]
  vector<int>::iterator 
  my_find(vector<int>& v, int x) {
    for(auto p = v.begin(); p != v.end(),++p) {
      if (x == *p) return p;
    }
    \m[green]// did not find  x\m[]
    return v.end();
  }
.R
.i1e
.i1s
Or using find()
.CW
  void my_find(vector<int>& v, int x) {
    auto p = find(v.begin(),v.end(),x);
  }
.R
.i1e 
.i1 The entire function \fCmy_find()\fR is redundant this point
.SS Useful standard algorithms
.IT \fCr = find(b,e,v)\fR
.i1 r points to the first occurrence of v in [b,e)
.IT \fCr = find_if(b,e,p)\fR
.i1 r points to the first element x in [b,e) for which p(x) is true
.IT \fCx = count(b,e,v)\fR
.i1 x is the number of occurrences of v in [b,e)	
.IT \fCx = count_if(b,e,p)\fR
.i1 x is the number of elements in [b,e) for which p(x) is true
.IT \fCsort(b,e)\fR
.i1 sort [b,e) using <
.IT \fCsort(b,e,c)\fR
.i1 sort [b,e) using compare function c
.bp
.IT \fCcopy(b,e,b2)\fR
.i1 copy [b,e) to [b2,b2+(e-b))
.RS
\s-4 there had better be enough space after b2!\s+4
.RE
.IT \fCunique_copy(b,e,b2)\fR
.i1 copy [b,e) to [b2,b2+(e-b))
.br
.RS
\s-4 but don't copy adjacent duplicates\s+4
.RE
.IT \fCmerge(b,e,b2,e2,r)\fR
.i1 merge two sorted sequence [b2,e2) and [b,e) 
.br
.RS
\s-4 into [r,r+(e-b)+(e2-b2))\s+4
.RE
.IT 
\fCr = equal_range(b,e,v)\fR
.i1 r is the subsequence of [b,e) with the value v
.br
.RS
\s-4 (basically a binary search for v)\s+4
.RE
.IT \fCequal(b,e,b2)\fR
.i1 do all elements of [b,e) and [b2,b2+(e-b)) compare equal?
.SS Useful Boost algorithms
.IT \fCis_permutation\fR
.i1 Tests to see if one sequence is a permutation of a second one; 
.i2 in other words, it contains all the same members, possibly in a different order.
.IT \fCis_sorted\fR
.i1 Contains functions for determining if a sequence is ordered
.i2 Also now in the STL as of C++11
.IT \fCclamp\fR
.i1 Ensures a value remains between a pair of boundary values 
.i2 This will be part of the C++17 standard
.IT \fCone_of\fR
.i1 Tests the elements of a sequence and returns \*[c]true\*[r] if exactly one of the elements in the sequence has a particular property
.i2 There are also algorithms for \fCall_of\fR, \fCany_of\fR, and \fCnone_of\fR as of C++11 
.i2 Boost contains these as well
.SS Input and output iterators
.IT Recall an iterator is an abstraction of a pointer
.i1 And anything can be pointed to
.i2 So why not a stream?
.i2 Think of a stream as a sequence of bytes
.IT An output iterator lets you point to an output stream
.i1s
Create an ostream_iterator using a template
.CW
  ostream_iterator<int>(cout, ", ");
.R

The optional second argument defines a delimiter
.i1e
.i2 The delimiter is written after each output operation
.IT Using iterators 'the hard way'
.i1s
Manual write, increment, write...
.CW
  ostream_iterator<string> oo(cout);

  *oo = "Hello, ";  \m[green]// aka cout << "Hello, "\m[]
  ++oo;             \m[green]// increment output pointer\m[]
  *oo = "world!\\n"; \m[green]// aka cout << "world!\\n"\m[]
.R
.i1e
.bp
.IT The 'hard way' works
.i1 But it's not the most interesting use of these iterators
.IT Input and output interators are frequently used with algorithms
.i1s
Write a vector to standard output
.CW
  vector<int> v {3, 1, 4, 1, 5, 9}
  ostream_iterator<int> it( cout, " " );
  copy( v.begin(), v.end(), it );
.R
.i1e
.i1s
Or fill a vector from standard input
.CW
  copy( istream_iterator<int>( cin ),
        istream_iterator<int>(),   \m[green]// <-- note "end()"\m[]
        back_inserter( v ) );
.R
.i1e
.i1 \fCstd::back_inserter\fR is a convenience function
.i1 Performs a \fCpush_back\fR operation on the provided container
.i2 Using the value pointed to by the current iterator position
.SS A non-generic \fCsum()\fR
.IT Given two functions
.i1s
Each sums the values provided
.CW	 
  \m[green]//sum ints in array\m[]
  double sum(double array[], int n) {
    double sum = 0;
    for (int i = 0; i < n; ++i ) sum += array[i];
    return sum;
  }

  struct Node { Node* next; int data; };
  int sum(Node* first) { \m[green]//sum ints in list\m[]
    int s = 0;
    while (first) {    \m[green]//first not false or zero\m[]
      s += first->data;
      first = first->next;
    }
    return s;
  }
.R
.i1e
.IT How can we generalize and combine these two functions into one?
.SS Generalized pseudocode
.IT Abstract the data structure
.i1s
Start with some pseudo-code
.CW
  int sum(\m[red]data\m[])  \m[green]// somehow parameterize this\m[]
  {
    int s = 0;
    while (\m[red]not at end\m[]) {  \m[green]// loop through all elements\m[]
          s = s + \m[red]get value;\m[] \m[green]// compute sum\m[]
          \m[red]get next data element;\m[]
    }
    return s;
  }
.R
.i1e
.IT Need several generic operations on \m[red]data\m[]
.i1 Determine if not at end
.i1 Get value
.i1 Get next element
.SS Generic template example
.IT STL style approach to support both containers
.i1 class \fCIter\fR must be an \fCInput_terator\fR
.i1s
class \fCT\fR must support \fC+\fR and \fC=\fR
.CW
  template<class Iter, class T>
  T sum(Iter first, Iter last, T sum) {
    while (first != last) {
      sum = sum + *first;
      ++first;
    }
    return sum;
  }
.R
.i1e
.IT And to use it
\s-8
.CW
  float a[]  = {1,1,2,3,5,8,13,21,34};
  float* end = a+sizeof(a)/sizeof(*a);
  double d   = 0;
  d = sum (a, end, d);
.R
\s+8
.IT Now we have a function that works on any STL container
.i1 Even a C-style array
.SS Even more generic sum
.IT Can we make sum even more generic?
.i1 \m[red]sum\m[] has a 'baked-in' assumption
.i2 \*[c]operator+\*[r]
.i1s
Let's allow any binary operator
.CW
  template<class In, class Out, class BinaryOperator>
  T \m[red]accumulate\m[](In first, In last, 
               Out value, BinaryOperator \m[red]op\m[])
  {
    while (first!=last) {
      value = \m[red]op\m[](value, *first);
      ++first;
    }
    return value;
  }
.R
.i1e
.IT Where
.i1 \fCvalue\fR is the thing we want to change
.i2 It has some initial value (could be non-zero)
.i1 \fCop\fR is any function that changes \fCvalue\fR
.SS Algorithm: accumulate()
.IT You can't simply pass \*[c]+\*[r] or \*[c]*\*[r] to a function
.i1 BinaryOperator \m[red]op\m[] must be a valid \fBtype\fR
.i1 A function \fIcan\fR take a pointer or a type as a parameter
.IT The STL has a large collection of operator types that can be passed to functions
.i1 \fCplus\fR, \fCequal_to\fR, \fClogical_and\fR, \fCbit_or\fR, etc.
.i1s
\*[c]multiplies\*[r] is a STL function for object multiplying
.CW
  \m[green]// using std::accumulate\m[]
  #include <numeric>
  void f(list<double>& ld)
  {
    double product = 
             accumulate(ld.begin(), 
                        ld.end(), 
                        \m[red]\fB1.0\fP, multiplies<double>()\m[]);
  }
.R
.i1e
.IT Note we initialized multiply with 1.0
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
.IT Algorithms and parameterization
.i1 Strive to make code more generic, not less
.IT Standard algorithms
.i1 Take one or more sequences
.i2 Usually an iterator pair
.i1 Takes one or more operations
.i2 Usually a function object - functions & lambdas work too
.i1 Failure condition traditionally indicated by returning the second iterator in the pair
.i2 Often \fCend()\fR in example code, but can be anything after the first iterator
.IT Remember to consider the STL & friends
.i1 Many common problems have robust solutions already written for you in a standard library
.IT Input and output iterators
.i1 Often used in conjunction with standard algorithms
.IT Algorithms not in the STL
.IT \*[c]std::accumulate\*[r]

