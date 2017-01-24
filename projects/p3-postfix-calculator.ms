.ds LH Postfix Integer Calculator Project
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
\*[LH]
.LP
The goal of this project is to extend the functinional calculator
from project 2.
The previous project still used a simplified \fIprefix\fR notation that only
processed 1 operation at a time.
In that calculator, 
first an operation was read in, 
then that operation was applied to all the numbers read in after.
While it is possible to construct a \fIprefix\fR notation calculator,
changing our calculator to use \fIpostfix\fR notation simplifies things a bit.

In this project, the calculator will use \fIpostfix\fR notation.
It will also transition from a mostly functional program to using
C++ objects working together using a \fIdesign pattern\fR.
It will use the \fIChain of Responsibility\fR pattern 
to abstract away the actual operations performed from the calculator class.
The calculator class is transformed into a simple driver with no knowledge about
the actual calculations performed.
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
Your finished project should be able to build using \fCmake\fR executed on buffy.
.IP \n+[step].
Create a zip file of all of your project files and upload to BlackBoard.
Remember to "clean" your project before submitting it - it will be much smaller.
.RE
.h1 Input and Output
.LP
The inputs to this program are exactly the same as for program 1,
except for the fact that input equations must use postfix notation.
The input to this program should 
.BI
read from standard input
.R 
and the output should be 
.BI
directed to standard output
.R . 
All the requirements from previous projects related to standard input and output apply.

The input stream will consist of a series of arithmetic expressions. 
To simplify the project, all expressions will be in \fIpostfix\fR notation.  
In postfix notation, the operands come before the operator. 
For example, you normally see multiplication written \fC(a * b)\fR - 
this is referred to as \fIinfix\fR notation. 
In postfix, this expression would appear as \fC(a b *)\fR. 
For expressions with more than one operator, 
each time an operator is encountered, 
it operates on the two immediately preceding sub-expressions. 
For example, \fC(a+b*c)\fR in "normal" notation would be \fC(a b c * +)\fR in postfix. 
This means that b and c are multiplied, 
then the results of the multiplication are added to a.
In postfix, there is no operator precedence; 
operators are evaluated left to right. 
Thus, the expression \fC((a + b) * c)\fR is written \fCa b + c *\fR in postfix.  
Postfix also eliminates the need for parentheses.
.bp
.h1 Project Requirements
.LP
In order to receive full credit, your project must satisfy \fBall\fR
of the following requirements:
.RS
.nr step 0 1
.IP \n+[step].
All of the project requirements from projects #1 and #2 also apply to this project,
except as listed below.
.IP \n+[step].
Process input strings containing equations in postfix notation.
Each equation should reside in a single line of input.
.IP \n+[step].
Process equations using a mix of symbols (addition, multiplication, exponentiation)
containing numbers of arbitrary length
.IP \n+[step].
Encapsulate each operation in a class that inherits from \fCCommand\fR.
Also encapsulate the code to convert strings to numbers in the same way - by extending \fCCommand\fR.

The only logic related to performing arithmetic should be confined to classes that extend \fCCommand\fR.
.IP \n+[step].
Use the provided class to abstract the computation logic.
\s-2
.CW
  namespace mesa
  { \m[green]
    // A command interface for arithmetic operations.\m[]
    class Command {
      public:
        virtual ~Command(){} \m[green]
        // Execute a command.
        // @param operands a stack of unsigned integers.
        // @param token to be evaluated and used during execution.
        //    If the token is not 'appropriate' for this object, 
        //    then do nothing.
        // @return true if this command was executed.\m[]
        virtual bool execute(std::stack<mesa::BigInt>& operands, 
                             const std::string& token) const = 0;
    };
  }
.R
\s+2
.IP \n+[step].
Use a \*[c]std::stack\*[r] to manage calculator operands.
Do not attempt to store operators on the stack.
.RE

.LP
.h2 The Chain of Responsibility Pattern
.LP
The \fIChain of Responsibility design pattern\fR allows an object to execute 
a command without knowing what object will receive and handle it.
Each member in the chain is a link in a linked list data structure.
Objects in the chain are followed until one that can handle the command to be executed,
but for this lab, all of the objects that implement the \fCCommand\fR interface
can simply be stored in a \*[c]std::vector\*[r] and iterated over.

All clients of Command objects treat each object as a 'black box' by simply invoking 
the base object virtual \fCexecute()\fR function.

Since the calculator has no idea which command will operate on a token, each must be tried.
For example, given the input \fC"2 2 +"\fR,
each part of this string is first split into individual tokens: "2", "2", and "+".
These are stored in a \*[c]std::vector\*[r], which then must be evaluated.

So now we have two \*[c]vector\*[r]'s: a \*[c]vector\*[r] of \fCCommand\fR objects
and a \*[c]vector\*[r] of \*[c]string\*[r]s.
Each \*[c]string\*[r] will be processed by exactly one \fCCommand\fR object.
Create an outer loop to loop on each \*[c]string\*[r].
Create an inner loop to loop on each \fCCommand\fR object.
Call the \fCexecute()\fR function of each \fCCommand\fR object 
and pass in the current \*[c]string\*[r] token as a parameter.
If the current \fCCommand\fR object knows how to handle the token provided,
then perform it's action.
If the token is an operand, then it is pushed onto the stack provided as a parameter.
If the token is an operator, then two operands are popped off the stack, 
the appropriate operation is performed, 
and the result is pushed back onto the stack.
Once \fCexecute\fR returns \*[c]true\*[r], 
processing should continue to the next token.
.h3 References
.RS
.nr step 0 1
.IP \n+[step].
http://www.oodesign.com/chain-of-responsibility-pattern.html
.IP \n+[step].
https://sourcemaking.com/design_patterns/chain_of_responsibility
.IP \n+[step].
http://www.oodesign.com/command-pattern.html
.RE
.h1 Example usage
.LP
This section provides expected outputs from your finished program.
The character \fC#\fR represents the command prompt.
It may look different on your computer.
.h2 Invoke help
.LP
This should only require minor modification to account for postfix notation.
The help text should be mostly unchanged from project 1.
.h2 Using an input file
.LP
With the verbose output option set:
.CW 
  # ./calc -v < input.txt 
  000000056669777     99999911111 + 352324012 + 03 ^      555557778 * = 562400792227677956625810678708149922000000
  99999999 990001 * 01119111 55565    33333 + * +  88888888              + = 99099674628565
  123456789 1111111111 * 111119 2111111 9111111 * + *  1 ^ = 2638486500477638652325851269760
  9 1 +     5 *     00000000 + = 50
  999999999  0 * = 0
  9 0 ^ = 1
  #
.R
.h2 Interactive mode
.LP
.CW
  # ./calc
  000000056669777     99999911111 + 352324012 + 03 ^      555557778 *
  562400792227677956625810678708149922000000
  1 2 + 3 * 4 ^
  6561
  quit
  #
.R
.h2 Output when bad inputs received
.LP
Under no circumstances should your program throw an unhandled exception, abort, or crash.
A new situation you now need to handle is having too few operators or operands.

The following exmples show what handling bad inputs might look like when runnign interactively.

.CW
  ./calc
  2 +
  Invalid argument: Not enough operands to execute add operation.
  2

  1 2 + + + 
  Invalid argument: Not enough operands to execute add operation.
  Invalid argument: Not enough operands to execute add operation.
  3

  1 2 3 * * * 
  Invalid argument: Not enough operands to execute multiply operation.
  6

  1 2 3 4 * ^
  Error: could not produce a result.
    Too few operators in problem.
    Operands still on problem stack:
    1: 4096
    2: 1
  #
.R

