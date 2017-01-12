
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 2
.SS Overview
.IT Transitioning to Modern C++
.IT Using \*[c]const\*[r]
.IT Passing parameters and return values
.IT Using \*[c]namespaces\*[r]

.SS Transitioning to Modern C++
.IT C is a fairly simple language
.IT All it really offers is 
.i1 fundamental types, macros, pointers, structs, arrays, and functions.
.IT All problems in C get solved using these basic constructs
.IT These tools still exist in C++
.i1 And there are \fImany\fR more 
.i2 Especially in the standard library: the STL
.IT The trick is to know when to use them
.i1 Generally, the alternatives in C++ are improvements
.i2 Assuming code clarity, maintenance, and type safety are key goals
.IT As stated last week
.i1 I don't often say 'never do this' or 'never use that'
.i1 Rather: \fBprefer\fR \fIthis\fR over \fIthat\fR.
.SS Using const
.IT Use \*[c]const\*[r] to instruct the compiler to hold something constant
.IT The \*[c]const\*[r] keyword can modify the behavior of anything, depending on where it is used
.i1 Fundamental types
.i1 structs or classes
.i1 functions and function parameters
.i1 pointers and references 
.i2 or the values stored in pointers and references
.IT C99 added the \*[c]const\*[r] keyword, so now it's in both languages
.i1 But you don't see it nearly as often in C
.i1 Many programmers use \*[c]#define\*[r] instead
.SS Prefer \*[c]const\*[r] to \*[c]#define\*[r] 
.IT \fIEffective C++\fR item #2
.i1 We also prefer \*[c]inline\*[r] and \*[c]enum\*[r]s over \*[c]#define\*[r]
.IT There are many reasons to avoid \*[c]#define\*[r]
.i1 Parsed by the \fIpreprocessor\fR, not the compiler
.i1 A \*[c]#define\*[r] is merely a string
.i1 Code is harder to debug - defines are not in the symbol table
.IT For example
.RS
.CW
 #define ASPECT_RATIO 1.653
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
.SS Another problem with \fC#define\fP
.IT If you use #define to create a function-like macro
.IT Unexpected behaviors are possible
.IT For example
.i1 A macro to call some function \*[c]f()\*[r] with the larger of either \*[c]a\*[r] or \*[c]b\*[r]:
.RS
\s-4
.CW
  #define CALL_WITH_MAX(a,b) f((a) > (b) ? (a) : (b))
.R

and now use your "function"

.CW
  int a = 7, b = 0;
  CALL_WITH_MAX(++a, b);      //a incremented twice
  CALL_WITH_MAX(++a, b + 10); //here once (probably)
.R
\s+4

The number of times \*[c]a\*[r] is incremented depends on how it is called and the value of \*[c]a\*[r]. Ouch!
.IT \*[c]#define\*[r] may seem like a shortcut
.i1 It's not.
.i2 Just don't.  Your future coworkers will thank you...
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
.i1 Recall \*[c]constexpr\*[r] is more restrictive
.i2 Constant expression is evaluated at \fIcompile time\fR
.i1 When passing parameters to functions
.i2 Always consider passing by \*[c]const\*[r] reference
.i3 Applies only to object types
.i3 Avoids making an extra (unneeded) copy

.SS "Passing parameters"
.IT In C, parameter passing defaults to pass by value
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
\s-4\fC  const mesa::Student get_student (const std::string& name);\fR 
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
.i1 A class taxonomy is neither required \fInor desired\fR in C++
.IT Keep C++ namespaces simple

.SS Using namespaces
.IT What's wrong with \*[c]using namespace std;\*[r]?
.i1 Nothing, technically.
.i1 It was a simplification in your first semester classes
.i2 To avoid 'burdening' you with having to care about this technical detail
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
.i1 Use \*[c]const\*[r] and \*[c]constexpr\*[r]whenever possible
.i2 More on \*[c]const\*[r] when we get into classes over the next few weeks
.IT Parameter passing
.i1 Prefer pass-by-reference to pass-by-value
.i1 \fIBUT\fR
.i2 Don't return a reference when you must return an object
.IT Namespaces
.i1 Partition the global namespace
.i1 More important for library writers than app developers
.i1 But all code should consider their use
.i1 Avoid polluting the global namespace is a best practice
.i2 In other words: use namespaces - they are your friends
.i1 Avoid \*[c]using namespace std;\*[r] 

