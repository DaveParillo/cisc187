.ds CH Lab #2b: Using std::vector
.so headings.ms
.TL
\*[CH]
.SH
Using std::vector: 4 points, 90 minutes \fImaximum\fR
.LP
The purpose of this exercise is to practice working with \*[c]std::vector\*[r]
and traditional loops.

We will be writing a program that takes values from the command line,
and performs a series of operations.

Expect the program to be invoked as follows:
.CW
    ./lab2b -a 1 2 3 4
.R

The first argument is an instruction telling the program what operation to perform
on the remaining arguments, which will all be integers.

This lab is important for 2 reasons:
.RS
.IP 1.
\fBMany\fR examples, labs, and quizzes, and all 3 projects require working with 
\*[c]std::vector\*[r]. 
It is a fundamental data structure in the STL and you need to be familiar with
its use in order to be successful in this course.
.IP 2.
All 3 projects require at least some command line argument processing.
You need to understand how to parse \*[c]argv[]\*[r]
and how to convert \*[c]const char*\*[r] values into other builtin types.
.RE

Use the tools you already have to solve this lab.
Do not use STL algorithms or iterators.
I will deduct points for solutions that do.
We will get to these topics soon enough.

You should only include \*[c]<vector>\*[r]
and \*[c]<iostream>\*[r] to complete this lab.

\fBSteps\fR
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

If you need help with this step,
refer to the textbook and the lab 1a extra credit solution:
.CW
  http://209.129.16.61/~dparillo/solutions/lab01a_solution
.R

.IP \n+[step].
Create a \*[c]std::vector\*[r] object and assign the remaining elements of \fCargv\fR to it.
.RE
.bp
.LP
.B
Steps (continued)
.R
.RS
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

.B
Do not use any standard library functions to compute the sum.
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

.B
Do not use any standard library functions to compute the mean.
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

.B
Do not use any standard library functions to reverse the vector.
.R

.RE
.LP

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab2b
.R

The script will evaluate your progress and test your work.

You should continue working on it until all tests pass (\m[green]OK\m[]).

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab2b
.R

