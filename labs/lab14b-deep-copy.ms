.ds CH Lab #14b: Deep copies
.so headings.ms
.TL
\*[CH]
.NH
Shallow and Deep Copies: 4 points, 90 minutes \fImaximum\fR
.LP
This exercise is intended to increase familiarity with 
using smart pointers and how to create copy constructors and copy assignment functions
when the class contains pointers to objects.
.RS
.nr step 0 1
.IP \n+[step].
Download the supporting files for this lab from buffy.
The files are in
.CW
  ~dparillo/public_html/cisc187/labs/lab14b-files/
.R
.br
Copy the files into a new directory and cd into the directory you created.

You should be able to type \fCmake\fR.
The provided makefile should produce an executable named \fCcopies\fR.

There are some warnings, but we will be addressing these in the lab.
.IP \n+[step].
Run the program and notice the output:
.CW
  Copy 1: 
  Original: Alice Bob Carol      Copy: Alice Bob Carol   
  changing only the 'copy' objects: 
  Original: Alice Second  Third  Copy: First Second  Third   
  Copy 2: 
  Original: Dan Edith Fred       Copy: Dan Edith Fred    
  changing only the 'copy' objects: 
  Original: Dan Second  Third    Copy: First Second  Third
.R

This program defines a \*[c]Person\*[r] that contains a pointer to a child.
The child object contains another child.

So our example test program contains 3 objects, \fCAlice\fR, \fCBob\fR, and \fCCarol\fR
and two pointers:
.RS
.IP a.
\fCAlice\fR is not a pointer and has a pointer to \fCBob\fR
.IP b.
\fCBob\fR has a pointer to \fCCarol\fR.
\fCCarol\fR points to nothing.
.RE

This output is not correct.

.IP \n+[step].
The code in the \*[c]class\*[r] \*[c]Person\*[r] is incomplete.

When main copies \fCAlice\fR, what we \fBwant\fR to happen is that changes to the copy
have no effect on \fCAlice\fR or \fIany of her children\fR.
.br
Add code to \fCPerson.cpp\fC so that \fCmain.cpp\fR functions correctly.

Implement the \*[c]Person\*[r] copy constructor and copy assignment operator.
Replace the default (compiler provided) \fIshallow\fR copies
with your own \fIdeep\fR copies.

\fBHint:\fR
.br
Use \*[c]std::shared_ptr::reset\*[r] to replace an existing 
\*[c]std::shared_ptr\*[r] with a new object.
.bp
When complete, the program should produce something similar to:
.CW
  Copy 1: 
  Original: Alice Bob Carol   Copy: Alice Bob Carol   
  changing only the 'copy' objects: 
  Original: Alice Bob Carol   Copy: First Second  Third   
  Copy 2: 
  Original: Dan Edith Fred    Copy: Dan Edith Fred    
  changing only the 'copy' objects: 
  Original: Dan Edith Fred    Copy: First Second  Third
.R

Do \fBnot\fR change anything in \fCmain.cpp\fR.
.IP \n+[step].
Run valgrind to ensure your copy functions do not potentially result in any undefined behavior.
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab14b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab14b
.R

