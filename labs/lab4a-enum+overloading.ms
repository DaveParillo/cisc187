.ds CH Lab #4a
.TL
Lab #4a: Classes and overloading
.so cover-page.ms
.bp
.NH
A rational number class: 60 minutes \fImaximum\fR
.time_box
.QP
Design and implement a number class \*[c]Rational\*[r].
A rational number is a number that can be expressed as a fraction of two integers,
for example 
.EQ
1 over 1 , 4 over 8 , or x over y
.EN

Create operators for assignment, addition, subtraction, multiplication, division, and equality.
Also provide a function to_double() that converts a \*[c]Rational\*[r] into a \*[c]double\*[r] primitive.

The following relationships may prove useful:

\fBAddition\fR
.EQ
a over b + c over d = {ad + bc} over bd
.EN

\fBSubtraction\fR
.EQ
a over b - c over d = {ad - bc} over bd
.EN


\fBMultiplication\fR
.EQ
a over b times c over d = ac over bd
.EN


\fBDivision\fR
.EQ
a over b \[u00F7] c over d = ad over bc
.EN

\fBEquality\fR
.EQ
a over b = c over d roman {" if and only if, "} ad = bc
.EN

Answer the following:
.RS
.nr step 1 1
.IP \n[step].
How is the \*[c]Rational\*[r] class better than the primitive \*[c]double\*[r]? Worse?






.IP \n+[step].
Give an example where the \*[c]Rational\*[r] class gives a mathematically better result 
over using the primitive \*[c]double\*[r].
.RE





.bp
.so reflection.ms

