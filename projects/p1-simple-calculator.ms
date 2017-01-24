.ds LH Simple Integer Calculator Project
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
\*[LH]
.LP
The goal of this project is to create a simple 32 bit integer precision calculator.
In subsequent labs, the capabilities of this program will be expanded,
but for now, it will be limited to the fundamental integral types
and the operators addition, multiplication and exponentiation.
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
The input to this program should 
.BI
read from standard input
.R 
and the output should be 
.BI
directed to standard output
.R . 
Do \fBNOT\fR open a file and read lines from a file.
The name of the program should be 'calc'.

The program can be invoked from the command-line as:
.CW
  calc
.R

which runs the program in 'interactive mode',
or alternatively as:
 
.CW
  calc < input-file > output-file
.R

Where:
.RS
\fCcalc\fR is the program name
.br
\fCinput-file\fR is the name of a file containing program commands
.br
\fCoutput-file\fR is the name of a file containing program results
.br
The symbols \fC<\fR and \fC>\fR are input redirection operators
.RS
\fC<\fR redirects the contents of \fCinput-file\fR to the standard input channel of \fCcalc\fR
.br
\fC>\fR redirects the standard output channel of \fCcalc\fR to \fCoutput-file\fR.
\fCoutput-file\fR is overwritten if it exists, or created if it doesn't exist.
.RE
.RE

The program should also accept invocation from the command-line as:
.CW
  echo "some inputs to the calculator" | calc
.R

or on Windows as:
.CW
  type "some inputs to the calculator" | calc
.R

For example:
.CW
  echo "+ 2 2" | calc
.R

"Read from standard input" does not mean "prompt the user for input".
It means read directly from the standard input stream \*[c]std::cin\*[r].
The input stream could be either a file or input from a pipe,
your program must not assume one or the other.

Standard output is simply \*[c]std::cout\*[r], 
which you can continue to work with in the normal way.

The input stream will consist of a series of arithmetic expressions. 
To simplify the project, all expressions will be in \fIprefix\fR notation.  
In prefix notation, the operator comes before the operands. 
For example, you normally see multiplication written \fC(a * b)\fR - 
this is referred to as \fIinfix\fR notation. 
In prefix, this expression would appear as \fC(* a b)\fR. 
.h1 Project Requirements
.LP
In order to receive full credit, your project must satisfy \fBall\fR
of the following requirements:
.RS
.nr step 0 1
.IP \n+[step].
Correctly add, multiply and raise to a power unsigned integers 
using the symbols '+', '*', and '^', respectively.
.IP \n+[step].
Process inputs from \fCstdin\fR.  Do not prompt for input from users.
.IP \n+[step].
Process two command line arguments: -h to display help and -v to display verbose output.
.IP \n+[step].
The program detects numeric overflow and reports overflow conditions
.IP \n+[step].
Program definitions and declarations must be kept in separate source files
.IP \n+[step].
Program functions should be small and each function should perform
exactly one task.
.IP \n+[step].
Project rubric requirements for correctness, clarity, design, and coding are met or exceeded.
.RE
.h2 A note about implementation
.LP
For this first project, the calculator is simplified even further
in that each equation needs to support only one operator.
That is, for each equation,
first a single operator is read in, then this operator is applied to all
the operands read in afterwards.
This makes it easy to work with all the operands in a \*[c]std::vector\*[r].

You may assume that all values will be stored in an \*[c]long\*[r], 
but it is up to you to handle numeric overflow.
For now, it is acceptable to discard strings from standard input that are 
too large to fit in a standard \*[c]long\*[r].
However, two valid \*[c]long\*[r]s may be added or multiplied and the result may be 
too large to fit in a standard \*[c]long\*[r].
This is the type of error you need to handle now.

The implementation is up to you.
Anything that satisfies the project requirements will receive full credit.
However, the \fInext\fR project expands on the this one,
so the more attention you pay to organizing your code now,
the better off you will be for the rest of the term.
.bp
.h1 Example usage
.LP
This section provides expected outputs from your finished program.
The character \fC#\fR represents the command prompt.
It may look different on your computer.

In the following examples, assume the file \fCinput.txt\fR contains:
.CW
  + 2 3
  + 1 2 3 4 5 6 7 8 9 10
  * 2 3
  ^ 2 3
.R
.h2 Using incorrect command line arguments
.LP
.CW
  # ~/bin/calc -x
  Usage: ~/bin/calc [-h] [-v] 
  #
.R
.h2 Invoke help
.LP
.CW
  # ~/bin/calc -h
  Usage: ~/bin/calc [-h] [-v] 
  to run the program interactively. To run using standard input:
    echo 'equation' | ./calc
  where 'equation' is a single prefix notation equation, i.e. '+ 2 2'
  or:
    ~/bin/calc < input_file.txt
  where 'input_file.txt' contains prefix notation equations, 
  one per line

  Options:
    -h   Show this text
    -v   Set a verbose output flag.  Default = false.

  Running with no input from standard in enters 'interactive mode'.
  Equations can be entered one per line.
  The program runs until 'quit' is the first word on a line or 
  EOF is reached.
  #
.R
.h2 Using an input file
.LP
.CW
  # ./calc < input.txt 
  5
  55
  6
  8
  #
.R

same input file with verbose output enabled:

.CW 
  # ./calc -v < input.txt 
  + 2 3 = 5
  + 1 2 3 4 5 6 7 8 9 10 = 55
  * 2 3 = 6
  ^ 2 3 = 8
  #
.R
.h2 Interactive mode
.LP
.CW
  # ./calc
  + 2 3
  5
  * 2 3
  6
  ^ 2 3
  8
  q
  input 'q' unrecognized.  skipping.
  0
  quit
  #
.R
.h2 Output when bad inputs received
.LP
Under no circumstances should your program throw an unhandled exception, abort, or crash.
The following exmples show what handling bad inputs might look like on a computer with 64 bit longs.
On buffy, substitute \fC9223372036854775807\fR with \fC2147483647\fR.

Given inputs:
.CW
  + 1        9223372036854775807
  + 0        9223372036854775807
  + 9223372036854770000 5808
  * 9223372036854770 1000
  * 9223372036854776 1000
  + 0        9223372036854775808
  ^ 999 2
  ^ 2 999
.R

The results should be:

.CW
  # ./calc -v < input.txt
  + 1 addition failed: result is too big
  9223372036854775807 = 9223372036854775807
  + 0 9223372036854775807 = 9223372036854775807
  + 9223372036854770000 addition failed: result is too big
5808 = 9223372036854775807
  * 9223372036854770 1000 = 9223372036854770000
  * 9223372036854776 multiplication failed: result is too big
  1000 = 9223372036854775807
  + Unable to convert 9223372036854775808 to a number.
  values must be less than  9223372036854775807.
  ^ 999 2 = 998001
  ^ 2 exponentiation failed: result is too big
  999 = 9223372036854775807
.R

