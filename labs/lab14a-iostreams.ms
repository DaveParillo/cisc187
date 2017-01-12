.ds CH Lab #14a: Input and Output streams
.so headings.ms
.TL
\*[CH]
.so cover-page.ms

.bp
.NH
Reading Points from a file: 60 minutes \fImaximum\fR
.time_box
.QP
In this lab, the goal is to reinforce the basic concepts from this chapter.

The game plan is to prompt the user for data, store the data temporarily in memory,
then write the data to file.
After the data has been saved, read it back from the file and compare the two copies.
.RS
.nr step 1 1
.IP \n[step].
Create the \*[c]Point\*[r] class.  It should store two coordinates, \*[c]x\*[r] and \*[c]y\*[r].
.IP \n+[step].
Using the example source for this chapter, prompt the user to input 7 \fI(x,y)\fR pairs.
As the data is entered, store it in a vector of \*[c]Point\*[r]s called \*[c]original_points\*[r].
.IP \n+[step].
Print the \*[c]original_points\*[r] vector.
.IP \n+[step].
Open an \*[c]ofstream\*[r] and output each point to a file named \fCmydata.txt\fR.
.IP \n+[step].
Close the \*[c]ofstream\*[r] and open an \*[c]ifstream\*[r] to \fCmydata.txt\fR.
Read the date from \fCmydata.txt\fR and store it in a new \*[c]vector\*[r] called \*[c]processed_points\*[r].
.IP \n+[step].
Print the data elements from \*[c]processed_points\*[r].

.NH
Refactoring: 60 minutes \fImaximum\fR
.time_box
.QP
\fIRefactoring\fR refers to the process of improving a function or class.
As originally defined by Martin Fowler and Kent Beck, is 
.QI
A change made to the internal structure of software to make it easier to understand and 
cheaper to modify without changing its observable behavior \[u2014] 
It is a disciplined way to clean up code that minimizes the chances of introducing bugs.
.QP
Refactor the \fClong_method.cpp\fR code small from the week 1 example.
.RE
.nr step 1 1
.IP \n[step].
Eliminate duplication by breaking main into smnaller functions.
.IP \n+[step].
Consider simplyfying the user interaction by replacing the \fC-1\fR exit criteria with text.
.IP \n+[step].
Consider replacing separate \fCnumber\fR and \fCvalue\fR primitives with a \*[c]vector\*[r].


