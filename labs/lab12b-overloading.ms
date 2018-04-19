.ds CH Lab #12b: Classes and overloading
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.NH
A rational number class: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
The goal of this lab is to explore creating a class that can
perform math operations much like the fundamental types.

.RS
.nr step 0 1
.IP \n+[step].
Create the files \fCRational.h\fR and \fCRational.cpp\fR.

.IP \n+[step].
Design and implement a number class \*[c]Rational\*[r] in the source files created in step 1.

A rational number is a number that can be expressed as a fraction of two integers,
for example: 
.EQ
1 over 1 , -4 over 7 , or x over y
.EN

.IP \n+[step].
Create operators for assignment, addition, subtraction, multiplication, division, and equality.
Since each set of operations is so similar, 
consider having each member in the group implement a different operator
and consolidating your work.

Ensure that your operators are only member functions when it is appropriate.

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

.IP \n+[step].
Create a function to_double() that converts a \*[c]Rational\*[r] into a \*[c]double\*[r] primitive.

.IP \n+[step].
Answer the following questions:
.RS
.IP a.
How is the \*[c]Rational\*[r] class better than the fundamental type \*[c]double\*[r]? Worse?

.IP b.
Give an example where the \*[c]Rational\*[r] class gives a mathematically better result 
over using the fundamental type \*[c]double\*[r].

Provide an explanation for why this is true.
.RE

Record your answers in file \fCRational.h\fR.
.RE

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab12b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab12b
.R

Consider writing a program that uses your Rational class.
