.ds CH Lab #3b: Function parameters and returns
.so headings.ms
.TL
\*[CH]
.SH
Passing and returning values: 4 points, 90 minutes \fImaximum\fR
.LP
.nr step 0 1
.IP \n+[step].
Create 2 files \fClab3b.h\fR and \fClab3b.cpp\fR.

Use \fClab3b.h\fR to store the declarations for all lab functions and 
\fClab3b.cpp\fR to store the function definitions.

For the remainder of this lab, the struct and all functions should be placed in the 
\*[c]namespace mesa\*[r].

.IP \n+[step].
Create a \*[c]struct\*[r] named \fCtrigon\fR to hold the lengths of the sides of a 3 sided polygon:
.CW
  struct trigon {
    float a;
    float b;
    float c;
  };
.R

Write a function \fCmake_triple\fR that takes two \*[c]uint16_t\*[r] constants and
returns a \fCtrigon\fR that is a Pythagorean triple using Euclid's formula:
.CW
  trigon make_triple (const uint16_t m, const uint16_t n);
.R

You need to include \*[c]<cstdint>\*[r] to use the \*[c]uint16_t\*[r] type.

Use Euclid's formula to create a Pythagorean triple
from the two parameters \fCm\fR and \fCn\fR.

When \fCm\fR > \fCn\fR > \fC0\fR, the following:
.EQ
  a = m sup 2 - n sup 2
.EN
.EQ
  b = 2mn
.EN
.EQ
  c = m sup 2 + n sup 2
.EN

will create a Pythagorean right triangle.

If parameter \fCm\fR is less than \fCn\fR, 
or \fCn < 1\fR the \fCmake_triple\fR should return \fC{0,0,0}\fR.

.IP \n+[step].
Write a function \fCscale\fR that takes a \fCtrigon\fR reference and a \*[c]float\*[r] factor and
increases or decreases the size of the trigon:
.CW
  void  scale (trigon&, const float);
.R

Values > 1.0 should make the trigon sides longer.
Values < 1.0 should make the trigon sides shorter.

The function should not modify the trigon if the scale factor is < 0.01.

This function should not return a value.
.bp
.IP \n+[step].
Write a function \fCarea\fR that takes a constant \fCtrigon\fR reference and
returns the area of the trigon:
.CW
  float area (const trigon&);
.R

To compute the area, first compute the semi-perimeter:
.EQ
  s = {a + b + c} over 2
.EN

Compute the area using the semi-perimeter:
.EQ
  a = sqrt{s(s-a)(s-b)(s-c)}
.EN

If any side of the \fCtrigon\fR is 0, then return 0 for the area.

You need to include \*[c]<cmath>\*[r] to use the \*[c]sqrt\*[r] function.

.IP \n+[step].
Write a function \fCsmallest\fR that takes a constant \*[c]vector<trigon>\*[r] reference and
returns the \fCtrigon\fR with the smallest area.
.CW
  trigon smallest (const vector<trigon>&);
.R

.IP \n+[step].
Write a function \fCfirst\fR that takes a constant \*[c]vector<string>\*[r] reference and returns 
the first \*[c]string\*[r] in the \*[c]vector\*[r],
where 'first' is determined by their alphabetically sorted position.
Accomplish this \fIwithout\fR sorting the vector.
.CW
  string first (const vector<string>&);
.R

Given the following word list:
.CW
    "reach", "clear", "fall", "set", "yard",
    "liquid", "wise", "badge", "four", "coherent"
.R

The function should return:
.CW
    badge
.R

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab3b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab3b
.R

