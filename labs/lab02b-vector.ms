.ds CH Lab #2b: Using std::vector
.so headings.ms
.TL
\*[CH]
.bp
.NH
Using std::vector: 100 points, 90 minutes \fImaximum\fR
.time_box
The purpose of this exercise is to practice working with \*[c]std::vector\*[r].

We will be writing a program that takes values from the command line,
and performs a series of operations.

Expect the program to be invoked as follows:
.CW
    ./lab2b -a 1 2 3 4
.R
The first argument is an instruction telling the program what operation to perform
on the remaining arguments, which will all be integers.


.RS
.nr step 0 1
.IP \n+[step].
Create a file lab2b.cpp.

The main function should process the following 4 command line switches:
.RS
.IP \fB-a\fP
Indicate all remaining values should be added
.IP \fB-m\fP
Take the mean of all remaining values
.IP \fB-o\fP
Print only the odd values remaining
.IP \fB-r\fP
Print all values remaining in reverse order
.RE
.IP \n+[step].
Create a \*[c]std::vector\*[r] object and assign the remaining elements of \fCargv\fR to it.

.IP \n+[step].
Compute the \fBsum\fR of all of the numbers in the \*[c]vector\*[r].

Given:
.CW
    ./lab2b -a 1 2 3 4
.R
The program should output:
.CW
    10
.R

.IP \n+[step].
Compute the \fBmean\fR of all of the numbers in the \*[c]vector\*[r].

Given:
.CW
    ./lab2b -m 1 2 3 4
.R
The program should output:
.CW
    2.5
.R

.IP \n+[step].
Print only the \fBodd\fR numbers in the \*[c]vector\*[r].

Given:
.CW
    ./lab2b -o 1 2 3 4
.R
The program should output:
.CW
    1 3
.R

.IP \n+[step].
Print the  \*[c]vector\*[r] with its elements in \fBreverse order\fR.

Given:
.CW
    ./lab2b -r 1 2 3 4
.R
The program should output:
.CW
    4 3 2 1
.R

.IP \n+[step].
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab2b
.R

The script will evaluate your progress and test your work.

You should continue working on it until all tests pass (\m[green]OK\m[]).
.IP \n+[step].
Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab2b
.R
.RE

.bp
.so reflection2.ms

