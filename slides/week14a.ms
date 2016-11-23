
.TL
.gcolor blue
STL Algorithms
.gcolor
.LP
.ce 1
Week 14
.EQ
delim $$
.EN
.SS Overview
.IT Motivation
.IT Generic programming
.IT Algorithms and parameterization
.IT Standard algorithms
.i1 copy, sort, ...
.IT Input and output iterators
.IT Headers and algorithms
.i1 Algorithms not in the STL
.SS Review
.IT A pair of iterators defines a sequence
.i1 \fCbegin()\fR points to the first elment, if any
.i1 \fCend()\fR points to one beyond the last elment
.PSPIC images/iterator.eps
.IT An \fIiterator\fR is a \fBtype\fR that supports iterator operations
.i1 \*[c]++\*[r], point to the next element
.i1 \*[c]*\*[r], get the value associated with the current iterator position
.i1 \*[c]==\*[r], a == b $iff$ a points to the same element as b
.IT Some iterators support more operations (\*[c]--\*[r], \*[c]+\*[r],\*[c][ ]\*[r])
.SS Motivation
.IT Many activities occur repeatedly in software
.i1 find, copy, sum, count, sort
.IT Goals
.i1 Avoid repetitive code
.i1 Define a consistent, portable interface
.i2 Counting elements in a \*[c]list\*[r], is not very different from counting in a \*[c]vector\*[r]
.IT The code that uses our common library should be
.i1 Easy to read
.i1 Easy to modify
.i1 Use regular, compact syntax
.i1 Fast
.i2 Fast retrieval, addition, and deletion
.i1 Type-safe
.i1 Easy to traverse data
.IT Happily, the STL provides many standard algorithms
.SS Generic programming
.IT Generalize algorithms
.i1 Sometimes called 'lifting an algorithm'
.IT The aim (for the end user) is
.i1 Increased correctness
.i2 Through better specification
.i1 Greater range of uses
.i2 Possibilities for re-use
.i1 Better performance
.i2 Through wider use of tuned libraries
.i2 Unnecessarily slow code will eventually be thrown away
.IT Go from the concrete to the more abstract
.i1 The other way most often leads to bloat
.SS A non-generic algorithm
.IT Given two functions
.i1s
Each sums the values provided
.CW	
  double sum(double array[], int n)
  {
    double s = 0;
    for (int i = 0; i < n; ++i ) s = s + array[i];
    return s;
  }

  struct Node { Node* next; int data; };

  int sum(Node* first) \m[green]//sum ints in list\m[]
  {
    int s = 0;
    while (first) {    \m[green]//first not false or zero\m[]
      s += first->data;
      first = first->next;
    }
    return s;
  }
.R
.i1e
.SS Lifting step #1
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
  T sum(Iter first, Iter last, T s)
  {
    while (first != last) {
      s = s + *first;
      ++first;
    }
    return s;
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
.IT This is essentially what \fCstd::accumulate\fR does
.SS The STL
.IT Part of the ISO C++ standard
.IT Mostly non-numeric in nature
.i1 Only 4 standardalgorithms specifically do computations
.i2 Accumulate, inner_product, partial_sum, adjacent_difference
.i1 Works string and numeric data
.IT Basic Model
.i1 Algorithms manipulate data
.i2 But remain ignorant about containers
.i1 Containers store data 
.i2 But are ignorant about algorithms
.i1 Algorithms and containers interact through iterators
.i2 Each container has it's own iterator types
.IT Other standard libraries and algorithms exist
.i1 Boost, Microsoft, SGI, ...
.SS Algorithms: find()
.IT Goal: find the first element in a container that equals a value
.i1s
Find an int in a vactor
.CW
  void func(vector<int>& v, int x
  {
    vector<int>::iterator p = 
        find(v.begin(),v.end(),x);
    if (p!=v.end()) { 
       // we found  x
    }
    // ...
  }
.R
.i1e
.i1s
Or generically, we can abstract away container differences
.CW
  template<class In, class T>
  In find(In first, In last, const T& val)
  {
    while (first!=last && *first != val) ++first;
    return first;
  }
.R
.i1e 
.SS A note about returning iterators
.IT Recall \fCend()\fR point to 1 past the end
.i1 \fINot\fR the last element
.i1 Needed to easily and consistently represent an empty sequence
.i2 If \fCbegin() == end()\fR
.IT The 'one past the end' location is not an element
.i1 You can't dereference it
.i1 You can compare it to another iterator
.IT Returning the end of the sequence is the standard idiom for 'not found'
.SS Back to sum
.IT Can we make sum even more generic?
.i1 Currently has a 'baked-in' assumption: the \*[c]operator+\*[r]
.i1s
Let's allow any binary operator
.CW
  template<class In, class T, class BinOp>
  T accumulate(In first, In last, T init, BinOp op)
  {
    while (first!=last) {
      init = \m[red]op\m[](init, *first);
      ++first;
    }
    return init;
  }
.R
.i1e
.IT Where
.i1 \fCinit\fR is the thing we want to change
.i2 It has some initial value (could be non-zero)
.i1 \fCop\fR is any function that changes \fCinit\fR
.SS Algorithm: accumulate()
.IT Multiplication is a common task
.i1s
\*[c]multiplies\*[r] is a STL function for object multiplying
.CW
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
.SS How about accumulating objects?
.IT Create a custom function
.i1s
For example
.CW
  struct Record {
    int units;		// number of units sold
    double unit_price;
  };

  // let the 'update the init value' function 
  // extract data from a Record element:
  double price(double v, const Record& r)
  { 
    return v + r.unit_price * r.units;
  }

  void f(const vector<Record>& vr) {
    double total = accumulate(vr.begin(), vr.end(), 0.0, price);
  }
.R
.i1e
.SS Algorithm: Inner product
.IT Multiplies pairs of elements and sum each
.i1s
Multiply two vectors (yielding a scalar)
.CW
  template<class In, class In2, class T>
  T inner_product(In first, In last, 
                  In2 first2, T init)
  {
    while(first!=last) {
       init  = init + (*first) * (*first2);
       ++first;
       ++first2;
    }
    return init;
  }                                        
.R
.i1e
.bp
.IT Like \fCaccumulate\fR, we can make inner product even more generic by supplying our own operations
.IT Two custom operations
.i1s
One for the 'sum part' and one for the the 'multiply part'
.CW
  template<class In, class In2, 
           class T, 
           class BinOp, class BinOp2 >
  T inner_product(In first, In last, In2 first2, 
                  T init, 
                  BinOp op, BinOp2 op2)
  {
    while(first!=last) {
      init  = op(init, op2(*first, *first2));
      ++first;
      ++first2;
    }
    return init;
  }
.R
.i1e
.SS Useful standard algorithms
.IT \fCr = find(b,e,v)\fR
.i1 r points to the first occurrence of v in [b,e)
.IT \fCr = find_if(b,e,p)\fR
.i1 r points to the first element x in [b,e) for which p(x)
.IT \fCx = count(b,e,v)\fR
.i1 x is the number of occurrences of v in [b,e)	
.IT \fCx = count_if(b,e,p)\fR
.i1 x is the number of elements in [b,e) for which p(x)
.IT \fCsort(b,e)\fR
.i1 sort [b,e) using <
.IT \fCsort(b,e,p)\fR
.i1 sort [b,e) using p
.bp
.IT \fCcopy(b,e,b2)\fR
.i1 copy [b,e) to [b2,b2+(e-b))
.RS
\s-4 there had better be enough space after b2\s+4
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

  *oo = "Hello, ";  // aka cout << "Hello, "
  ++oo;             // increment output pointer
  *oo = "world!\n"; // aka cout << "world!\n"
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
        istream_iterator<int>(),   // <-- note "end()"
        back_inserter( v ) );
.R
.i1e
.i1 \fCstd::back_inserter\fR is a convenience function
.i1 Performs a \fCpush_back\fR operation on the provided container
.i2 Using the value pointed to by the current iterator position
.SS Summary
.IT Algorithms and parameterization
.i1 Strive to make code more generic, not less
.IT Standard algorithms
.i1 Take one or more sequences
.i2 Usually an iterator pair
.i1 Takes one or more operations
.i2 Usually a function object - functions & lambdas work too
.i1 Failure condition traditionally indicated by returning the sequence end
.IT Remember to consider the STL & friends
.i1 Many common problems have robust solutions already written for you in a standard library
.IT Input and output iterators
.i1 Often used in conjunction with standard algorithms
.IT Headers and algorithms
.i1 Algorithms not in the STL
