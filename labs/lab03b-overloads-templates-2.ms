.ds CH Lab #3b: Overloads and Templates #2
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Shape area: 100 points, 90 minutes \fImaximum\fR
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
An area function with 1 parameter should compute the area of a circle.
The parameter can represent either radius or diameter: document your choice.
.IP b.
An area function with two parameters should compute the area of a regular polygon.
.RE
.IP \n+[step].
Create an area function template with one type parameter and a non-type int template parameter.
The type parameter should indicate the length of each side of the polygon.
The non-type parameter should indicate the number of sides of the polygon.
This function should compute the area of a regular polygon with an arbitrary number of sides.

Are there alternative designs that would work as effectively?

General formula for perimeter of a regular polygon:

\fBPerimeter\fR
.EQ
p = s times n
.EN
where:
.RS
\fBs\fR = length of one side
.br
\fBn\fR = number of sides
.RE

\fBApothem\fR
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
Ensure your area functions will work with all the C++ fundamental types.

Keep your declarations and defintions separate.
.RE

Use the \*[c]turnitin\*[r] script when complete.

