.ds CH Lab #4b: Lambda expressions
.so headings.ms
.TL
\*[CH]
.NH
Lambda expressions: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
The goal of this lab is to explore lambda expressions in more detail and
to use them to perform real tasks on a \*[c]vector\*[r] 
without using any \*[c]for\*[r] loops.

.RS
.nr step 0 1
.IP \n+[step].
Declare a \*[c]vector\*[r] of size 10.
.br
Declare 2 int pointers: one to point to the start of the vector, the other to point at the end.
.br
\fBDo NOT\fR use the iterator functions \*[c]begin()\*[r] and \*[c]end()\*[r] to accomplish this (iterators are next week).
.IP \n+[step].
Use a lambda expression to assign a sequence of values to each element of the vector.
.br
\fBHint:\fR Use \*[c]std::for_each\*[r], the pointers from step one, and the lambda.
.IP \n+[step].
Create a \fCprint_each\fR function with the following signature:
.CW
  void print_each(const int* first, 
                  const int* last, 
                  const std::function<void(int)> func);
.R
.br
The function should print the values between the pointer addresses 
\fCfirst\fR and \fClast\fR using the provided function.
.IP \n+[step].
Create a lambda with no captures and a single int parameter that prints 
the parameter provided and a single space character.
.br
Assign this lambda to a local variable, for example \fBprint\fR.
.IP \n+[step].
Call \fCprint_each\fR with your pointers and the print lambda created in the previous step.
.IP \n+[step].
Call \fCprint_each\fR with your pointers and a new lambda that prints values less than 5.
.IP \n+[step].
Sort the vector in reverse order using a lambda.
.br
\fBHint:\fR Use \*[c]std::sort\*[r], your pointers, and a lambda.
.IP \n+[step].
Use \fCprint_each\fR to print the entire sorted vector.
.IP \n+[step].
Use \fCprint_each\fR to print only the odd elements of the vector.
.IP \n+[step].
Use \fCprint_each\fR to print only the elements 
from index position 3 through the second element before the end.
.RE

.QP
When completed, your program should output something similar to:
.CW
    nums: 0 1 2 3 4 5 6 7 8 9 
    nums: 0 1 2 3 4 
    nums: 9 8 7 6 5 4 3 2 1 0 
    nums: 9 7 5 3 1 
    nums: 6 5 4 3 2
.R

