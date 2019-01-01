.ds CH Lab #2a: Using std::string
.so headings.ms
.TL
\*[CH]
.SH
Using std::string: 4 points, 90 minutes \fImaximum\fR
.LP
The purpose of this exercise is to practice working with \*[c]std::string\*[r].

We will be writing functions that take a string parameter and either
modify it in some way, or return it untouched.

One goal of this lab is to minimize using loops.
In most places where looping over characters one at a time could be done,
the \*[c]std::string\*[r] class provides a function that replaces the loop.

In your first semester, you leanred how to write basic conditional and looping
statements.
While these basic constructs are important, most of this course focuses on
using data structures to avoid writing too many loops.

Do not hesitate to review the string API at:
.CW
  https://en.cppreference.com/w/cpp/string/basic_string
.R

Keep your functions simple.

There is no need to worry about leading or trailing spaces for any of these functions.

\fBSteps\fR
.RS
.nr step 0 1
.IP \n+[step].
Create files named 
.CW
lab2a.cpp
.R
and
.CW
lab2a.h.
.R
Your function declarations will reside in the .h file.
Your function implementations will reside in the .cpp file.

.IP \n+[step].
Create a function with the following signature:
.CW
  std::string sentence_case(std::string);
.R

Implement \fCsentence_case\fR so that if the last character is a period (.),
then the first letter is changed to upper case.

If the last character is \fBnot\fR a period, then return the string unchanged.

.IP \n+[step].
Create a function with the following signature:
.CW
  std::string phone_format(std::string);
.R

Implement \fCphone_format\fR so that 
if the string is exactly 10 characters and all are digits,
then assume it is a phone number.
Transform into a formatted string:
.CW
    (ddd) ddd-dddd
.R

If the string fails the phone number test, then return the string:
.CW
   Not a phone number.
.R
.bp
.IP \n+[step].
Create a function with the following signature:
.CW
  std::string name_format(std::string);
.R

Implement \fCname_format\fR so that 
if the string is exactly 2 words separated by a space,
then assume it is a name, \fCfirstname lastname\fR.
Transform the string to:
.CW
    Lastname, F.
.R

where 'F' is the first letter of the first name and return it.
.RE

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab2a
.R

The script will evaluate your progress and test your work.

You should continue working on it until all tests pass (\m[green]OK\m[]).

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab2a
.R

