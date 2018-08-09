.ds CH Lab #5a: Pointers
.so headings.ms
.TL
\*[CH]
.SH
Pointers and arrays: 4 points, 90 minutes \fImaximum\fR
.LP
.RS
This exercise is intended to build your understanding of pointers and their relation to arrays. 

Do not use any standard library functions in any of the functions you write for this lab.

.nr step 0 1
.IP \n+[step].
Create 2 files \fClab5a.h\fR and \fClab5a.cpp\fR.

Use \fClab5a.h\fR to store the declarations for all lab functions and 
\fClab5a.cpp\fR to store the function defintions.

.IP \n+[step].
Write a function \*[c]void mesa::to_lower(char*)\*[r] that replaces all upper case
characters in the C string provided with lower case equivalents.

You do not need to worry about locale or characters outside the ASCII character set.

.IP \n+[step].
Write a function \*[c]char* mesa::copy(const char*)\*[r] that returns a C string
copied into memory allocated on the free store.

.IP \n+[step].
Write a function \*[c]std::size_t mesa::count(const char*, const char)\*[r] that returns
the number of occurrences of the \*[c]char\*[r] in the array.

.IP \n+[step].
Write a function \*[c]const char* mesa::find(const char* str, const char* x)\*[r] that returns
the first occurrence of \*[c]x\*[r] in \*[c]str\*[r].

.IP \n+[step].
Create a file \fCmain.cpp\fR.

Call each of the functions you wrote.
Keep it simple.

.IP \n+[step].
When finished, check your main on buffy by running \fCvalgrind\fR, a memory checking program.

First create a main of your own and compile your program, then run it through valgrind:
.CW
 valgrind ./main
.R

If you properly cleaned up after your pointers, you should see the following line near the end of the output:
.CW
 All heap blocks were freed -- no leaks are possible
.R

Otherwise, you see information indicating memory leaks or other memory related errors.
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab5a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab5a
.R

