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
.SS Summary
.IT What you should already know
.i1 Fundamental types, arrays, struct
.i1 Basic C and C++ style I/O
.i1 Traditional (pre-C++11) loops and conditionals
.i1 Writing programs composed (mostly) of a single function

