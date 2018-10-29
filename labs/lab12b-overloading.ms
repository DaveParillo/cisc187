.ds CH Lab #12b: Operator overloading
.so headings.ms
.TL
\*[CH]
.NH
Adding operator overloads to Rational: 4 points, 90 minutes \fImaximum\fR
.LP
The goal of this lab is to add math operations to Rational
so that it behaves much like the fundamental types.

In all steps, ensure that your operator overloads are member functions only when appropriate.

.RS
.nr step 0 1
.IP \n+[step].
Copy the file \fCRational.h\fR 
from the previous lab.
You may use your own or my posted solution.

.IP \n+[step].
Create operator overloads for assignment and equality.
The formula for equality is:
.EQ
a over b = c over d roman {" if and only if, "} ad = bc
.EN
.IP \n+[step].
Create operator overloads for addition.
The formula for addition is:
.EQ
a over b + c over d = {ad + bc} over bd
.EN
.IP \n+[step].
Create operator overloads for subtraction.
The formula for subtraction is:
.EQ
a over b - c over d = {ad - bc} over bd
.EN
.IP \n+[step].
Create operator overloads for multiplication.
The formula for multiplication is:
.EQ
a over b times c over d = ac over bd
.EN
.IP \n+[step].
Create operator overloads for division.
The formula for division is:
.EQ
a over b \[u00F7] c over d = ad over bc
.EN
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab12b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab12b
.R

Consider writing a program that uses your Rational class.
