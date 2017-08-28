.ds CH Lab #2a: Functions
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
Using namespaces: 30 points, 30 minutes \fImaximum\fR
.time_box
Write a program using a containing 3 namespaces: \*[c]X\*[r], \*[c]Y\*[r], and \*[c]Z\*[r].
Use the following code for function \*[c]main()\*[r]:
.RS
.CW
   int main() {
     X::var = 7;
     X::print();           // print the var in namespace X
     using namespace Y;
     var = 9;
     print();              // print the var in namespace Y
     {
       using Z::var;
       using Z::print;
       var = 11;
       print();            // print the var in namespace Z
     }
     print();              // print the var in namespace Y
     X::print();           // print the var in namespace X
   }
.R

Each namespace needs to define an \*[c]int\*[r]  variable \*[c]var\*[r] and a function \*[c]print()\*[r]
that outputs the appropriate \*[c]var\*[r] using \*[c]cout\*[r].

You may put all the code in a single file, if you prefer.

When complete, a working program should print:
.CW
    X: 7
    Y: 9
    Z: 11
    Y: 9
    X: 7
.R
.RE
.bp
.NH
Debugging: 30 points, 30 minutes \fImaximum\fR
.time_box
The purpose of this exercise is to provide an appreciation for following namespace best practices.

.RS
.nr step 0 1
.IP \n+[step].
Copy the program \fCexamples/week02/anti-patterns/swap-problem.cpp.
.IP \n+[step].
Examine the program and record the expected output.

.IP \n+[step].
Compile and run the program.
.IP \n+[step].
What is wrong with this program?  What changes need to be made to fix it?
.IP \n+[step].
Make the changes you think are needed.
.RE

Use turnitin to hand in your work when complete.

.bp
.so reflection.ms


