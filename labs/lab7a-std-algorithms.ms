.ds CH Lab #7a: Algorithms
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.NH
Standard algorithms: 60 minutes \fImaximum\fR
.time_box
.RS
Create a program that accomplishes the following:

.nr step 0 1
.IP \n+[step].
Create a \*[c]std::vector<int>\*[r] of size 1,000.
.IP \n+[step].
Use \*[c]std::iota\*[r], \*[c]std::generate\*[r], or \*[c]std::for_each\*[r] to fill the vector with 10 repeating groups of data in the range 1..100.
The idea here is to accomplish the goal of filling the vector while minimizing use of hand-rolled loops.
.IP \n+[step].
Implement your own version of the \fCcount()\fR algorithm.
Test it using the vector created.
.IP \n+[step].
Implement your own version of the \fCcount_if()\fR algorithm.
Test it using the vector you created.
Consider a comparison function other than \*[c]==\*[r].
.RE

.QP
If you need a reference for the algorithm API's, use \fCwww.cppreference.com\fR.
.bp
.so reflection.ms

