.ds CH Lab #14a
.TL
Lab #14a: Algorithms
.so cover-page.ms
.NH
Standard algorithms: 30 minutes \fImaximum\fR
.time_box
.RS
List every standard library algorithm on \fChttp://en.cppreference.com/w/\fR.

Organize your results by algorithm type.

Feel free to use the space on page 4 to complete this list.
.RE
.bp
.NH
BigInt add: 60 minutes \fImaximum\fR
.time_box
.QP
Write a function \*[c]add\*[r] that accepts two \*[c]vector<int>\*[r] parameters.

The input vectors should each represent a vector of digits in the range 0 - 9.
Use the transform algorithm to add each digit of the two input vectors
and store the results in a new vector.

You may use \*[c]std::plus<int>()\*[r] to perform the addition
and then check for carry, or write a custom functor.
When the addition is complete, ensure no element > 9.
Verify your results by printing the vector to standard out without using a loop.

.bp
.so reflection.ms

