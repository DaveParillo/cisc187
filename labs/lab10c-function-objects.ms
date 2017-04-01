.ds CH Lab #10c: Function objects
.so headings.ms
.TL
\*[CH]
.NH
ROT13 cipher: 60 minutes \fImaximum\fR
.time_box
.QP

The ROT13 cipher is a weak encryption cipher that works by adding 13 to the value of each
letter in a string.
It has a rich history going back to Julius Ceaser and 
is sometimes called Ceaser's cipher for this reason.
See https://en.wikipedia.org/wiki/Caesar_cipher

Given a function:
.CW
  void rot13_func(char& c) {
    if (not std::isalpha(c)) return;

    // will rotate upper or lower case
    // need to know where the alphabet 'starts'
    char const start = std::islower(c) ? 'a' : 'A';
    c = (c - start + 13) % 26 + start;
  }
.R

Write a program that accepts a string from standard input,
calls \fCrot13_func\fR on each character
and displays the encrypted text.

Once complete, add a functor to do the same encryption.
Change the behavior so that \*[c]operator()\*[r] in the functor
does not modify the \*[c]char\*[r] parameter.

Use the functor twice.
Encrypt the input string first using a \*[c]for\*[r] loop,
then encrypt the input string again using the \*[c]for_each\*[r] algorithm.

.bp
.NH
Function vs Functor times: 60 minutes \fImaximum\fR
.time_box
.QP
Make a new program using the Lab 5b \*[c]vector\*[r] vs \*[c]list\*[r] 
timing study as a starting point.

Modify it so that instead of testing 
\*[c]vector\*[r] vs \*[c]list\*[r],
you're testing 
\fCrot13_func\fR vs your rot13 functor.

If you are copying my solution, don't worry about trying to make a single test function
that takes a function as a parameter.
Create your tests functions with the following signature:

.RS
.CW
 void test_func(const string& plaintext, int max);
 void test_functor(const string& plaintext, int max);
.R
.RE

In each test function, setup \fCchrono\fR and 
then run your test \fCmax\fR number of times.

When you are ready to compile, set the compiler optimization level to O3.
.br
On buffy:

.RS
.CW
 c++ -std=c++11 times.cpp -O3 -o times
.R
.RE

