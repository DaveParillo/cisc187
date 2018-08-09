.ds CH Lab #9a: Iterators
.so headings.ms
.TL
\*[CH]
.LP
The goal of today's lab is to practice working with basic iterator operations.
.h2 Restrictions
.RS
.IP \(bu
Do not use any STL algorithms in this lab!
.RE
.h2 Things to notice
.RS
.nr step 0 1
.IP \n+[step].
You will need to use the iterator position returned from 
STL container \*[c]insert\*[r] and \*[c]erase\*[r] functions.

Calling \*[c]insert\*[r] and \*[c]erase\*[r] invalidates the current iterator and
often all forward iterators.
.IP \n+[step].
The STL container \*[c]insert\*[r] functions all insert new elements \fBbefore\fR
the current iterator position.

This means the 'current iterator' position is before the position used before insert was called.

Think about what you will need to do to avoid an infinite loop.
.RE

.NH
Iterators: 4 points, 90 minutes \fImaximum\fR
.LP
.RS
.nr step 0 1
.IP \n+[step].
Create the files \fClab9a.h\fR and \fCmain.cpp\fR.

File \fCmain.cpp\fR is just for extra credit, if you choose.

In the steps that follow, place all code in the \*[c]mesa\*[r] namespace.
.IP \n+[step].
Write a function template that fills a range with increasing values.
.CW
  \m[green]
  // Fill the range [first, last) with sequentially 
  // increasing values, 
  // starting with value and repetitively evaluating ++value.  \m[]
  template<class ForwardIterator, class T>
  void fill_sequence(ForwardIterator first, 
                     ForwardIterator last, T value);
.R

.IP \n+[step].
Write a function template that fills a container using a starting value.
.br
Use this signature:
.CW
  template<class Container, class T>
  void fill(Container* c, const T value);
.R

Note that the first parameter is a (non-owning) pointer to the container.

This function should call \*[c]fill_sequence\*[r] to fill the entire container with values.

.IP \n+[step].
Write a function template that inserts a value into a container, each time a condition is met.
.br
Use this signature:
.CW
  template<class Container, class T, class Predicate>
  void insert_each_if(Container* c, 
                      const T value, 
                      Predicate p);
.R

This function should loop on each element in the container,
pass the current iterator value to the predicate,
and insert the value only if the predicate returns \*[c]true\*[r].

The predicate function should evaluate the current iterator value and return a \*[c]bool\*[r].

.IP \n+[step].
Write a function template that erases all values from a container, each time a condition is met.
.br
Use this signature:
.CW
  template<class Container, class Predicate>
  void erase_if(Container* c, Predicate p);
.R

This function should loop on each element in the container,
pass the current iterator value to the predicate,
and erase the element only if the predicate returns \*[c]true\*[r].

The predicate function should evaluate the current iterator value and return a \*[c]bool\*[r].

.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab9a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab9a
.R

.NH
Extra credit
.QP
.RS
.nr step 0 1
.IP \n+[step].
Implement a main that uses the function templates implemented in this lab.
.RE

