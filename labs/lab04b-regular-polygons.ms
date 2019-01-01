.ds CH Lab #4b: Regular polygons
.so headings.ms
.TL
\*[CH]
.SH
Shape area: 4 points, 90 minutes \fImaximum\fR
.LP
.RS
The goal of this lab is to explore templates in more detail.
.nr step 0 1
.IP \n+[step].
Create a include file \*[c]lab4b.h\*[r].

This lab will not include any \fC.cpp\fR files.

If you want to create your own main for testing, you may,
as long as it is not in lab4b.h.

All code should be in the \*[c]mesa\*[r] namespace.

.IP \n+[step].
Create a template to compute the area of a circle.
.CW
  template <class T>
  constexpr double area(const T radius) { . . . 
.R

\fBNote:\fC As a \*[c]constexpr\*[r] function, 
C++11 will not allow adding code to check the invariants.
.RE

An area function with two parameters should compute the area of a regular polygon.

.RS
.IP \n+[step].
Create a template to compute the perimeter of a regular polygon.
.CW
  template <class T>
  double perimeter(const T length, uint16_t num_sides) { . . . 
.R

Remember to check for the invariants of perimeter.

General formula for perimeter of a regular polygon:
.EQ
p = sn
.EN
where:
.RS
\fBs\fR = length of one side
.br
\fBn\fR = number of sides
.RE

.IP \n+[step].
Create a template to compute the apothem of a regular polygon.
.CW
  template <Numeric T, uint16_t num_sides>
  double apothem(const T length) { . . . 
.R

Remember to check for the invariants of the function.

General formula for apothem of a regular polygon:
.br
The apothem is the shortest line from the polygon center to a side.
It will always be a perpendicular bisector of a side.
.EQ
a = s over {2 tan 
left { {pi over n} right }
}
.EN
.br
All the trig functions in C++ (and most other languages) use angular units in radians, 
not degrees, so the argument to the 
tangent function is $180 over n pi over 180 = pi over n$ rather than $180 over n$.

.IP \n+[step].
Create a function template to compute the area of a regular polygon.
.CW
  template <Numeric T, uint16_t num_sides>
  auto area(const T length) -> decltype(length * 1.0f) { . . . 
.R

Use the perimeter and apothem templates written in the previous steps to
compute the area.

This function should compute the area of a regular polygon with an arbitrary number of sides.

Once you have the apothem and perimeter, the area is:
.EQ
Area = {ap} over 2
.EN
where:
.RS
\fBa\fR = apothem
.br
\fBp\fR = perimeter
.RE

Remember to check for the invariants of the function.

.IP \n+[step].
Ensure your functions will work with all the C++ fundamental types.

If you have created your templates correctly, then they should.
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab4b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab4b
.R

