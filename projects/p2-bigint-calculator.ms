.ds LH Big Integer Calculator Project
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
\*[LH]
.LP
The goal of this project is to extend the simple 32 bit integer precision calculator
from project 1.
A fundamental limitation of the first project was the size of the 
numbers passed into the program.
Numeric size limits also required the program to carefully check and ensure
no overflow happened.
What if we could remove this constraint?

The primary goal of this project is to replace the arithmetic done using 
fundamental types with integers of effectively unlimitied size: Big Integers.
Many languages include a BigInteger class or some means to represent
integers of arbitrarily large size, but in C++,
you need to use a third party library.
For obvious reasons, using a third party library to solve this project is not allowed.

In project 2, the calculator will continue to use \fIprefix\fR notation,
but now numbers will be able to be any length.
.h1 Turn in Requirements
.LP
All projects will be graded according to the project rubric in BlackBoard.

Before uploading your project, make sure it meets all of the rubric criteria in order to get full credit.
.RS
.nr step 1 1
.IP \n[step].
Ensure the top of each source file includes your name and student ID.
.IP \n+[step].
Ensure the intent behind every program element is "crystal clear".
Add documentation where it makes sense to do so.
.IP \n+[step].
Ensure all project requirements are met and all results are correct.
.IP \n+[step].
The template for this project includes a working \fCMakefile\fR.  
Your finished project should be able to build using \fCmake\fR executed on buffy.
.IP \n+[step].
Create a zip file of all of your project files and upload to BlackBoard.
Remember to "clean" your project before submitting it - it will be much smaller.
.RE
.h1 Input and Output
.LP
The inputs to this program are exactly the same as for program 1.
The input to this program should 
.BI
read from standard input
.R 
and the output should be 
.BI
directed to standard output
.R . 
All the requirements from project 1 related to standard input and output apply.
.bp
.h1 Project Requirements
.LP
In order to receive full credit, your project must satisfy \fBall\fR
of the following requirements:
.RS
.nr step 0 1
.IP \n+[step].
All of the project requirements from project #1 also apply to this project.
.IP \n+[step].
The Big Integer values must be defined by and stored in a new data type: a \*[c]BigInt\*[r] class.
.IP \n+[step].
Process input strings containing equations containing values too large to fit
in any standard fundamental data type.
Each equation should reside in a single line of input.
.IP \n+[step].
Process equations using a one of the supported symbols (addition, multiplication, exponentiation)
The result should be a \*[c]BigInt\*[r] than can be sent to any output stream.
.IP \n+[step].
In the \*[c]BigInt\*[r] class, create appropriate operator overloads to allow callers to 
interact with \*[c]BigInt\*[r]s the same way they would with a fundamental type.

It is acceptable to either overload \*[c]operator^\*[r] for exponentiation, 
or to use a function \fCpow()\fR, in the style of the standard math libraries.
.IP \n+[step].
Operator overloads should follow best practices regarding member and non-member overloads.
.IP \n+[step].
\*[c]BigInt\*[r] digits must be stored in an STL container,
one digit per element.
.IP \n+[step].
The input file should now be able to contain arbitrary spaces anywhere 
in the file without changing the results.

It should also skip 'comment lines'.
Lines where the first non-whitespace character is '#' should be treated as a comment and ignored.
.IP \n+[step].
No third party libraries may be used to manage the \*[c]BigInt\*[r] type.
That is, you can't simply download an existing Big Integer class and wrap a new class around it.

However, you may use the STL anywhere you need to manage or process data in your program.
.RE

.LP
Integers \fBmust\fR be represented in your program by an STL container of digits, 
one digit per element. 
Each digit may be represented as any integral data type, as you prefer. 
Consider an unsigned type.
You may find that operations are easier to perform if the list of digits is stored backwards 
(low order to high order).
It depends largely on how you visualize this problem in your own mind.
There is no "best way" to do this.
The internal representation is private to the \*[c]BigInt\*[r] class and is completely up to you.
Otherwise, keep in mind that you'll need to do all your arithmetic in
"reverse order" in your list.
That is, the least significant digit of your number is going to be stored
at position \fClist.size() - 1\fR of your list. 

Addition is easily performed by starting with the low order digits of the two integers
and adding successive of digits as you move to the high order digits. 
Don't forget to carry when the sum of two digits is 10 or greater!

Multiplication is performed just as you probably learned in elementary school 
when you multiplied two multi-digit numbers. 
The low order digit of the second operand is multiplied against 
the entire first operand. 
Then the next digit of the second operand is multiplied against the first number, 
with a '0' placed at the end. 
This partial result is added to the partial result obtained from 
multiplying the previous digit. 
The process of multiplying by the next digit and adding to the previous partial 
result is repeated until the full multiplication has been completed.

Exponentiation is performed by multiplying the first operand to itself the 
appropriate number of times, decrementing the exponent once each time until done. 
In order to simplify implementation, you may safely assume that the exponent will be 
small enough to fit in a regular \*[c]int\*[r] variable. 
You should write a routine to convert a "big int" representation of a number from 
its list representation to an integer variable, and use this to convert the 
top operand on the stack when the exponentiation operator is encountered. 
Recall that exponents of 0 or 1 require special handling.
.h1 Example usage
.LP
This section provides expected outputs from your finished program.
The character \fC#\fR represents the command prompt.
It may look different on your computer.
.h2 Using incorrect command line arguments
.LP
The usage statement should be unchanged from project 1.
.CW
  # ~/bin/calc -x
  Usage: ~/bin/calc [-h] [-v] 
  #
.R
.h2 Invoke help
.LP
The help text should be unchanged from project 1.
.h2 Using an input file
.LP
With the verbose output option set:
.CW 
  # ./calc -v < input.txt 
  + 1 2 3 4 5 6 7 8 9 10 = 55
  ^ 2 3 = 8
  * 123456789 98765432101234567890 = 12193263111415942687501905210
  ^ 2 999 = 5357543035931336604742125245300009052807024058527\
  66803721875194185175525562468061246599189407847929063797336\
  45877657341259357264284615702179922887873492874019672838874\
  12115492710537302531185570938977091076523237491790970633699\
  38377958277197303853145728559823884327108383021491582631219\
  3418602834034688

  done.
  #
.R
.h2 Interactive mode
.LP
.CW
  # ./calc
  + 2 2
  4
  ^ 123456 78
  137388925493137390009081889016910301216602862010919703171716\
  543035723456273062655421627501974990583077639148519606686722\
  900855951664630026487911528639779289526626968646170445270525\
  850790127624608225114389347386598181009951065608553214136657\
  570305172116860789647835038123493081914805310637523928921415\
  371145021637363247702213135800414946635846132897380437169121\
  99569844668752266803952136341805858816
  quit
  #
.R
.h2 Output when bad inputs received
.LP
Under no circumstances should your program throw an unhandled exception, abort, or crash.
A new situation you now need to handle is having too few operators or operands.

The only bad input you shouldn't have to worry about anymore is numeric overflow.

