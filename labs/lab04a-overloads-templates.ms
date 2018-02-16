.ds CH Lab #4a: Overloads and Templates
.so headings.ms
.TL
\*[CH]
.NH
Writing function overloads: 50 points, 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 0 1
.IP \n+[step].
Create 2 files, \*[c]abs.h\*[r] and \*[c]abs.cpp\*[r].
.IP \n+[step].
Write a set of function overloads for finding the absolute value of a number.

Ensure your absolute value functions reside in the mesa namespace.

The overloads should take a single value of some type and return a value of equivalent type.

Do \fBnot\fR use any built-in or standard library functions to compute the absolute value.

Include enough overloads to cover all the C++ fundamental types.

Keep your overload declarations and defintions separate.
.IP \n+[step].
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab4a part1
.R
.RE




.NH
Refactoring to a template: 50 points, 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 0 1
.IP \n+[step].
Copy the \*[c]simple-parameter.cpp\*[r] file from the week 3 examples directory.

Copy these files from the week 4 examples directory:
.CW
 square.h
 square.cpp
.R
.IP \n+[step].
Refactor \*[c]simple-parameter.cpp\*[r] to use templates.

The template should be implemented in a header file.

.IP \n+[step].
Refactor the square program to use templates.
.IP \n+[step].
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab4a part2
.R
.IP \n+[step].
Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab4a
.R
.RE

