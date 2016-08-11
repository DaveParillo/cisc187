.ds CH Lab #2a
.TL
Lab #2a: Functions
.so cover-page.ms

.bp
.NH
Using multiple source files: 30 minutes \fImaximum\fR
.time_box
.QP
Create 3 files: \fCmy.h\fR, \fCmy.cpp\fR, and \fCuse.cpp\fR.
The header file \fCmy.h\fR contains:
.RS
.CW
   extern int foo();
   void print_foo();
   void print(int);
.R
.RE

The source code file \fCmy.cpp\fR should include \fCmy.h\fR and \fCiostream\fR, 
defines \fCprint_foo()\fR to print the value of \fCfoo\fR using \fCcout\fR, and
\fCprint(int i)\fR to print the value of \fCi\fR using \fCcout\fR.

The source code file \fCuse.cpp\fR should include \fCmy.h\fR and define \fCmain()\fR.
\fCmain()\fR should set the value of \fCfoo\fR to \fC7\fR and print it using
\fCprint_foo()\fR, and print the value of \fC99\fR using \fCprint()\fR.
Note that \fCuse.cpp\fR does not include \fCiostream\fR, as it doesn't directly
use any of those facilities.

Create these files and get them to compile and run.
.LP
.NH
Pass by reference and pass by value: 30 minutes \fImaximum\fR
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

Without compiling, predict the output of these functions and complete the following table.
Not all of the examples in the table below will compile.
Which of these calls compile?  Provide an explanation for each function call that does not compile.


.TS
center box tab (!);
cb|cb|cb
cb|cb|cb
l|c|lw(2.5i).
Definitions and ! Compiles? !Explanation
Funtion call ! (Y/N) !
_

\fCint x = 7;\fP ! !
\fCint y = 9;\fP ! !
\fCswap_v(x,y);\fP ! !

\fCswap_r(x,y);\fP ! !

\fCswap_cr(x,y);\fP ! !

_

\fCswap_v(7,9);\fP ! !

\fCswap_r(7,9);\fP ! !

\fCswap_cr(7,9);\fP ! !

_

\fCconst int cx = 7;\fP ! !
\fCconst int cy = 9;\fP ! !
\fCswap_v(cx,cy);\fP ! !

\fCswap_r(cx,cy);\fP ! !

\fCswap_cr(cx,cy);\fP ! !

_

\fCswap_v(7.5,9.9);\fP ! !

\fCswap_r(7.5,9.9);\fP ! !

\fCswap_cr(7.5,9.9);\fP ! !

_

\fCdouble dx = 7.5;\fP ! !
\fCdouble dy = 9.9;\fP ! !
\fCswap_v(dx,dy);\fP ! !

\fCswap_r(dx,dy);\fP ! !

\fCswap_cr(dx,dy);\fP ! !

_
.TE
.LP

.bp
.NH
Using namespaces: 30 minutes \fImaximum\fR
.time_box
.QP
Write a program using a \fIsingle file\fR containing 3 namespaces: \fCX\fR, \fCY\fR, and \fCZ\fR.
Use the following code for function \fCmain()\fR:
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

Each namespace needs to define a variable \fCvar\fR and a function \fCprint()\fR
that outputs the appropriate \fCvar\fR using \fCcout\fR.

.RE


.bp
.NH
Passing and returning values: 30 minutes \fImaximum\fR
.time_box
.QP
Write a program that takes a \fCvector<string>\fR and returns a \fCvector<int>\fR
containing the number of characters in each \fCstring\fR.
Also find the shortest \fCstring\fR, the longest \fCstring\fR, and the lexicographically first
and last \fCstring\fRs.


How many separate functions would you use for these tasks?  Why?




.bp
.so reflection.ms
