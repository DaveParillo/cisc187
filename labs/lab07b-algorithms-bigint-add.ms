.ds CH Lab #7b: Big Integer addition
.so headings.ms
.TL
\*[CH]
.so cover-page.ms

.bp
.NH
Expunge Letter: 40 points, 30 minutes \fImaximum\fR
.time_box
.QP

Write a function \*[c]expunge_letter\*[r] that accepts four parameters - 
two iterators delineating an input range of \*[c]strings\*[r], 
one iterator delineating the start of an output range, and a \*[c]character\*[r] 
- then copies the \*[c]string\*[r]s in the input range that \fIdo not\fR contain 
the specified character into the output range.
The function should then return an iterator one past the last location written. 
Do not use loops.

(Hint: Use the remove_copy_if algorithm and a custom function).

.NH
BigInt add: 60 points, 60 minutes \fImaximum\fR
.time_box
.QP
Write a function \*[c]add\*[r] that accepts two \*[c]vector<int>\*[r] parameters.

The input vectors should each represent a vector of digits in the range 0 - 9.
For example:
.CW
  vector<int> x   {0,0,0,0,0,0,0,8,9,0,1,2,3,4,5,6,7,8,9};
  vector<int> y   {9,8,7,6,5,4,3,2,1,9};
.R

Your add function should use the \fCstd::transform\fR algorithm to add each digit of the two input vectors
and store the results in a new vector.

You may use \*[c]std::plus<int>()\*[r] to perform the addition
and then check for carry as a second step, or write a custom lambda.
When the addition is complete, ensure no element in the answer container > 9.

Verify your results by printing the input and output vectors to standard out without using a loop.

.bp
.so reflection2.ms

