.ds title Things you should already know
.pdfinfo /Title \*[title]
.TL
.gcolor blue
\*[title]
.gcolor
.LP
.ce 1
Week 1

.SS The Basics
.IT Source files and Header files
.i1 What are the differences between them?
.i1 Why do they exist?
.i1 What are 'header guards'?
.i1 What is \*[c]#pragma once\*[r]?
.IT What happens during compilation?  Linking?
.IT How to use function main(), argc, and argv
.IT cout and the meaning of statements like:

.RS
.CW
std::cout << "Hello world!" << std::endl;
.R
.RE
.IT Different formats for code comments (\m[green]//\m[], vs. \m[green]/* ... */\m[], etc)

.SS Objects, types, and values
.IT
cin and the meaning of statements like:

.RS
.CW
  std::string  name;
  std::cin  >> name;
  std::cout << "Hello," << name << "!\\n";
.R
.RE
.IT Declaring primitives
.IT Operations and Operators
.i1 Shortcut operators (++, +=, etc)
.IT Assignment and initialization
.i1 What is the difference between these two ideas?
.i2 Can you provide a few examples?
.IT Legal identifier names
.i1 For classes, functions, and variables
.IT Structs to hold 'plain old data' (a 'pod')
.IT Arrays
.i1 Arrays of fundmental types, of \*[c]struct\*[r]s
.i2 Bounds-checking with arrays (or the lack of it!)
.bp
.IT You know what an object is
.i1 Probably have used many 
.i1 Perhaps even created a few
.IT Type safety and type conversions
.IT Widening conversions
.i1 For example: \*[c]int\*[r] to \*[c]float\*[r]
.IT Narrowing conversions
.i1 For example: \*[c]float\*[r] to \*[c]int\*[r]
.IT Implicit vs explicit type conversions
.bp
.IT File Input and output
.i1s
C-style \*[c]printf\*[r] and \*[c]scanf\*[r]
.CW
    #include <stdio.h>

    int main (void) {
      int rc = puts("Hello World");
      if (rc == EOF) {
        perror("puts()");
      }
      puts("Goodbye");
      printf("\\tcruel world!\\n");
    }
.R
.i1e
.i1 C++-style input and output file streams
.i2 Possibly also using \*[c]stringstream\*[r]s

.SS Statements and Branching
.IT You've used different primitives to get things done
.IT You're familiar with \*[c]if\*[r], \*[c]switch\*[r], \*[c]for\*[r], and \*[c]while\*[r] blocks
.IT Hopefully used \*[c]<vector>\*[r]'s of primitives
.IT Possibly the \*[c]<string>\*[r] class as well, but I'm not assuming this
.IT Used combinations of statements and branching to perform tasks like
.i1 Computing an amortization table
.i1 Computing population growth
.i1 Parsing text
.SS Fixing errors in code
.IT Compile-time errors vs. link-time errors vs. run-time errors
.IT Exceptions
.i1 You've experienced them, used try-catch, but not created your own
.i1 You know what \*[c]throw\*[r] does, even though you may not have ever used it personally
.IT Some basic experience using a debugger in whatever environment you were using before

.SS Important!
.IT If \fBany\fR of the material on the preceding slides sounds unfamiliar
.i1 Review the material in chapters 1-7 of \fIProgramming Principles\fR
.i1 Review the material from your first semester text


or


.i1 Ask me to explain it, otherwise I have to assume you already know it!


.SS What I don't expect you to know
.IT Pointers
.IT C++
.i1 Most of you have learned mostly C (probably) 
.i2 or some strange C/C++ hybrid (CHide)
.i1 The C++ you have learned is probably not C++11 or later
.i2 Probably C++98
.i1s
\fBNote:\fR C++ is actually a federation of several languages:
.PS
circlerad = 0.5

A: ellipse "C"
arrow 

boxwid = 2
boxht = .75
B: box "C" "(with classes)"
arrow 

C: ellipse "C++98" width 1
arrow
D: ellipse "C++03" width 1

arrow
E: ellipse "Modern" "C++" width 1.5 height .75
.PE
\s-4
where 'Modern' C++ is C++11 or later
\s+4
.i1e
.i1s
It is possible to write code in any of these languages
compile it with C++ and call it a "C++ program"
.i1e
.i2 This course will emphasize modern C++
.IT Operators other than +, -, *, and /.
.i1 We'll cover modulus, bit shifting, bit-wise operators and operator overloading
.bp
.IT Linux (or Unix) in general
.i1 And \fCmake\fR in particular
.i2s
All projects and any labs that require handing in source code
must be able to compile on the Mesa cislinux server, aka buffy
.i2e
.i3s
This server is accessible via \fCssh\fR outside the campus from either
.CW
 mesa-cislinux.sdmesa.sdccd.cc.ca.us
    or 
 209.129.16.61
.R
.i3e
.i3s
Inside the campus
.CW
 buffy
    or 
 buffy.ac.sdmesa.net
    or 
 10.51.1.150
.R
.i3e
.i3 All the tools you need to complete your projects are there if you don't have your own C++ toolchain
.i2s
Solutions are posted on buffy (http://209.129.16.61/~dparillo) as well
.\" .pdfhref W -A , -D http://209.129.16.61/~dparillo buffy
.i2e
.IT I'm not assuming much familiarity with any operating system
.i1 i.e. any command prompt or terminal environments
.i1 hardware beyond broad generalities
.SS A simple C++11 test
.IT If you need to verify you can compile the code used in this course
.i1s
This code from \fCexamples/week01\fR will only compile on C++11
.CW
  #include <iostream>

  int main() {
    int test[] = { 1, 2, 3, 5, 8 };  \m[green]// initializer list\m[]
    for (auto i: test) {             \m[green]// range-for loop\m[]
      std::cout << "i is " << i << '\n';
    }
    return 0;
  }
.R
.i1e
.IT You may need to determine how to set
.i1 \fC-std=c++11\fR for your compiler
.IT Your environment should be setup already on the Mesa server
.SS Parsing command line arguments
.IT What is the \fIcommand line\fR?
.i1 Function \fCmain()\fR traditionally takes two arguments that provide information
about the command line
.i2 \fCint argc\fR: the total number of arguments, C-strings separated by whitespace
.i2 \fCchar *argv[]\fR: an array of these C-strings
.i3 Can also be specified as: \fCchar** argv\fR, which is the same thing
.IT If you run a program named \fCfoo\fR invoked as 
.i1 \fC/home/dave/foo -c 10 www.sdmesa.edu\fR
.i1s
Your \fCargc\fR would be set = 4 and \fCargv\fR would contain
.RS
.CW
\s-8
 argv[0]:  "/home/dave/foo"
 argv[1]:  "-c"
 argv[2]:  "10"
 argv[3]:  "www.sdmesa.edu"
\s+8
.R
.RE
.i1e
.IT Important points
.i1 The first 'argument' is the name of the program
.i1 All arguments are C-strings
.i2 The argument "10" is not a number
.SS Example
.IT
Command line parsing example
.i1s
Using most standard C library functions
.CW
  #include <cstdint>    \m[green]// uint16_t\m[]
  #include <cstdlib>    \m[green]// atoi\m[]
  #include <cstring>    \m[green]// strcmp\m[]
  #include <iostream>

  int main(int argc, char** argv) {
    \m[blue]bool\m[] debug = false;
    \m[blue]std::uint16_t\m[] count = 1;
    for (int i=1; i < argc; ++i) {
      if (!std::str\m[red]n\m[]cmp(argv[i], "-h", \m[red]2\m[])) {
        help(argv[0]);
      } else if (!std::strcmp(argv[i], "-d")) {
        debug = \m[blue]true\m[];
      } else if (!std::strcmp(argv[i], "-c")) {
        ++i;
        if (i < argc) {
          count = \m[red]std::atoi\m[](argv[i]);
        } else {
          std::cerr << "Error using '-c' argument: no count specified\n";
          usage(argv[0]);
        }
      }
    }
    return count;
  }
.R
.i1e
.SS Summary
.IT What you should already know
.i1 Fundamental types, arrays, struct
.i1 Basic C and C++ style I/O
.i1 Traditional (pre-C++11) loops and conditionals
.i1 Writing programs composed (mostly) of a single function
.IT What I don't expect you to know
.i1 C++, pointers, or the standard library
.i1 Working with the command line
.IT The command line
.i1 A 2D array of \*[c]char\*[r]
.i1 Many libraries exist to parse the command line
.i1 The examples directory contains example command line argument processing for
.i2 getopt
.i2 Boost::program_options

