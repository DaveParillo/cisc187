.ds CH Lab #2b: Using std::vector
.so headings.ms
.TL
\*[CH]
.bp
.NH
Using std::vector: 100 points, 90 minutes \fImaximum\fR
.time_box
The purpose of this exercise is to practice working with \*[c]std::vector\*[r].

We will be writing a program that takes values from the command line,
and performs a series of operations.

Use this case as a starting point:
.CW
    #include <unistd.h>

    int main(int argc, char** argv) {
      vector<int> data;

      enum class program_mode {
        add, mean, odd, reverse
      };
    
      int c;
      auto mode = program_mode::add;
      while ((c = getopt (argc, argv, "amor")) != -1) {
        switch (c) {
          case 'a':
            mode = program_mode::add;
            break;
          case 'm':
            mode = program_mode::mean;
            break;
          case 'o':
            mode = program_mode::odd;
            break;
          case 'r':
            mode = program_mode::reverse;
            break;
          default:
            // do nothing
            break;
        }
      }

      // read all remaining arguments into an int vector

      return 0;
    }
.R

Expect the program to be invoked as follows:
.CW
    ./vectors -a 1 2 3 4
.R
The first argument is an instruction telling the program what operation to perform
on the remaining arguments, which will all be integers.


.RS
.nr step 0 1
.IP \n+[step].
Create a \*[c]std::vector\*[r] object and assign each element of \fCargv\fR to it.

.IP \n+[step].
Compute the \fBsum\fR of all of the numbers in the \*[c]vector\*[r].

Given:
.CW
    ./vectors -a 1 2 3 4
.R
The program should output:
.CW
    10
.R

.IP \n+[step].
Compute the \fBmean\fR of all of the numbers in the \*[c]vector\*[r].

Given:
.CW
    ./vectors -m 1 2 3 4
.R
The program should output:
.CW
    10
.R

.IP \n+[step].
Print only the \fBodd\fR numbers in the \*[c]vector\*[r].

Given:
.CW
    ./vectors -o 1 2 3 4
.R
The program should output:
.CW
    1 3
.R

.IP \n+[step].
Print the  \*[c]vector\*[r] with its elements in \fBreverse order\fR.

Given:
.CW
    ./vectors -r 1 2 3 4
.R
The program should output:
.CW
    4 3 2 1
.R

.IP \n+[step].
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab2b
.R

The script will evaluate your progress and test your work.

You should continue working on it until all tests pass (\m[green]OK\m[]).
.IP \n+[step].
Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab2b
.R
.RE

.bp
.so reflection2.ms

