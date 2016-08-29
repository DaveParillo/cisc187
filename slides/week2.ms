
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 2
.SS Overview
.IT Quick reminder
.i1 Recording lab times
.i2 Helps me help you!
.IT Transitioning to Modern C++
.IT Using \*[c]const\*[r]
.IT Passing parameters and return values
.IT Using \*[c]namespaces\*[r]

.SS Transitioning to Modern C++
.IT C is a fairly simple language. 
.IT All it really offers is 
.i1 macros, pointers, structs, arrays, and functions.
.IT All problems in C get solved using these basic constructs
.IT These tools still exist in C++
.IT The trick is to know when to use them
.i1 Generally, the alternatives in C++ are improvements
.i2 Assuming code clarity, maintenance, and type safety are key goals
.IT As stated last week
.i1 I don't often say 'never do this' or 'never use that'
.i1 Rather: \fIPrefer\fR x over y.

.SS Prefer \fCconst\fP to \fC#define\fP
.IT \fIEffective C++\fR item #1
.IT There are many reasons to avoid \*[c]#define\*[r]
.i1 Parsed by the \fIpreprocessor\fR, not the compiler
.i1 Functionally always a string
.i1 Code is harder to debug - defines are not in the symbol table
.IT For example
.RS
.CW
 #define ASPACT_RATIO 1.653
.R

is an old fashioned way to define a constant, but you'll likely see it 'in the wild'

Prefer
.CW
 const double ASPECT_RATIO = 1.653;
.R
.RE 
.IT \fIProgramming Principles\fR says 'never use all CAPS for variables'
.i1 Reserved for macros (i.e. \*[c]#define\*[r])
.i1 I am not a stickler on this issue.
.i2 All caps for constants and enums has a long history in many languages.
.SS \s-8Use \fCconst\fP and \fCconstexpr\fP whenever possible\s+8
.IT \fIEffective C++\fR item #21 and \fIEffective Modern C++\fR item #15 
.IT \*[c]const\*[r] is an incredibly versatile keyword
.i1 \m[red]\fBWhere\fR\m[] const appears in a statement affects \m[red]\fBwhat\fR\m[] is held constant
.i1 \*[c]constexpr\*[r] was added in C++11
.IT There is enough going on with \*[c]const\*[r] that we will be re-visiting it many times throughout the semester.
.IT Guidelines for now
.i1 When creating local variables
.i2 Ask: "Does this variable ever change?"
.i3 If not, consider \*[c]const\*[r] or \*[c]constexpr\*[r] 
.i1 When passing parameters to functions
.i2 Always consider passing by \*[c]const\*[r] reference
.i3 Applies only to object types
.i3 Avoids making an extra (unneeded) copy

.SS "Passing parameters"
.IT In C, parameter passing default to pass by value
.IT Unless you specify otherwise 
.i1 Function parameters are initialized with \fIcopies\fR of the actual arguments, 
.i1 Function callers get back a copy of the value returned by the function
.IT For large / complex objects, this becomes expensive even in small programs
.IT
Prefer passing references over pass by value:
.i1 Effective C++ #22: Prefer pass-by-reference to pass-by-value
.i1s 
For example, we prefer 
.br
\s-4\fC  const mesa::Student& get_student (const std::string& name);\fR 
.br
over
.br
\fC  const mesa::Student  get_student (const std::string  name);\fR \s+4
.i1e
.IT Finally
.i1 Don't return a reference when you must return an object
.i1 In other words
.i2 Don't go so crazy on pass-by-reference that you strive to \fInever\fR return a value
.i1 We will talk more about this when we get into objects
.SS Partition the global namespace
.IT Effective C++ #28
.IT The main problem with the global namespace?
.i1 There is only 1 of them
.i1 Name conflicts can be common on large projects
.i1 Complicates mixing third party libraries
.IT \fIWell-behaved\fR third party libraries will not put much (if anything) in the global namespace.
.IT A word about namespaces for you java programmers...
.IT Namespaces are not packages
.i1 Java packages enforce a class taxonomy
.i1 This is \fInot\fR the case in C++
.IT Keep C++ namespaces simple

.SS Using namespaces
.IT What's wrong with \*[c]using namespace std;\*[r]?
.i1 Nothing, technically.
.IT \fIBUT\fR
.i1 Realize the standard namespace is huge
.i2 It contains thousands of classes and functions
.IT If you do use \*[c]using namespace std;\*[r], then
.i1 All of these names are now 'out of bounds'
.i1 You can't use them yourself
.i1 \fBAnd\fR avoid a conflict (name clash) with something already defined in the standard namespace
.IT If this doesn't bother you, then go right ahead
.IT You have been warned!

.SS Summary
.IT Prefer \fCconst\fP 
.i1 Use \fCconst\fP and \fCconstexpr\fP whenever possible
.IT Parameter passing
.i1 Prefer pass-by-reference to pass-by-value
.i1 \fIBUT\fR
.i2 Don't return a reference when you must return an object
.IT Namespaces
.i1 Partition the global namespace
.i2 In other words: use namespaces - they are your friends
.i1 Avoid \*[c]using namespace std;\*[r] 

