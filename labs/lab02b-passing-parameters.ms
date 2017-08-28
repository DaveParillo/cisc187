.ds CH Lab #2b: Function parameters and returns
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Passing and returning values: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
Write a program that takes a \*[c]vector<string>\*[r] and returns a \*[c]\fCvector<int>\*[r]
containing the number of characters in each \*[c]string\*[r].
The program should also find the shortest \*[c]string\*[r], the longest \*[c]string\*[r], 
and the first and last \*[c]string\*[r]s, 
where 'first' and 'last' is determined by their alphabetical sorted position.
Accomplish this \fIwithout\fR sorting the vector.

The program should contain at least 1 function, but can contain as many as you think
is appropriate.  
Hint: this is a \fIteam\fR lab.

Given the following word list:
.CW
    "reach", "clear", "fall", "set", "yard",
    "liquid", "wise", "badge", "four", "coherent"
.R

The prgram should produce:
.CW
    Shortest:    3, set
    Longest:     9, coherent
    First:       7, badge
    Last:        4, yard
.R

Answer the following equestion:

How many separate functions did you decide to write for these tasks?  Why?

You may answer this in your submitted source code.

Use the \*[c]turnitin\*[r] script when complete.
.bp
.NH
Extra Credit: Using multiple source files: about 30 minutes
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

Your mission: Get these files to compile, run, and print the correct results.

You can't get full credit if \fBany\fR source file includes \*[c]my.cpp\*[r] or \*[c]use.cpp\*[r].

Running \*[c]./use\*[r] should produce:
.CW
    Foo: 7
    Value: 99
.R

Use the \*[c]turnitin\*[r] script when complete.
.bp
.so reflection2.ms

