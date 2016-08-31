
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 2
.SS Overview
.IT Notices
.IT Chapter review
.IT Quiz review
.IT Project #1 demo
.IT Potentially useful information (backup slides)
.i1 Function writing guidelines
.i1 Compiler warnings
.i1 Using \*[c]auto\*[r]
.SS Notices
.IT No class Monday
.i1 Labor day
.IT There will be a Chapter 9 quiz on Wednesday
.i1 Consider purchasing a textbook
.bp
.IT Game plan revision
.i1 Based on the semester so far
.i1 Lecture will be based on quiz material
.i1 Which is based on lab
.IT \fBI\fR need to tone down discussing what I think 
.i1 and focus on the essentials
.i1 People who have had me before know this is a recurring theme
.i2 (and from Monday it's Ken Thompson, not Brian Kernighan)
.IT \fBYou\fR need to come into class ready
.IT \fCturnitin.sh\fR
.i1 To simplify the turn in process on buffy

.SS Chapter review
.IT Big idea
.i1 What matters is how ideas can be expressed in code
.i2 not the individual language features
.IT Declarations and definitions
.i1 A \fIdeclaration\fR is a statement that introduces a name into a scope
.i2 specifying a type and optionally, an initializer
.i1 Before a name can be used in a C++ program, it must be declared
.i1 A declaration defines how something can be used
.i2 it defines the interface for a function, variable, or class
.i1 In a header file the compiler reads the declarations it needs to understand our code
.bp
.IT Declarations and definitions
.i1 A declaration that (also) fully specifies the entity declared 
.i2 This is called a \fIdefinition\fR
.i1 A \fIdefinition\fR of a variable allocates \fBmemory\fR for that variable
.i2 You cannot define a variable twice
.i2 In other words: You cannot allocate memory for the same name twice
.i1 The extern keyword states that a declaration is not a definition
.i1 The declaration/definition distinction 
.i2 allows separating a program into many parts that can be compiled separately
.i1 Constants have the same declaration syntax as variables 
.i2 but they have \*[c]const\*[r] as part of their type and require an initializer
.i1 A function declaration with a body (a function body) is a function definition.
.i1 The key to managing declarations of facilities defined "elsewhere" in C++ is the header file.
.i1 The \fBstd_lib_facilities.h\fR header file from the text 
.i2 Common declarations used in the book 
.i3 \*[c]cout\*[r], \*[c]vector\*[r], and \*[c]sqrt()\*[r], 
.i3 and a couple of simple utility functions 
.i3 I don't use it, but you should be aware it exists.
.bp
.IT Scope
.i1 A scope is a region of program text. 
.i2 A variable or function declared in some scope
.i3 is valid (in scope) from the point of declaration to the end of that scope
.i1 Whenever you can, avoid complicated nesting of scopes. Keep it simple.
.SS Quiz
.IT The \fINothing is output\fR option
.i1 What I \fImeant\fR was 
.i2 \fINothing is output when the program is run\fR
.i2 A program that does not compile never gets this far
.i1 I will be more clear on this going forward
.IT Choose all \fIthat apply\fR
.i1 I deduct points for incorrect guesses
.i2 If you pick every answer you are bound to get a zero
.IT Choose \fBall\fR vs choose \fBone\fR
.ds circle \s+4\[u25CB]\0\s-4
.ds ballotbox \s-6\[br]\0\0\[br]\l'|0\[rn]'\l'|0\[ul]'\0\s+6

.RS
Choose \fBone\fR
.br
.RS
\*[circle] a. This is the only viable option
.RE
.br
Choose \fBall\fR
.br
.RS
\*[ballotbox] a. Might be an answer
.br
.br
\*[ballotbox] b. So might this
.RE
.RE

.SS Quiz review
.IT Questions 4 & 5...

.SS Backups
.DS
Useful information to follow

Read and ask questions if you have any.
.DE
.SS General function writing guidelines
.IT Write for clarity and correctness \fBfirst\fR

.IT Avoid \fIpremature optimization\fR

.IT Avoid \fIpremature pessimization\fR
.i1 That is, prefer faster when \fBequally\fR clear
.bp
.IT Keep functions short
.i1 A function should do \fIone\fR thing well
.i2 If you see a function doing more then one thing
.i3 Consider breaking it up into multiple functions
.i2 Is this (slightly) more work?
.i3 In the short run, maybe.
.i3s 
In the long run, your total time spent 
.br
debugging, testing, maintaining, and modifying
.br
will be far, far less than if you packed everything into one monster function
.i3e
.i3 Unit testing is practically impossible once functions reach a certain size.
.bp
.IT Strive to write a function \fIonce\fR and never have to touch it again.

.IT Check function parameters for validity
.i1 Unless you \fIcompletely\fR trust the caller (and their caller...)
.i2 It should be obvious: do not trust \fCargv[]\fR

.SS Compiling functions (and other code)
.IT Prefer compile-time and link-time errors to runtime errors
.IT .i1 Effective C++ item #46
.IT C++ doesn't offer much of a 'safety net'
.i1 Once past the compiler you are on your own
.i2 The things we got away with in the week 1 lab hopefully convinced you...
.IT Pay attention to compiler warnings
.i1 Effective C++ item #48
.IT Many project ignore compiler warnings or turn them off
.i1 Compilers and their warnings get better constantly
.i1 We already know that once past the compiler, you're on your own
.i1 Ignoring warnings effectively throws away a powerful resource
.IT It's important to understand what the compiler is trying to tell you
.i1 But don't use the compiler as your personal safety net
.i2 i.e. don't over rely on it to do your syntax checking for you
.i2 You're supposed to be the programmer here!

.SS "The \fCauto\fP keyword"
.IT This may be 'old news', but here it is
.IT
Prefer auto over explicit types:
.i1s 
Prefer 
.br
\fC  auto s = "Hello";\fR 
.br
over
.br
\fC  const char* s = "Hello";\fR
.i1e
.i1s
Prefer 
.br
\fC  auto w = get_widget(); \fR
.br
over
.br
\fC  widget w = get_widget();\fR
.i1e
.IT
In general: 
.CW

  auto x = initial_value;
.R
.bp
.IT
If you must commit to a type:
.i1s
Prefer 
.br
\fC  auto e = employee{empid};\fR
.br
over
.br
\fC  employee e {empid};\fR
.i1e
.i1s
Prefer 
.br
\fC  auto w = widget {12, 34};\fR
.br
over
.br
\fC  widget w {12, 34};\fR
.i1e
.IT
In general:
.CW

   auto x = Type { init_value };
.R
.bp
.IT
Why do I care?
.IT Guarantees:
.i1 \fBNo\fR implicit conversions
.i1 \fBNo\fR narrowing conversions
.i1 \fBNo\fR uninitialized variables
.IT And all your code looks much more consistent
.i1 It \fIis\fR much more consistent!!
.IT Easier to read, fewer bugs

auto
----
 #5: Prefer auto to explicit type declarations
 #6: Use the explicitly types initializer idiom when auto deduces undesired types


.SS Summary
.IT Functions
.i1 Keep them short
.i1 Avoid \fIpremature optimization\fR
.i1 Avoid \fIpremature pessimization\fR
.IT Compiler warnings
.i1 Pay attention to compiler warnings
.i1 Prefer compile-time and link-time errors to runtime errors
.IT Using \*[c]auto\*[r]
.i1 Prefer auto over explicit types
.i1 \*[c]auto\*[r] can make code easier to read
.i1 Use an explicit initializer when \*[c]auto\*[r] deduces an undesired type

