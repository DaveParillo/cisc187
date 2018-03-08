.ds CH Lab #6b: Lambda Expressions
.so headings.ms
.TL
\*[CH]
.NH
Cipher: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
The goal of this lab is to replace all of the functions in the week 6 cipher example
with lambda expressions.

.RS
.nr step 0 1
.IP \n+[step].
Copy the \*[c]12-cipher.cpp\*[r] file from the week 6 examples directory
into a file lab6b.cpp:
.br
.CW
cp ~dparillo/public_html/cisc187/examples/week06/12-cipher.cpp lab6b.cpp
.R

.IP \n+[step].
Delete the line containing\*[c]using transform\*[r].
We won't be using this alias.
.IP \n+[step].
Modify the signature of \*[c]render_text\*[r] to use \*[c]std::function\*[r].
When complete, the function should still accept functions of the same type:
take one \*[c]const char\*[r] parameter and return a  \*[c]char\*[r].
.IP \n+[step].
Move the \*[c]rot13\*[r] and \*[c]rot47\*[r] functions to lambda expressions defined in main.
.IP \n+[step].
Run your program an ensure it enciphers / deciphers text exactly as before modification.
.RE

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab6b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab6b
.R

