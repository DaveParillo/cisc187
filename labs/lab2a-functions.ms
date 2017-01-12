.ds CH Lab #2a: Functions
.so headings.ms
.TL
\*[CH]
.so cover-page.ms

.bp
.NH
Using multiple source files: 30 minutes \fImaximum\fR
.time_box
.QP
Create 3 files: \*[c]my.h\*[r], \*[c]my.cpp\*[r], and \*[c]use.cpp\*[r].
The header file \*[c]my.h\*[r] contains:
.RS
.CW
   extern int foo;
   void print_foo();
   void print(int);
.R
.RE

The source code file \*[c]my.cpp\*[r] should include \*[c]my.h\*[r] and \*[c]iostream\*[r], 
and define \*[c]print_foo()\*[r] to print the value of \*[c]foo\*[r] using \*[c]cout\*[r], and
\*[c]print(int i)\*[r] to print the value of \*[c]i\*[r] using \*[c]cout\*[r].

The source code file \*[c]use.cpp\*[r] should include \*[c]my.h\*[r] and define \*[c]main()\*[r].
\*[c]use.cpp\*[r] should set the value of \*[c]foo\*[r] to \fC7\fR and print it using
\*[c]print_foo()\*[r], and print the value of \fC99\fR using \*[c]print()\*[r].
Note that \*[c]use.cpp\*[r] does not include \*[c]iostream\*[r], as it doesn't directly
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

Without compiling, determine the output of these functions and complete the following table.
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

\*[c]int x = 7;\*[r] ! !
\*[c]int y = 9;\*[r] ! !
\*[c]swap_v(x,y);\*[r] ! !

\*[c]swap_r(x,y);\*[r] ! !

\*[c]swap_cr(x,y);\*[r] ! !

_

\*[c]swap_v(7,9);\*[r] ! !

\*[c]swap_r(7,9);\*[r] ! !

_

\*[c]const int cx = 7;\*[r] ! !
\*[c]const int cy = 9;\*[r] ! !
\*[c]swap_v(cx,cy);\*[r] ! !

\*[c]swap_r(cx,cy);\*[r] ! !

_

\*[c]swap_v(7.5,9.9);\*[r] ! !

\*[c]swap_r(7.5,9.9);\*[r] ! !
_

\*[c]double dx = 7.5;\*[r] ! !
\*[c]double dy = 9.9;\*[r] ! !
\*[c]swap_v(dx,dy);\*[r] ! !

\*[c]swap_r(dx,dy);\*[r] ! !

_
.TE
.LP

.bp
.NH
Using namespaces: 30 minutes \fImaximum\fR
.time_box
.QP
Write a program using a \fIsingle file\fR containing 3 namespaces: \*[c]X\*[r], \*[c]Y\*[r], and \*[c]Z\*[r].
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

.RE
.bp
.so reflection.ms


