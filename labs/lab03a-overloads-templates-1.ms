.ds CH Lab #3a: Overloads and Templates
.so headings.ms
.TL
\*[CH]
.NH
Writing function overloads: 60 minutes \fImaximum\fR
.time_box
.RS
.IP 1.
Write a set of function overloads for finding the absolute value of a number.

Do \fBnot\fR use any built-in or standard library functions to compute the absolute value.
.IP 2.
Include enough overloads to cover all the C++ fundamental types.

Keep your overload declarations and defintions separate.
.IP 3.
Repeat step 1, but this time use a template.

You should implement the template in an include file.
.IP 4.
Write a simple test program to verify your code functions correctly.
Prefer using \*[c]assert\*[r] or some other test function
over prompting for input and writing \*[c]cout\*[r] statements.

.RE



.NH
Refactoring to a template: 60 minutes \fImaximum\fR
.time_box
.RS
.IP 1.
Copy the \fCsimple-parameter.cpp\fR file from the week 2 examples directory,
and copy these files from the week 3 examples directory:
.CW
 square.h
 square.cpp
.R
.IP 2.
Refactor these two programs to use templates.
.IP 3.
Write simple test programs to verify your code functions correctly.

.RE

