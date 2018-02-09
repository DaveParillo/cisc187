.ds CH Lab #3a: Functions
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Pass by reference and pass by value: 40 points, 30 minutes \fImaximum\fR
.time_box
.QP
Given 3 functions: 
.RS
.CW
 void swap_v (int a, int b);
 void swap_r (int& a, int& b);
 void swap_cr(const int& a, const int& b);
.R
.RE

And given that each function has the same body:
.RS
.CW
   {
      int temp;
      temp = a;
      a = b;
      b = temp;
   }
.R
.RE

Without compiling, determine the output of these functions and complete the table on the next page.
Not all of the examples in the table below will compile.
Which of these calls compile?  
Provide an explanation for each function call that does not compile.


.TS
center box tab (!);
cb|cb|cb
cb|cb|cb
l|c|lw(2.5i).
Definitions and ! Compiles? !Explanation
Funtion call ! (Y/N) !
_

\*[c]int x = 7;\*[r] ! Y ! variables x and x are declard here
\*[c]int y = 9;\*[r] ! Y ! and used in the next 3 function calls

\*[c]swap_v(x,y);\*[r] ! !

\*[c]swap_r(x,y);\*[r] ! !

\*[c]swap_cr(x,y);\*[r] ! !

_

\*[c]swap_v(7,9);\*[r] ! !

\*[c]swap_r(7,9);\*[r] ! !

_

\*[c]const int cx = 7;\*[r] ! Y ! --
\*[c]const int cy = 9;\*[r] ! Y ! --
\*[c]swap_v(cx,cy);\*[r] ! !

\*[c]swap_r(cx,cy);\*[r] ! !

_

\*[c]swap_v(7.5,9.9);\*[r] ! !

\*[c]swap_r(7.5,9.9);\*[r] ! !
_

\*[c]double dx = 7.5;\*[r] ! Y ! --
\*[c]double dy = 9.9;\*[r] ! Y ! --
\*[c]swap_v(dx,dy);\*[r] ! !

\*[c]swap_r(dx,dy);\*[r] ! !

.TE
.LP

.bp
.NH
Debugging: 30 points, 30 minutes \fImaximum\fR
.time_box
The purpose of this exercise is to provide an appreciation for following namespace best practices.

.RS
.nr step 0 1
.IP \n+[step].
Copy the program 
\fC~dparillo/public_html/cisc187/examples/week03/anti-patterns/swap-problem.cpp\fR
to \fClab3a.cpp\fR.

.IP \n+[step].
Examine the program and record the expected output.

You may record your expectations in a comment block at the top of the file.

.IP \n+[step].
Compile and run the program.
.IP \n+[step].
What is wrong with this program?  What changes need to be made to fix it?
.IP \n+[step].
Make the changes you think are needed.
.IP \n+[step].
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab3a
.R
.IP \n+[step].
Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab3a
.R
.RE

