.ds title What I don't expect you to know
.pdfinfo /Title \*[title]
.TL
.gcolor blue
\*[title]
.gcolor
.LP
.ce 1
Week 1
.SS C++11 or later
.IT Pointers
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

.SS Linux
.IT Linux (or Unix) in general
.i1 Command line compiling
.i2s
All projects and any labs that require handing in source code
must be able to compile on the Mesa cislinux server, aka buffy
.i2e
.i3s
This server is accessible via \fCssh\fR outside the campus from either
.CW
 209.129.16.61
.R
.i3e
.i3s
Inside the campus
.CW
 buffy ( or buffy.ac.sdmesa.net )
.R
.i3e
.i3 All the tools you need to complete your projects are there if you don't have your own C++ toolchain
.i2 Solutions are posted on buffy (http://209.129.16.61/~dparillo) as well
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
.SS Vim
.IT A universally available text editor (*nix, Mac OSX)
.IT If you plan to work in C/C++ 
.i1 You should establish at least some familiarity
.IT VIM resources
.i1 My text
.i1 \*[c]vimtutor\*[r]
.i1 \*[c]man vim\*[r]
.i1 Documentation inside vim
.i2 \*[c]:help\*[r]
.SS Parsing command line arguments
.IT What is the \fIcommand line\fR?
.i1 Function \fCmain()\fR traditionally takes two arguments that provide information
about the command line
.i2 \fCint argc\fR: the total number of arguments, C-strings separated by whitespace
.i2 \fCchar *argv[]\fR: an array of these C-strings
.IT If you run a program named \fCfoo\fR invoked as 
.i1 \fC/home/dave/foo -c 10 www.sdmesa.edu\fR
.i1s
Your \fCargc\fR would be set = 4 and \fCargv\fR would contain
.CW
 argv[0]:  "/home/dave/foo"
 argv[1]:  "-c"
 argv[2]:  "10"
 argv[3]:  "www.sdmesa.edu"
.R
.i1e
.IT Important points
.i1 The first 'argument' is the name of the program
.i1 All arguments are C-strings
.i2 The argument "10" is not a number
.SS Example
.IT Extra credit today, requirement for project #1
.IT Command line parsing example
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
.R
.bp
.CW
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
.IT What I don't expect you to know
.i1 C++, pointers, or the standard library
.i1 Working with the command line
.IT The command line
.i1 A 2D array of \*[c]char\*[r]
.i1 Many libraries exist to parse the command line
.i1 The examples directory contains example command line argument processing for
.i2 getopt
.i2 Boost::program_options

