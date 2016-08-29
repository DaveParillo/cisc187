
.TL
.gcolor blue
Things you should already know
.gcolor
.LP
.ce 1
Week 1

.SS "The Basics"
.IT Source files and Header files
.i1 What are the differences between them?
.i1 Why do the exist?
.i1 What are 'header guards'?
.i1 What is \*[c]#pragma once\*[r]?
.IT What happens during compilation?  Linking?
.IT How to use function main(), argc and argv
.IT cout and the meaning of statements like:

.RS
.CW
std::cout << "Hello world!" << std::endl;
.R
.RE
.IT Different formats for code comments (//, vs. /* ... */, etc)

.SS "Objects types and values"
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
.bp
.IT You know what an object is
.i1 Probably have used many 
.i1 Perhaps even created a few
.IT Type safety and type conversions
.i1 Widening conversions
.i1 Narrowing conversions

.SS "Statements and Branching"
.IT You've used different primitives to get things done
.IT You're familiar with \*[c]if\*[r], \*[c]switch\*[r], \*[c]for\*[r], and \*[c]while\*[r] blocks
.IT You've used \*[c]<vector>\*[r]'s of primitives
.IT Possibly the \*[c]<string>\*[r] class as well, but I'm not assuming this
.IT Used combinations of statements and branching to perform tasks like
.i1 Computing an amortization table
.i1 Computing population growth
.i1 Parsing text

.SS "Fixing errors in code"
.IT Compile-time errors vs. link-time errors vs. run-time errors
.IT Exceptions
.i1 You've experienced them, used try-catch, but not created your own
.i1 You know what \*[c]throw\*[r] does, even though you may not have ever used it personally
.IT Some basic experience using a debugger in whatever environment you were using before

.SS Important!
.IT If \fBany\fR of the material on the preceding slides sounds unfamiliar
.i1 Review the material in chapters 1-7 of the text
.i1 Review the material from your first semester text


or


.i1 Ask me to explain it, otherwise I have to assume you already know it!


.SS "What I don't expect you to know"
.IT Pointers
.IT C++
.i1 Most of you have learned C, 
.br or some strange C/C++ hybrid (CHide)
.i1 The C++ you have learned is not \fIModern C++\fR. It's probably C++98
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
where 'Modern' C++ is C++11, C++14, and the soon to be C++17
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
 buffy.ac.sdmesa.net
    or 
 10.51.1.150
.R
.i3e
.i3 All the tools you need to complete your projects are there if you don't have your own C++ toolchain
.SS "Parsing command line arguments"
.IT A fundamental part of all *nix programs
.i1 *nix is short for \fIUnix & friends, MacOS X, and GNU/Linux\fR

.IT Many libraries exist to parse the command line
.i1 \fCgetopt\fR is one of the oldest
.i2 Ships with all C and C++ compilers
.i2 And is pretty easy to use (but a bit limited)
.i3 Its limitations are the main motivator behind the numerous alternatives
.i3 Programmers, expecially *nix programmers hate being told what to do!
.bp
.IT
Function \fCmain()\fR traditionally takes two arguments that provide information
about the command line
.i1 \fCint argc\fR: the total number of arguments, strings separated by whitespace
.i1 \fCchar *argv[]\fR: an array of these strings
.i2 Can also be specified as: \fCchar **argv\fR, which is the same thing
.IT If you run a program named \fCfoo\fR with the arguments 
.i1 \fC-n 10 www.sdmesa.edu\fR
.i1s
Your \fCargc\fR would be set = 4 and \fCargv\fR would contain
.RS
.RS
.CW
\s-8
 argv[0]:  foo
 argv[1]:  -v
 argv[2]:  "10"
 argv[3]:  www.sdmesa.edu
\s+8
.R
.i1e
.RE
.RE
.bp
.IT The \fCgetopt\fR function makes parsing these strings simple
.LI
It sets 3 important global variables:
.i1 \fCoptarg\fR:A pointer to the current option argument, if there is one
.i1 \fCoptind\fR:An index to the next argv pointer to process when \fCgetopt()\fR is called again
.i1 \fCoptopt\fR:The last known option provided
.IT
Use \fCgetopt()\fR by calling it repeatedly until there are no options left to process.
The method signature is:
.i1 \s-4\fCint getopt (int argc, char* const argv[], const char *optstring)\fR\s+4
.i2 \fCoptstring\fR tells \fCgetopt\fR how to interpret the strings encountered in \fCargv[]\fR
.SS "getopt() Example"
\s-(10
.CW
  #include <iostream>
.B1
 #include <unistd.h>        // getopt declaration resides in this header
.B2
  using std::string;
   
  int main(int argc, char* argv[]) {
    int c;
    int debug = 0;
    int max_critters = 25;
    string view = "default";
    string prog = argv[0];
.bp
    while ((c = getopt (argc, argv, "?hdv:n:")) != -1) {
      switch (c) {
        case 'd':
          debug++;
          break;
        case 'n':
          max_critters = std::atoi(optarg);
          break;
        case 'v':
          view = optarg;
          break;
        case 'h':            // fall-through is intentional here
        default:
          show_usage(prog);
          break;
      }
.R
\s+(10
.SS "Usage statement"
.LP
A usage statement is customary if argument processing fails
\s-(10
.CW
  /**
   * Display a usage statement for this program.
   * @param name the name of this program as determined by args[0]
   */
  static void show_usage(const string name) {
    std::cerr << "Usage: " << name << " [-hd] [-v view] [-n #]"
      << "Options:\\n"
      << "  -h   Show this text\\n"
      << "  -d   Enable debug output.\\n"
      << "  -v   Set the UI used.  The default is text based.\\n"
      << "  -n   Set the number of Critters for each Species.  Default = 25.\\n"
      << std::endl;
    exit(0);
  }
.R
\s+(10

