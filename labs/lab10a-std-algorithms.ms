.ds CH Lab #10a: Algorithms
.so headings.ms
.TL
\*[CH]
.LP
The goal of today's lab is to practice working with STL algorithms.
.NH
Standard algorithms: 4 points, 90 minutes \fImaximum\fR
.LP
.RS
.nr step 0 1
.IP \n+[step].
Create the files \fClab10a.h\fR, \fClab10a.cpp\fR,
and \fCmain.cpp\fR.

File \fCmain.cpp\fR is just for extra credit, if you choose.

In the steps that follow, place all code in the \*[c]mesa\*[r] namespace.
.IP \n+[step].
Write a function that makes a very specific vector:
.CW
  \m[green]
  // Return a vector is size sz
  // filled with values in the range 1..max, 
  // increasing sequentially until max is reached.
  //
  // If max is reached and the vector is not yet filled,
  // Then reset continue filling the vector starting at 1.
  // 
  // For example, given:
  // sz = 12 and max = 3,
  // the returned vector should contain:
  // {1,2,3,1,2,3,1,2,3,1,2,3} \m[]
  std::vector<int>
  mesa::make_vector(const std::size_t& sz, 
                    const std::uint16_t& max);
.R

Use \*[c]std::iota\*[r], \*[c]std::generate\*[r], or \*[c]std::for_each\*[r] to fill the vector.
.br
The idea here is to accomplish the goal of filling the vector while minimizing use of hand-rolled loops.

This is not a template, so implement it in \fClab10a.cpp\fR.
.IP \n+[step].
Write a function template \*[c]expunge_letter\*[r] that accepts four parameters - 
two iterators delineating an input range, 
one iterator delineating the start of an output range, and a \*[c]char\*[r].

.CW
  template <class InputIt, class OutputIt>
  OutputIt mesa::expunge_letter(InputIt first, 
                                InputIt last, 
                                OutputIt dest, char c);
.R

The template copies the \*[c]char\*[r]s in the input range that \fIdo not\fR contain 
the specified character to the output range.
.br
The function should return an iterator one past the last location written. 
Do not use loops.

(Hint: Use the remove_copy_if algorithm and a custom function).
.RE

.LP
If you need a reference for the algorithm API's, use \fCwww.cppreference.com\fR.

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab10a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab10a
.R

.NH
Extra credit
.QP
.RS
.nr step 0 1
.IP \n+[step].
Implement a main that uses the functions implemented in this lab.
.RE

