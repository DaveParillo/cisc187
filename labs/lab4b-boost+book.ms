.ds CH Lab #4b
.TL
Lab #4b: 
.code Boost::Test
.B
and Book software lab
.so cover-page.ms


.bp
.NH
Using \*[c]Boost::Test\m[]\fB: 20 minutes \fImaximum\fR
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
.CW
 [ some compilation output ]
 ./hello
  Running 1 test case...
  test_hello.cpp:7: error: in "hello": 
    check "hello" == "howdy" has failed [hello != howdy]

  *** 1 failure is detected in the test module "HelloWorld"
  make: *** [hello] Error 201
.R
.IP \n+[step].
Edit \*[c]test_hello.cpp\*[r] and get this test to pass.
.IP \n+[step].
Type \fCmake hello\fR. The test should pass.
.RE
.LP

The remainder of this lab will be spent getting the other tests provided to pass.

.NH
The 
.code Date
.B
class: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise recreates the \*[c]Date\*[r] class from the textbook with some modifications.

Create the \*[c]Date\*[r] using the code in \*[sect]9.4 as a guide.  
.br
You may type this code in as presented in the textbook, with the following modifications:
.RS
.nr step 1 1
.IP \n[step].
Use all CAPS for the enum members of Month
.IP \n+[step].
Place the date class in the \*[c]mesa\*[r] namespace and save the interface in \*[c]Date.h\*[r].
.IP \n+[step].
Omit the functions to increment a day, month or year.
.IP \n+[step].
Implement a method to evaluate wheter a prodided year is a leap year.
.IP \n+[step].
Implement a method to convert an \*[c]int\*[r] primitive into a \*[c]mesa::Month\*[r].
.RE


When complete, verify the \*[c]Date\*[r] class functions as expected by running the provided
Boost unit tests.


.bp
.NH
The 
.code Book
.B
class: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise creates a \*[c]Book\*[r] class that might exist as part of a software
program for a library.
.RS
.nr step 1 1
.IP \n[step].
Create the \*[c]Book\*[r] class.  

Include members for ISBN, title, author, and copyright date.
Use the Date class from the previous section for the copyright date.
Store a value to indicate if the book is checked out or not.
Create functions to return each of the stored values.
Create functions for checking books in and out.
Ensure member values are valid.
For the ISBN, a string of 10 digits will suffice.

.IP \n+[step].
Add operators to the \*[c]Book\*[r] class.  

Have the \*[c]==\*[r] and \*[c]!=\*[r] operators compare the ISBN's for two books.
Have the \*[c]<<\*[r] operator print the title, author and ISBN on separate lines.

.IP \n+[step].
Create an enumerated type for the \*[c]Book\*[r] class called \*[c]Genre\*[r].
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
Give each \*[c]Book\*[r] a \*[c]Genre\*[r] and make appropriate changes to the \*[c]Book\*[r]
constructor and member functions.


.RE

When complete, verify the \*[c]Book\*[r] class functions as expected by running the provided
Boost unit tests.


.bp
.so reflection.ms



