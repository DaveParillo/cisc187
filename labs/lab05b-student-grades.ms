.ds CH Lab #5b: Student grades
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.h1 Lab Notes
.LP
Download the starter files for this lab.
.br
Some of the code has been written already.
Your job is to fill in the remaining code.
.br
Do not edit the .h files.
They define the interface, which is complete.
You are responsible for completing:
.CW
  main.cpp
  average.cpp
  student.cpp
.R

Most of your code should be in \fCstudent.cpp\fR.

Do not prompt for input.
The code provided is intended to read input from \fIstandard input\fR, for example:
.CW
  ./grades < class.txt
  cat class.txt | ./grades
.R

Both have the same effect.
Each sends the \fIstandard input\fR into your program.
.bp
.SH
Student grades: 4 points, 90 minutes \fImaximum\fR
.time_box
.RS
This exercise is intended to build your understanding of using vectors of pointers.

The main objective is to complete a program that computes average student grades read in from a file.

.nr step 0 1
.IP \n+[step].
Copy the starter files for this lab.
.CW
  cp -a ~dparillo/public_html/cisc187/labs/lab05b-files/ .
.R

.IP \n+[step].
Implement the average function declared in \*[c]average.h\*[r].
Implement it in \*[c]average.cpp\*[r].
.IP \n+[step].
Implement in \*[c]student.cpp\*[r] the \*[c]operator<<\*[r] overload 
to stream a single student. 
Stream a student with a single tab character between each output item,
for example:
.CW
  Name:\tstudent name\tId:\tstudent id . . . 
.R

.IP \n+[step].
Implement in \*[c]student.cpp\*[r] the \*[c]operator<<\*[r] overload 
.br
to stream a \*[c]vector<student*>\*[r].
.br
This function should loop on each vector element and call the overload from the previous step.
.IP \n+[step].
Implement in \*[c]student.cpp\*[r] the \*[c]add_student\*[r] function. 

Add a single student from the provided \*[c]std::istringstream\*[r] to the vector.
.IP \n+[step].
Implement in \*[c]student.cpp\*[r] the \*[c]load_classroom\*[r] function. 
.IP \n+[step].
Implement a main that uses load_classroom and your print classroom overloads.
There should be no loops in main.

When complete, the program should prduce the following results:
.CW
    # ./grades < class.txt 
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

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab5b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab5b
.R

