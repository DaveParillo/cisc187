.ds CH Lab #12a: Rational numbers
.so headings.ms
.TL
\*[CH]
.NH
A rational number class: 4 points, 90 minutes \fImaximum\fR
.LP
The goal of this lab is to explore creating a class that can
begin to function like a built in type.

A rational number is a number that can be expressed as a fraction of two integers,
for example: 
.EQ
1 over 1 , -4 over 7 , or x over y
.EN

When today's lab and the next are complete,
we will have created a \fIvalue class\fR
that behaves much like a builtin type.


In all steps, ensure that your operator overloads are member functions only when appropriate.

.RS
.nr step 0 1
.IP \n+[step].
Create the file \fCRational.h\fR

.IP \n+[step].
Create a function in \fCRational.h\fR to reduce fractions 
to their greatest common divisor.

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
  auto gcd(M x, N y) -> decltype(std::max(x,y)) { 
    return y == 0 ? std::abs(x) : gcd(y, x % y); 
  }
.R

.IP \n+[step].
Create a \fCRational\fR class template.
The class should only take 1 type parameter.
The denominator and numerator for your class should both be the same type.

Create a default constructor.
Default the numerator to 0 and the denominator to 1.

Provide functions \fCnumerator\fR and \fCdenominator\fR that return the 
parts of a Rational.

.IP \n+[step].
Create a two argument constructor. 
Make the denominator default value = 1.

This constructor must reduce the numerator and denominator arguments using the 
\*[c]gcd\*[r] function.

The constructor should also enforce the constraint that an Integral type is required.
Consider using
.CW
  static_assert(std::is_integral<T>::value, 
                "Integral required.");
.R

The \*[c]std::is_integral\*[r] class is defined in header 
\*[c]<type_traits>\*[r].

.IP \n+[step].
Create a conversion operator overload and a function \fCto_double()\fR 
that converts a 
.br
\*[c]Rational\*[r] to a \*[c]double\*[r].

If the denominator contains 0, 
then return
.br
\*[c]std::numeric_limits<double>::infinity()\*[r].

.IP \n+[step].
Create a conversion operator overload 
that converts a \*[c]Rational\*[r] to a \*[c]std::string\*[r].

The string should separate numerator and denominator with the '/' character.
No spaces.
Other requirements:
.RS
.IP a.
If the numerator is zero, return "0".
.IP b.
If the numerator equals the denominator, return "1".
.IP c.
If the denominator is zero, return "inf".
.RE

.IP \n+[step].
Create a \*[c]std::ostream\*[r] overload 
(\*[c]operator <<\*[r]) to display a Rational number.

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab12a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab12a
.R

Consider writing a program that uses your Rational class.
