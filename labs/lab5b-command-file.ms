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

The basic idea is to manipulate a \*[c]string\*[r] using commands read in from a file.
.RS
.nr step 1 1
.IP \n[step].
Create a class \*[c]Sequence\*[r]. This class should contain 1 private data member, a \*[c]string\*[r].
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
string stored in the \*[c]Sequence\*[r] class. The commands are defined as follows:
.RS
.IP \(bu 
\fBadd \fIstring\fR 
.br
The \*[c]add\*[r] command should append the provided value to the string in \*[c]Sequence\*[r].
.IP \(bu 
\fBprint\fR 
.br
The \*[c]print\*[r] command should send the current value of the string in \*[c]Sequence\*[r] to standard output.
.IP \(bu 
\fBinsert \fIpos string\fR 
.br
The \*[c]insert\*[r] command should insert the provided value to the string in \*[c]Sequence\*[r] at the requested position. Assume positions in the string are 0 based.  That is, position 0 is the first position in the string, so executing \*[c]insert 0 X\*[r] on a string \*[c]abc\*[r] would result in \*[c]Xabc\*[r]. Hint: std::string has insert and append functions.
.RE

When complete, the program should produce:

.RS
.CW
 abc
 aXYZbc123
.R
.RE

.B Gameplan
.RS
.IP a.
Create a \fIsimple\fR \fCSequence\fR class with the required API (print, insert, add)
Consider using \*[c]operator<<\*[r] to handle print tasks.
.IP b.
Create an \*[c]ifstream\*[r] to read the file.
.IP c.
While not at and of file, read an entire line and process it.
.IP d.
Create a function to operate on the \fCSequence\fR object, 
based on the contents of the line.
Hint: std::istringstream can be used to create a input stream from a string.
.RE
.RE
.bp
.NH
Formatted I/O: 30 minutes \fImaximum\fR
.time_box
.QP
.RS
.nr step 1 1
.IP \n[step].
Try reading as octal, hexadecimal, etc.:
.RS
.CW
  std::cin  >> a >> std::oct >> b >> std::hex >> c >> d;
  std::cout << a << '\t' << b << '\t' << c << '\t' << d << 'n' ;
.R

Run this code with the input:
.CW
  1234 1234 1234 1234
.R

Explain the results:




Add another \*[c]cout\*[r] line that displays the original 4 values entered.
.RE

.IP \n+[step].
Write some code to print the number 1234567.89 three times, 
first using \*[c]defaultfloat\*[r], then \*[c]fixed\*[r], then \*[c]scientific\*[r] forms. 
Which output form presents the user with the most accurate representation? Explain why.





.IP \n+[step].
Add to the previous example a loop to display the same number in
\*[c]defaultfloat\*[r], then \*[c]fixed\*[r], then \*[c]scientific\*[r] forms 
in increasing the output precision on each iteration.
The loop should start at 0 and end at 8.

When do different values of precision equal the defaults for the different output forms?

.bp
.so reflection2.ms

