.ds CH Lab #10b: Big Integer addition
.so headings.ms
.TL
\*[CH]
.LP
The goal of today's lab is to practice working with STL
and to get a start in the capabilities required in Project #3.

.so cover-page.ms

.bp
.NH
BigInt add: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
.RS
.nr step 0 1
.IP \n+[step].
Create the files \fClab10b.h\fR and \fClab10b.cpp\fR.

In the steps that follow, place all code in the \*[c]mesa\*[r] namespace.
.IP \n+[step].
Write a function \*[c]add\*[r] that accepts two \*[c]vector<int>\*[r] parameters.

The input vectors should each contain digits in the range 0 - 9.
For example:
.CW
  \m[green]//
  //     Most significant digit                      least
  //               v                                   v\m[]
  vector<int> x   {0,0,0,0,0,0,0,8,9,0,1,2,3,4,5,6,7,8,9};
  vector<int> y                     {9,8,7,6,5,4,3,2,1,9};
.R

Your add function should use the \*[c]std::transform\*[r] 
algorithm to add each digit of the two input vectors
and store the results in a new vector.

You may use \*[c]std::plus<int>()\*[r] to perform the addition
and then check for carry as a second step, or write a custom lambda.
When the addition is complete, ensure no element in the answer container > 9.

Feel free to write a small main program to help
verify your results.
.RE
.QP
.h2 Things to be aware of
.QP
.RS
.nr step 0 1
.IP \n+[step].
Remember to make sure your destination is large enough to hold 
all your digits, including carry.
.IP \n+[step].
The \*[c]std::transform\*[r] algorithm will only push back to the destination
if a \*[c]std::back_inserter\*[r] is the destination iterator.
.IP \n+[step].
If the least significant digit is at the 'end' of the vector,
then push back is very inefficient approach.

You have two choices:
.RS
.IP a.
If using vectors ordered as in the example,
then ensure your results vector is large enough ahead of time to hold all digits
and use a reverse iterator to set values as the addition proceeds
from left to right (least to most significant)
.IP b.
Reverse the order of the values in x and y,
and perform the addition right to left,
which will now be least to most significant.

The results can be added to using a back_inserter
and the final results reversed again.
.RE

.RE
If you need a reference for the algorithm API's, use \fCwww.cppreference.com\fR.

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab10b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab10b
.R

