.ds CH Lab #5b
.TL
Lab #5b: Reading structured values
.so cover-page.ms

.bp
.NH
Reading commands from a file: 90 minutes \fImaximum\fR
.time_box
.QP
In this lab, the goal is to perform some of the types of tasks required for project #2.

The basic idea is to manipulate a \fCstring\fR using commands read in from a file.
.RS
.nr step 1 1
.IP \n[step].
Create a class \fCSequence\fR. This class should contain 1 private data member, a \fCstring\fR.
.IP \n+[step].
Save the following text in a file \fCcommands.txt\fR:
.RS
.CW
add abc
print
insert 1 XYZ
add 123
print
.R
.RE
.IP \n+[step].
Create a program that reads \fCcommands.txt\fR and performs the requested operations on the
string stored in the \fCSequence\fR class. The commands are defined as follows:
.RS
.IP \(bu 
\fBadd \fIstring\fR 
.br
The \fCadd\fR command should append the provided value to the string in \fCSequence\fR.
.IP \(bu 
\fBprint\fR 
.br
The \fCprint\fR command should send the current value of the string in \fCSequence\fR to standard output.
.IP \(bu 
\fBinsert \fIpos string\fR 
.br
The \fCinsert\fR command should insert the provided value to the string in \fCSequence\fR at the requested position. Assume positions in the string are 0 based.  That is, position 0 is the first position in the string, so executing \fCinsert 0 X\fR on a string \fCabc\fR would result in \fCXabc\fR.
.RE

When complete, the program should produce:

.RS
abc
aXYZbc123
.RE
.RE
.bp
.so reflection.ms

