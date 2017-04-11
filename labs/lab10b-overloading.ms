.ds CH Lab #10b: Classes and overloading
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
A rational number class: 90 minutes \fImaximum\fR
.time_box
.QP
Read through the entire lab first and answer the following:
.RS
.nr step 0 1
.IP \n+[step].
How is the \*[c]Rational\*[r] class better than the primitive \*[c]double\*[r]? Worse?






.IP \n+[step].
Give an example where the \*[c]Rational\*[r] class gives a mathematically better result 
over using the primitive \*[c]double\*[r].


.IP \n+[step].
Design and implement a number class \*[c]Rational\*[r].

A rational number is a number that can be expressed as a fraction of two integers,
for example 
.EQ
1 over 1 , 4 over 8 , or x over y
.EN

Create operators for assignment, addition, subtraction, multiplication, division, and equality.
Since each set of operations is so similar, 
consider having each member in the group implement a different operator
and consolidating your work.

Ensure that your operators are only member functions when it is appropriate.

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
.RE

