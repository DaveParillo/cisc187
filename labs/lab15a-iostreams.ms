.ds CH Lab #15a: Input and Output streams
.so headings.ms
.TL
\*[CH]
.NH
Reading Points from a file: 100 points, 60 minutes \fImaximum\fR
.time_box
.QP
In this lab, the goal is to reinforce the basic concepts from this chapter.

\fBGame plan:\fR is to prompt the user for data, store the data temporarily in memory,
then write the data to file.
After the data has been saved, read it back from the file and compare the two copies.
.RS
.nr step 0 1
.IP \n+[step].
Download the supporting files for this lab from buffy.
The files are in
.CW
  ~dparillo/public_html/cisc187/labs/lab15a-files/
.R
.br
Copy the files into a new directory and cd into the directory you created.

You should be able to type \fCmake\fR.
The provided makefile should produce an executable named \fCpoints\fR.
.IP \n+[step].
In \fCpoint.cpp\fR, implement the function \*[c]get_points\*[r].

Using the example source for this chapter, prompt the user to input 7 \fI(x,y)\fR pairs.

When the function is complete, uncomment the line \m[green]// auto original_points ...\m[]
from \fCmain.cpp\fR.
.IP \n+[step].
Print the \*[c]original_points\*[r] vector.

In \fCpoint.cpp\fR, implement the function \*[c]show_points\*[r].

When the function is complete, uncomment the first line \m[green]// show_points ( ...\m[]
in \fCmain.cpp\fR.

.IP \n+[step].
Open an \*[c]ofstream\*[r] and output each point to a file named \fCmydata.txt\fR.

In \fCpoint.cpp\fR, implement the function \*[c]write_points\*[r].

Close the \*[c]ofstream\*[r] before leaving the function.

When the function is complete, uncomment the line \m[green]// write_points ( ...\m[]
in \fCmain.cpp\fR.

.IP \n+[step].
Open an \*[c]ifstream\*[r] to \fCmydata.txt\fR.
Read the data from \fCmydata.txt\fR and store it in a new \*[c]vector\*[r].

In \fCpoint.cpp\fR, implement the function \*[c]read_points\*[r].

When the function is complete, uncomment the line \m[green]// read_points ( ...\m[]
in \fCmain.cpp\fR.

.IP \n+[step].
Print the data elements from \*[c]processed_points\*[r].

When the function is complete, uncomment the last \m[green]// show_points ( ...\m[]
in \fCmain.cpp\fR.

Example output:
.CW
  > ./point
  Enter 7 integer pairs, separated by a space:
  Pair 1: 0 1
  Pair 2: 2 3
  Pair 3: 3 4
  Pair 4: 4 5
  Pair 5: 6 7
  Pair 6: 7 8
  Pair 7: 13 21

  Points entered:
  1: 0, 1
  2: 2, 3
  3: 3, 4
  4: 4, 5
  5: 6, 7
  6: 7, 8
  7: 13, 21

  Points read back in from file:
  1: 0, 1
  2: 2, 3
  3: 3, 4
  4: 4, 5
  5: 6, 7
  6: 7, 8
  7: 13, 21
.R
.RE

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab15a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab15a
.R








