.ds CH Lab #13a
.TL
Lab #13a: Function objects
.so cover-page.ms

.bp
.NH
ROT128 cipher: 30 minutes \fImaximum\fR
.time_box
.QP

The ROT128 cipher is a weak encryption cipher that works by adding 128 to the value of each
character in a string to produce a garbled string. 
Since \*[c]char\*[r] can only hold 256 different values,
two successive applications of ROT128 will produce the original string. 
Write a function \*[c]ApplyROT128\*[r]
that accepts a \*[c]string\*[r] and returns the \*[c]string\*[r]'s ROT128 cipher equivalent.

.NH
Standard deviation: 60 minutes \fImaximum\fR
.time_box
.QP
The \fIstandard deviation\fR of a set of data is a measure of how much the data varies 
from its average value. 
Data with a small standard deviation tends to cluster around a point, 
while data with large standard deviation will be more spread out.
The formula for the standard deviation of a set of data ${x sub 1, x sub 2, ..., x sub n}$ is
.EQ
sqrt { 1 over n sum from {i = 1} to n {(x sub i - {x bar}) sup 2} }
.EN

Here, $x bar$ is the average of the data points.

To give a feeling for this formula, given the data points 1, 2, 3, the average of the data points is 2, so
the standard deviation is given by
.ps -2
.EQ
sqrt { 1 over n sum from {i = 1} to n {(x sub i - {x bar}) sup 2} }
= sqrt { 1 over 3 sum from {i = 1} to 3 {(x sub i - 2) sup 2} }
= sqrt { 1 over 3 ((1 - 2) sup 2 + (2 - 2) sup 2 + (3 - 2) sup 2 ) }
= sqrt { 1 over 3 (1 + 0 + 1) } = sqrt {2 over 3}
.EN
.ps +2

Write a function \*[c]StandardDeviation\*[r] that accepts an input range of iterators over 
\*[c]double\*[r]s (or values implicitly convertible to doubles) 
and returns its standard deviation. 
Do not use any loops - instead use the \*[c]accumulate\*[r] function to compute the average, 
then use \*[c]accumulate\*[r] once more to compute the sum. 
(Hint: To get the number of elements in the range, you can use the \*[c]distance\*[r] function)

.bp
.so reflection.ms

