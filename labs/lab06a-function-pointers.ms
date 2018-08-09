.ds CH Lab #6a: Function Pointers
.so headings.ms
.TL
\*[CH]
.SH
Stacks: 4 points, 90 minutes \fImaximum\fR
.LP
.RS
.nr step 0 1
.IP \n+[step].
Create 3 files: \fClab6a.h\fR, \fClab6a.cpp\fR, and \fCmain.cpp\fR.

.IP \n+[step].
Write a function template:
.CW
    template <class DataPointer, class Predicate>
      std::size_t mesa::count_if(DataPointer begin,
                                 DataPointer end, Predicate p);
.R

The \*[c]mesa::count_if\*[r] should return
the number of occurrences of items between \*[c]begin\*[r] and \*[c]end\*[r] 
that satisfy the predicate function \*[c]p\*[r].

Do not include \*[c]end\*[r].

A \fIpredicate\fR is a function that returns a \*[c]bool\*[r].

.IP \n+[step].
Write a function \*[c]bool mesa::is_odd(long value)\*[r] that returns \*[c]true\*[r]
if \*[c]value\*[r] is odd.

.IP \n+[step].
Write a template \*[c]bool mesa::greater(T a, U b)\*[r] that returns \*[c]true\*[r]
if \*[c]a\*[r] is greater than \*[c]b\*[r].

.IP \n+[step].
Create a program in \fCmain.cpp\fR that uses all the functions from the previous steps in this lab.

To use \*[c]mesa::greater\*[r], call \*[c]std::sort\*[r].

\*[c]std::sort\*[r] takes two data pointers and a binary function.

.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab6a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab6a
.R

