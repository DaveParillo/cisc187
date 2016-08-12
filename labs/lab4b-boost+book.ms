.ds CH Lab #4b
.TL
Lab #4b: \fCBoost::Test\fR and Book software lab
.so cover-page.ms


.bp
.NH
Using \fCBoost::Test\fB: 20 minutes \fImaximum\fR
.time_box
.QP
Verify you can login to buffy and run a Boost unit test.

Boost is installed on the buffy server.

.RS
.nr step 1 1
.IP \n[step].
Download the files that are provided as part of this lab.
.IP \n+[step].
Copy them to buffy, if you didn't download them directly there and cd to the
\fClab4b-files\fR directory.
.IP \n+[step].
Type \fCmake hello\fR.
You should see the following:
.RS
.CW
 [ some compilation output ]
 ./hello
  Running 1 test case...
  test_hello.cpp:7: error: in "hello": check "hello" == "howdy" has failed [hello != howdy]

  *** 1 failure is detected in the test module "HelloWorld"
  make: *** [hello] Error 201
.R
.RE
.IP \n+[step].
Edit \fCtest_hello.cpp\fR and get this test to pass.
.IP \n+[step].
Type \fCmake hello\fR. The test should pass.
.RE
.LP

The remainder of this lab will be spent getting the other tests provided to pass.

.NH
The \fCDate\fB class: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise recreates the \fCDate\fR class from the textbook with some modifications.

Create the \fCDate\fR using the code in section 9.4 as a guide.  
.br
You may type this code in as presented in the textbook, with the following modifications:
.RS
.nr step 1 1
.IP \n[step].
Use all CAPS for the enum members of Month
.IP \n+[step].
Place the date class in the \fImesa\fR namespace and save the interface in \fCDate.h\fR.
.IP \n+[step].
Omit the functions to increment a day, month or year.
.IP \n+[step].
Implement a method to evaluate wheter a prodided year is a leap year.
.IP \n+[step].
Implement a method to convert an \fCint\fR primitive into a \fCmesa::Month\fR.
.RE


When complete, verify the \fCDate\fR class functions as expected by running the provided
Boost unit tests.


.bp
.NH
The \fCBook\fB class: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise creates a \fCBook\fR class that might exist as part of a software
program for a library.
.RS
.nr step 1 1
.IP \n[step].
Create the \fCBook\fR class.  

Include members for ISBN, title, author, and copyright date.
Use the Date class from the previous section for the copyright date.
Store a value to indicate if the book is checked out or not.
Create functions to return each of the stored values.
Create functions for checking books in and out.
Ensure member values are valid.
For the ISBN, a string of 10 digits will suffice.

.IP \n+[step].
Add operators to the \fCBook\fR class.  

Have the \fC==\fR and \fC!=\fR operators compare the ISBN's for two books.
Have the \fC<<\fR operator print the title, author and ISBN on separate lines.

.IP \n+[step].
Create an enumerated type for the \fCBook\fR class called \fCGenre\fR.
The types should be:
.RS
.IP \(bu
fiction
.IP \(bu
nonfiction
.IP \(bu
periodical
.IP \(bu
biography
.IP \(bu
children
.RE  

.IP \n+[step].
Give each \fCBook\fR a \fCGenre\fR and make appropriate changes to the \fCBook\fR
constructor and member functions.


.RE

When complete, verify the \fCBook\fR class functions as expected by running the provided
Boost unit tests.


.bp
.so reflection.ms



