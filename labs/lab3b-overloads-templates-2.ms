.ds CH Lab #3b: Overloads and Templates #2
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.NH
Shape area: 60 minutes \fImaximum\fR
.time_box
.RS
This lab is a more complicated use of overloads and templates than what was covered on Monday.
.nr step 0 1
.IP \n+[step].
Create a program that computes the area in a number of different ways.
.IP \n+[step].
Use the following assumptions / guidelines:
.RS
.IP a.
The area function 1 parameter should compute the area of a circle.
The parameter can represent either radius or diameter: document your choice.
.IP b.
An area function with two parameters should compute the area of a square or rectangle.
.RE
.IP \n+[step].
Create an area function template with two parameters and a non-type int template parameter.
The non-type parameter should indicate the number of sides of a polygon.
This function should compute the area of a regular polygon with an arbitrary number of sides.
.IP \n+[step].
Ensure your area functions will work with all the C++ fundamental types.

Keep your declarations and defintions separate.
.RE
