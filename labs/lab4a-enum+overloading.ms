.ds CH Lab #4a
.TL
Lab #4a: Enumerations and overloading
.so cover-page.ms


.bp
.NH
Enumerations: 60 minutes \fImaximum\fR
.time_box
.QP

Consider the following program:
.CW
  #include <iostream>

  enum Direction { north, south, east, west };

  static void show_direction(const int direction) {
    std::cout << "Direction: " << direction << "\\n";
  }

  int main() {
    Direction dir = west;

    show_direction(dir);

    int num = dir;
    show_direction(num);

    for (int i = north; i < 8; i++) {
      show_direction(i);
    }
    return 0;
  }
.R


.nr step 1 1
.IP \n[step].
Does this program compile without error?  Without warning?  Without actually compiling, list them.





.IP \n+[step].
What problems \fIdoes\fR this program have?


.bp
Transform this program like so:
.RS
.nr step 1 1
.IP \n[step].
Remove the lines that use the variable \fCnum\fR and change the enum into an enum class.
.IP \n+[step].
Create a header file \fCDirection.h\fR to contain our Direction definitions.
.IP \n+[step].
In \fCDirection.h\fR, create a \fCmap\fR that associates each direction in the enum with a specific string.
.br
The declaration should start like this:

.CW
  static std::map<Direction, const std::string> DirectionNames 
.R

.IP \n+[step].
In \fCDirection.h\fR, create a constant \fCstd::array\fR named \fCdirections\fR that stores each Direction.
.IP \n+[step].
In main, change the signature of \fCshow_direction\fR to take the \fCenum Direction\fR as a parameter.
.IP \n+[step].
Change the \fCcout\fR to use the \fCDirectionNames map\fR to stream the name of the direction to \fCstdout\fR.
.IP \n+[step].
In main, loop on the \fCdirections\fR array and call \fCshow_direction\fR on each iteration.
.IP \n+[step].
Compile the program and run it.
.RE

.bp
.NH
A rational number class: 60 minutes \fImaximum\fR
.time_box
.QP
Design and implement a number class \fCRational\fR.
A rational number is a number that can be expressed as a fraction of two integers,
for example 
.EQ
1 over 1 , 4 over 8 , or x over y
.EN

Create operators for assignment, addition, subtraction, multiplication, division, and equality.
Also provide a function to_double() that converts a \fCRational\fR into a \fCdouble\fR primitive.

The following relationships may prove useful:

\fBAddition\fR
.EQ
a over b + c over d = {ad + bc} over bd
.EN

\fBSubtraction\fR
.EQ
a over b - c over d = {ad - bc} over bd
.EN


\fBMultiplication\fR
.EQ
a over b times c over d = ac over bd
.EN


\fBDivision\fR
.EQ
a over b \[u00F7] c over d = ad over bc
.EN

\fBEquality\fR
.EQ
a over b = c over d roman {" if and only if, "} ad = bc
.EN

Answer the following:
.RS
.nr step 1 1
.IP \n[step].
How is the \fCRational\fR class better than the primitive \fCdouble\fR? Worse?






.IP \n+[step].
Give an example where the \fCRational\fR class gives a mathematically better result 
over using the primitive \fCdouble\fR.
.RE





.bp
.so reflection.ms

