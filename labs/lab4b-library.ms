.ds CH Lab #3a
.TL
Lab #4b: Library software lab
.so cover-page.ms



.bp
.NH
The \fCBook\fB class: 90 minutes \fImaximum\fR
.time_box
.QP
This exercise creates a \fCBook\fR class and some supporting classes as part of a software
program for a library.
.RS
.nr step 1 1
.IP \n[step].
Create the \fCBook\fR class.  

Include members for ISBN, title, author, and copyright date.
Store a value to indicate if the book is checked out or not.
Create functions to return each of the stored values.
Create functions for checking books in and out.
Ensure member values are valid.
For the ISBN, a string of the form 'n-n-n-x' where \fCn\fR is an int and 
\fCx\fR is a single digit or letter.

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


.IP \n+[step].
Add a \fCPatron\fR class for the library.
The class will have the patron name, library card number, and any library fees due.

Create accessors for these fields and a function to set the fee.

Create a helper function that returns a \fCbool\fR depending on whether or not
the user owes a fee.
.RE

.bp
.NH
The \fCLibray\fB class: 60 minutes \fImaximum\fR
.time_box
.QP
Create a \fCLibrary\fR class.
Include vectors of \fCBook\fRs and \fCPatron\fRs.
Include a \fCstruct\fR called \fCTransaction\fR.
A \fCTransaction\fR should include a \fCBook\fR, a \fCPatron\fR, and a \fCDate\fR.

Create functions to add books to the library, add patrons to the library,
and check out books.
Whenever a user checks out a book, have the library ensure that both the user
and the book are in the library.
If they are not, report an error.
Then make sure the user owes no fees.
If the user does owe fees, then report that and do not allow the check out.
Otherwise, create a \fCTransaction\fR and place it in the vector of
\fCTransaction\fRs. 

Lastly, create a function that returns a vector of all the patrons who owe fees.


Create a program that uses the \fCLibrary\fR.







.bp
.so reflection.ms



