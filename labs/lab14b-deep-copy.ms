.ds CH Lab #13b: Deep copies
.so headings.ms
.TL
\*[CH]
.NH
Shallow and Deep Copies: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to increase familiarity with 
using pointers and how to create copy constructors and copy assignment functions
when the class contains pointers to objects.
.RS
.nr step 1 1
.IP \n[step].
Download the supporting files for this lab from buffy.  There is a link in Blackboard.
.IP \n+[step].
The code in the \*[c]class\*[r] \fCPerson\fR is incomplete.
.br
Do \fBnot\fR change anything in \fCmain.cpp\fR.
.br
Add code to \fCPerson.cpp\fC so that \fCmain.cpp\fR functions correctly.
.RS
.IP a.
Overload \*[c]operator<<\*[r] so that streaming \fCPerson* a\fR prints \fCa\fR 
and all of the children of \fCa\fR, for example:
.CW
  Alice	Bob	Carol
.R
.br
all on one line.
.IP b.
Implement the Person destructor so that to include output during destruction, 
.br
for example:
.CW
  deleting Bob in Alice
.R
.IP c.
Implement the Person copy constructor and copy assignment operator.
When complete, the program should produce something similar to:
.CW
 Copy 1: 
 Original: Alice	Bob	Carol	 	Copy: Alice	Bob	Carol	  
 change and compare: 
 Original: Alice	Bob	Carol	 	Copy: Alpha	Beta Charlie	  
  deleting Beta in Alpha
  deleting Charlie in Beta
 Copy 2: 
 Original: Alice	Bob	Carol	 	Copy: Alice	Bob	Carol	  
 change and compare: 
 Original: Alice	Bob	Carol	 	Copy: Alpha	Beta Charlie	  
  deleting Beta in Alpha
  deleting Charlie in Beta
  deleting Bob in Alice
  deleting Carol in Bob
.R
.IP d.
When finished, submit the completed source code using the turnitin script,
or zip the source directory and upload to Blackboard.
.RE
.IP \n+[step].
In \fCmain\fR, add \*[c]delete\*[r] statements for \fCPerson* b\fR and \fCPerson* c\fR.
.br
Compile and run this changed version.
.br
Observe the results and explain.
.RE

