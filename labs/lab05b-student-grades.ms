.ds CH Lab #5b: Student grades
.so headings.ms
.TL
\*[CH]
.NH
Student grades: 100 points, 90 minutes \fImaximum\fR
.time_box
.RS
This exercise is intended to build your understanding of using vectors of pointers.

The main objective is to complete a program that computes average student grades read in from a file.

.nr step 0 1
.IP \n+[step].
Download the starter files for this lab.
.IP \n+[step].
Some of the code has been written already.
Your job is to fill in the remaining code.
.IP \n+[step].
Do not edit the .h files.
They define the interface, which is complete.

You are responsible for 
.CW
  main.cpp
  math.cpp
  student.cpp
.R

Most of your code should be in \fCstudent.cpp\fR.
.IP \n+[step].
Do not prompt for input.
The code provided is intended to read input from \fIstandard input\fR, for example:
.CW
  ./pointers < grades.txt
  cat grades.txt | ./pointers
.R

Both have the same effect.
Each sends the \fIstandard input\fR into your program.
.IP \n+[step].
When complete, the program should prduce the following results:
.CW
    # ./pointers < grades.txt 
    Name:   Alice   Id:    12345    Avg:    87.31
    Name:   Bob     Id:    67890    Avg:    85.89
    Name:   Clara   Id:    98765    Avg:    85.58
    Name:   Doug    Id:    65432    Avg:    81.67
    Name:   Elise   Id:    321456   Avg:    78.64
    Name:   Fred    Id:    876345   Avg:    77.8
.R

.IP \n+[step].
Answer the following question:

Is this the simplest implementation for this problem using vectors?

What should be done to simplify this program?


Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab5b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab5b
.R

