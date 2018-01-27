.ds CH Lab #4a: Pointers
.so headings.ms
.TL
\*[CH]
.NH
Pointers and arrays: 50 points, 45 minutes \fImaximum\fR
.time_box
.RS
This exercise is intended to build your understanding of pointers and their relation to arrays. 

.nr step 0 1
.IP \n+[step].
Write a function \*[c]print_array(ostream& os, int* a , int n)\*[r] that writes 
the addresses and values of \*[c]a\*[r] (assumed to have n elements) to \*[c]os\*[r].
.IP \n+[step].
Allocate an \*[c]int\*[r], initialize it to 7, and assign its address to a stack variable \fBp1\fR.
.IP \n+[step].
Print out the value of \fBp1\fR and of the \*[c]int\*[r] it points to.
.IP \n+[step].
Allocate an array of seven \*[c]int\*[r]s; initialize it to 1, 2, 4, 8, etc.; on the heap
and assign its address to a variable \fBp2\fR.
.IP \n+[step].
Print out the value of \fBp2\fR and of the \*[c]int\*[r] it points to.
.IP \n+[step].
Declare an int* called \fBp3\fR and initialize it with \fBp2\fR.
.IP \n+[step].
Assign \fBp1\fR to \fBp2\fR.
.IP \n+[step].
Assign \fBp3\fR to \fBp2\fR.
.IP \n+[step].
Use \*[c]print_array\*[r] to display all the values of \fBp1\fR, \fBp2\fR, and \fBp3\fR.
.IP \n+[step].
Declare an int* called \fBp4\fR of size 7.
.IP \n+[step].
Copy the values from the array pointed to by p3 into the array pointed to by \fBp4\fR.
.IP \n+[step].
Assign the value stored in \fBp1\fR to the third element of \fBp2\fR.
.IP \n+[step].
Use \*[c]print_array\*[r] to display all the values of \fBp1\fR, \fBp2\fR, \fBp3\fR, and \fBp4\fR.
.IP \n+[step].
Deallocate all the memory you allocated from the heap.

When finished, check your program on buffy by running \fCvalgrind\fR, a memory checking program.

First compile your program, for example \fCpointers.exe\fR, then run it through valgrind:
.CW
 valgrind pointers.exe
.R

If you properly cleaned up after your pointers, you should see the following line near the end of the output:
.CW
 All heap blocks were freed -- no leaks are possible
.R

Otherwise, you see information indicating memory leaks or other memory related errors.
.RE

.bp
.NH
Pointers and vectors: 50 points, 45 minutes \fImaximum\fR
.time_box
.RS
This exercise is intended to build your understanding of using pointers and with vectors.

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





When both labs are complete, use the turnitin script to hand them in.

