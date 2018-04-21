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

In all steps, ensure that your operator overloads are member functions only when appropriate.

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

Use the following to compute the greatest common divisor of the numerator and denominator:
.CW
  #pragma once
  #include <cmath>
  \m[green]//
  // Compute the Greatest Common Divisor of two integers
  // In C++17, it is provided.
  // see http://en.cppreference.com/w/cpp/numeric/gcd
  //\m[]
  #define IntegralType class
  template <IntegralType M, IntegralType N>
  auto gcd(M x, N y) -> decltype(x+y) { 
    return y == 0 ? std::abs(x) : gcd(y, x % y); 
  }
.R
.IP \n+[step].
Create a two argument constructor. 
The constructor should take \*[c]long\*[r]s for the numerator and denominator.
Default the numerator to 0 and the denominator to 1.
.IP \n+[step].
Create a conversion constructor and a function \fCto_double()\fR 
that converts a \*[c]Rational\*[r] to a \*[c]double\*[r].
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
.IP \n+[step].
Answer the following questions:
.RS
.IP a.
How is the \*[c]Rational\*[r] class better than the fundamental type \*[c]double\*[r]? Worse?
.IP b.
Give an example where the \*[c]Rational\*[r] class gives a mathematically better result 
over using the fundamental type \*[c]double\*[r].
.br
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
