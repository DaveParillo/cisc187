.ds CH Lab #6b: Lambda Expressions
.so headings.ms
.TL
\*[CH]
.SH
Cipher: 4 points, 90 minutes \fImaximum\fR
.LP
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
Modify the signature of \*[c]render_text\*[r] replacing transform with an equivalent \*[c]std::function\*[r].
.IP \n+[step].
Rewite the \*[c]rot13\*[r] and \*[c]rot47\*[r] functions as lambda expressions.

Keep in mind these function will not automatically deduce the correct return type,
so your lambdas must explicitly define the return type.
.IP \n+[step].
Run your program an ensure it enciphers / deciphers text exactly as before modification.

Run as:
.CW
  echo "Hello, World!" | ./lab6b
.R
.br
or
.CW
  echo "Hello, World!" | ./lab6b -f
.R
.br
for example.

.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab6b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab6b
.R

