.ds CH Lab #4b: Regular polygons
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Shape area: 100 points, 90 minutes \fImaximum\fR
.time_box
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
.RS
.IP a.
The function should be \*[c]constexpr\*[r].
.IP b.
The return type should be \*[c]double\*[r].
.IP c.
The function name should be \*[c]area\*[r]
and it should take a single template parameter for the radius.
.RE

\fBNote:\fC As a \*[c]constexpr\*[r] function, 
C++11 will not allow adding code to check the invariants.
.RE

An area function with two parameters should compute the area of a regular polygon.

.RS
.IP \n+[step].
Create a template to compute the perimeter of a regular polygon.
.RS
.IP a.
The return type should be \*[c]double\*[r].
.IP b.
The function name should be \*[c]perimeter\*[r]
and it should take a single template parameter for the length of a side
and an \*[c]uint16_t\*[r] for the number of sides.
.IP c.
Remember to check for the invariants of perimeter.
.RE

General formula for perimeter of a regular polygon:
.EQ
p = s times n
.EN
where:
.RS
\fBs\fR = length of one side
.br
\fBn\fR = number of sides
.RE

.IP \n+[step].
Create a template to compute the apothem of a regular polygon.
.RS
.IP a.
The return type should be \*[c]double\*[r].
.IP b.
The function name should be \*[c]apothem\*[r]
and it should take a two template parameters.
One for the length of a side
and an \*[c]uint16_t\*[r] template parameter for the number of sides.
.IP c.
Remember to check for the invariants of the function.
.RE

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
All of the trig functions in C++ (and most other languages) use angular units in radians, 
not degrees, so the argument to the 
tangent function is $180 over n pi over 180 = pi over n$ rather than $180 over n$.

.IP \n+[step].
Create an area function template with one type parameter and a non-type int template parameter.
The type parameter should indicate the length of each side of the polygon.
The non-type parameter should indicate the number of sides of the polygon.
This function should compute the area of a regular polygon with an arbitrary number of sides.

Are there alternative designs that would work as effectively?

.br
\fBArea\fR
.EQ
Area = {a times p} over 2
.EN
where:
.RS
\fBa\fR = apothem
.br
\fBp\fR = perimeter
.RE
.IP \n+[step].
Ensure your functions will work with all the C++ fundamental types.
.RE

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab4b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab4b
.R

