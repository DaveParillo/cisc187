
.TL
.gcolor blue
Things you should already know
.gcolor
.LP
.ce 1
Week 1

.SS "The Basics"
.IT
Source files and Header files
.i1
What are the differences between them?
.i1e
.i1
Why do the exist?
.i1e
.i1
What are 'header guards'?
.i1e
.i1
What is \fC#pragma once\fR?
.i1e
.IT
What happens during compilation?  Linking?
.IT
How to use function main(), argc and argv
.IT
cout and the meaning of statements like:

.RS
.CW
std::cout << "Hello world!" << std::endl;
.R
.RE
.IT
Different formats for code comments (//, vs. /* ... */, etc)

.SS "Objects types and values"
.IT
cin and the meaning of statements like:

.RS
.CW
  string name;
  cin >> name;
  std::cout << "Hello," << name 
            << "!" << std::endl;
.R
.RE
.IT
Declaring primitives
.IT
Operations and Operators
.i1
Shortcut operators (++, +=, etc)
.i1e
.IT
Assignment and initialization
.i1
What is the difference between these two ideas?
.i1e
.i2
Can you provide a few examples?
.i2e
.IT
Legal identifier names
.i1
For classes, functions, and variables
.i1e
.IT
You know what an object is
.i1
Probably have used many and created a few
.i1e
.IT
Type safety and type conversions
.i1
Widening conversions
.i1e
.i1
Narrowing conversions
.i1e

.SS "Statements and Branching"
.IT 
You've used different primitives to get things done
.IT
You're familiar with \fCif\fR, \fCswitch\fR, \fCfor\fR, and \fCwhile\fR blocks
.IT
You've used \fC<vector>\fR's of primitives
.IT
Possibly the \fC<string>\fR class as well, but I'm not assuming this
.IT
Used combinations of statements and branching to perform tasks like
.i1
Computing an amortization table
.i1e
.i1
Computing population growth
.i1e
.i1
Parsing text
.i1e

.SS "Fixing errors in code"
.IT
Compile-time errors vs. link-time errors vs. run-time errors
.IT
Exceptions
.i1
You've experienced them, used try-catch, but not created your own
.i1e
.i1
You know what \fCthrow\fR does, even though you may not have ever used it personally
.i1e
.IT
Some basic experience using a debugger in whatever environment you were using before

.SS Important!
.IT
If \fBany\fR of the material on the preceding slides sounds unfamiliar
.i1
Review the material in chapters 1-7 of the text
.i1e
.i1
Review the material from your first semester text
.i1e


or


.i1
Ask me to explain it, otherwise I have to assume you already know it!
.i1e


.SS "What I don't expect you to know"
.IT
C++
.i1
Most of you have learned C, 
or some strange C/C++ hybrid (CHide)
.i1e
.i1
The C++ you have learned is not \fIModern C++\fR. It's probably C++98
.i1e
.i1
Be aware that C++ is actually a federation of several languages
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
.i1
It is possible to write code in any of these languages
compile it with C++ and call it a "C++ program"
.i1e
.i2
This course will emphasize modern C++
.i2e
.i1
Operators other than +, -, *, and /.
.i1e
.i2
We'll cover modulus, bit shifting, bit-wise operators and operator overloading
.i2e
.bp
.IT
Linux (or Unix) in general
.i1
And \fCmake\fR in particular
.i1e
.i2
All projects and any labs that require handing in source code
must be able to compile on the Mesa cislinux server, aka buffy
.i2e
.i3
This server is accessible via \fCssh\fR outside the campus from either
.CW
 mesa-cislinux.sdmesa.sdccd.cc.ca.us
    or 
 209.129.16.61
.R
.i3e
.i3
Inside the campus
.CW
 buffy.ac.sdmesa.net
    or 
 10.51.1.150
.R
.i3e
.i3
All the tools you need to complete your projects are there is you don't have your own C++ toolchain
.i3e 

