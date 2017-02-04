
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 2
.SS Overview
.IT You have \fBalready\fR read Chapter 8 of the text
.IT Transitioning to Modern C++
.IT Using \*[c]const\*[r]
.IT Passing parameters and return values
.IT Using \*[c]namespace\*[r]s
.IT A word about the compiler...

.SS Transitioning to Modern C++
.IT C is a fairly simple language
.IT All it really offers is 
.i1 fundamental types, macros, pointers, structs, arrays, and functions.
.IT All problems in C get solved using these basic constructs
.IT These tools still exist in C++
.i1 And there are \fImany\fR more 
.i2 Especially in the standard library: the STL
.i1 Only functions don't have C++ 'replacements'
.IT The trick is to know when to use them
.i1 Generally, the alternatives in C++ are improvements
.i2 Assuming code clarity, maintenance, and type safety are key goals
.IT As stated last week
.i1 I don't often say 'never do this' or 'never use that'
.i1 Rather: \fBprefer\fR \fIthis\fR over \fIthat\fR.
.SS What is preferred
.IT Small functions over large ones
.IT \*[c]const\*[r] and \*[c]constexpr\*[r] over \*[c]#define\*[r]
.i1 When creating constants
.IT \*[c]class\*[r] over \*[c]struct\*[r]
.i1 More on this after the mid-term
.IT \*[c]vector\*[r] or another STL container over \*[c]array\*[r]
.IT So-called 'smart pointers' over raw pointers
.IT Of these distinctions, the only ones we are ready to discuss today are
.i1 functions
.i1 \*[c]const\*[r]
.SS Functions
.IT A group of statements that work together to perform a task
.i1 A function has a \fIname\fI
.i1 It may optionally take \fIparameters\fR
.i1 It may optionally return a value
.i1s
For example
.CW
 return_type function_name (argument list)
 {
    \m[green]// zero or more statements\m[]
 }
.R
.i1e
.IT Once defined, a function can be called
.i1 And its task can be executed as often as needed
.i1 See \fCexamples/week02/add.cpp\fR and \fCcall-stack.cpp\fR 
.SS Using const
.IT Use \*[c]const\*[r] to instruct the compiler to hold something constant
.IT The \*[c]const\*[r] keyword can modify the behavior of anything, depending on where it is used
.i1 fundamental types
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
.i2 Just like any other pre-processor directive (\*[c]#include\*[r], \*[c]#ifdef\*[r], etc.)
.i1 Makes code harder to debug - \*[c]#define\*[r]s are not in the symbol table
.i1s
For example:
.CW
 #define ASPECT_RATIO 1.653
.R

is an old fashioned way to define a constant, but you'll likely see it 'in the wild'
.br
Prefer this instead:
.CW
 const double ASPECT_RATIO = 1.653;
.R
.i1e 
.IT \fIProgramming Principles\fR says 'never use all CAPS for variables'
.i1 Reserved for macros (i.e. \*[c]#define\*[r])
.i1 I am not a stickler on this issue.
.i2 All caps for constants and enums has a long history in many languages.
.SS Another problem with \fC#define\fP
.IT If you use #define to create a function-like macro
.IT Unexpected behaviors are possible
.IT For example
.i1s
A macro to call some function \*[c]f()\*[r] with the larger of either \*[c]a\*[r] or \*[c]b\*[r]:
.CW
  #define CALL_WITH_MAX(a,b) f((a) > (b) ? (a) : (b))
.R

and now use your "function"
.br
.CW
  int a = 7, b = 0;
  CALL_WITH_MAX(++a, b);      \m[green]//a incremented twice\m[]
  CALL_WITH_MAX(++a, b + 10); \m[green]//here once (probably)\m[]
.R

The number of times \*[c]a\*[r] is incremented depends on how it is called and the value of \*[c]a\*[r]. Ouch!
.br
See \fCexamples/week02/define.cpp\fR
.i1e
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
.i2 Consider passing by \*[c]const\*[r] reference
.i3 Applies only to object types
.i3 Avoids making an extra (unneeded) copy
.i3 Prevents unintended modification

.SS "Passing parameters"
.IT In C, parameter passing defaults to pass by value
.i1 See \fCexamples/week02\fR
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
.SS Compiling functions (and other code)
.IT Prefer compile-time and link-time errors to runtime errors
.i1 Effective C++ item #46
.IT C++ doesn't offer much of a 'safety net'
.i1 Once past the compiler you are on your own
.i2 The things we got away with in the week 1 lab hopefully convinced you...
.IT Pay attention to compiler warnings
.i1 Effective C++ item #48
.IT Many projects ignore compiler warnings or turn them off
.i1 Compilers and their warnings get better constantly
.i1 We already know that once past the compiler, you're on your own
.i1 Ignoring warnings effectively throws away a powerful resource
.IT It's important to understand what the compiler is trying to tell you
.i1 But don't use the compiler as your personal safety net
.i2 i.e. don't over rely on it to do your syntax checking for you
.i2 You're supposed to be the programmer here!
.SS Summary
.IT Prefer \fCconst\fP 
.i1 Use \*[c]const\*[r] and \*[c]constexpr\*[r] whenever possible
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
.IT Compiler warnings
.i1 Pay attention to compiler warnings
.i1 Prefer compile-time and link-time errors to runtime errors

.SS Backups
.DS
Useful information to follow

Read and ask questions if you have any.
.DE
.SS General function writing guidelines
.IT Write for clarity and correctness \fBfirst\fR

.IT Avoid \fIpremature optimization\fR

.IT Avoid \fIpremature "pessimization"\fR
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
.SS How not to read a number
.IT Let's do everything in 1 function!
.i1s
This is an anti-pattern ...
\s-8
.CW
  cout << "Please enter an integer 
           in the range 1 to 10 (inclusive):\n";
  int n = 0;

  while (cin >> n) {
    if (cin) {                     \m[green]// we got an integer\m[]
                                   \m[green]// now check it\m[]
      if (1<=n && n<=10) {
        break;
      }
      cout << "Sorry, " << n 
           << " is not in the [1:10] range\\n";
    }
    \m[green]// not an int...\m[]
.R
.i1e
.bp
.IT Not an int
.i1s
So do error handling ...
\s-8
.CW
    else if (cin.fail()) 
      cin.clear();	        \m[green]// we'd like to look at the characters\m[]
      cout << "Sorry, that was not a number; please try again\n";

      for (char ch; cin>>ch && !isdigit(ch); ) 	\m[green]// throw away non-digits\m[]
        /* nothing */ ;

      if (!cin) {
        print_error("no input");      \m[green]// provide some feedback\m[]
      } else {
        cin.unget()                   \m[green]// put the digit back\m[]
      }
    }
    else {
      error("no input");	\m[green]// eof or bad: give up\m[]
    }
  }
  \m[green]// if we get here n is in the desired range\m[]

.R
\s+8
.i1e
.IT But this function is a mess!
.SS The problem
.IT Trying to do everything at once
.IT We have all mixed together
.i1 Reading values
.i1 Prompting the user for input
.i1 Writing error messages
.i1 Skipping past "bad" input characters
.i1 Testing the input against a range

.IT Solution: Split into logically separate parts
.SS What do we want?
.IT Weed parts for
.i1s 
Read an int and range check it
.RS
.CW
  int get_int(int low, int high);
.R
.RE
.i1e
.i1s 
Get any \*[c]int\*[r]
.RS
.CW
  void get_int();
.R
.RE
.i1e
.i1s 
Try to find an int in some non-int garbage
.RS
.CW
  void skip_to_int();
.R
.RE
.i1e


Separate functions that do the logically separate actions
.SS Get any int
.RS
\s-8
.CW
  int get_int()
  {
    int n = 0;
    while (true) {
      if (std::cin >> n) {
        return n; 	
      }
      std::cout << "Sorry, that was not a number\\n";
      skip_to_int();
    }
  }
.R
.RE
.SS Skip garbage
.RS
\s-8
.CW
  void skip_to_int()
  {
    if (std::cin.fail()) {	      	  \m[green]// not an integer\m[]
      std::cin.clear();	              \m[green]// prepare to look at characters\m[]
      for(char ch; std::cin>>ch; ) {  \m[green]// throw away non-digits\m[]
        if (isdigit(ch) || ch=='-') {
          std::cin.unget()            \m[green]// return last char to stream\m[]
          return;
        }
      }
    }
    print_error("no input");	\m[green]// eof or bad: give up\m[]
  }
.R
.RE
.SS Get an int with a given range
.RS
\s-8
.CW
  int get_int(int low, int high)
  {
    std::cout << "Please enter an integer in the range "
              << low << " to " << high << " (inclusive):\\n";
    while (true) {
      int n = get_int();
      if (low<=n && n<=high) return n;
      std::cout << "Sorry, "
                << n << " is not in the [" << low << ':' << high
                << "] range; please try again\\n";
    }
  }
.R
.RE
.SS Use what we've got so far
.IT This sort of works
.RS
.CW
  int n = get_int(1,10);
  cout << "n: " << n << endl;

  int m = get_int(2,300);
  cout << "m: " << m << endl;
.R
.RE
.IT But limited.  We can't provide explicit instructions
.IT Yes, we have functions
.IT No, they are not very reusable

.IT Problem
.i1 The 'dialog' with the user is still all mixed in
.SS What do we \fIreally\fP want?
.IT \fIParameterize\fR the conversation
.RS
\s-8
.CW
  int strength = get_int(1, 10,
                         "enter strength",
                         "Not in range, try again");
  cout << "strength: " << strength << endl;

  int altitude = get_int(0, 50000,
                         "please enter altitude in feet",
                         "Not in range, please try again");
  cout << "altitude: " << altitude  << "ft. above sea level\\n";

.R
.RE
.IT Knowing what we \fIreally\fR want is often the most important question
.IT Ask it repeatedly during software development
.IT As you learn about a problem & it's solutions
.i1 Your answers improve
.SS Parameterized get_int in range
.RS
\s-8
.CW
  int get_int(int low, int high,
              const string& prompt, const string& sorry)
  {
    std::cout << prompt
              << low << " to " << high << " (inclusive):\\n";
    while (true) {
      int n = get_int();
      if (low<=n && n<=high) return n;
      std::cout << sorry 
                << n << " is not in the [" << low << ':' << high
                << "] range; please try again\\n";
    }
  }
.R
.RE
.IT And could do the same thing for \fCget_int()\fR
.IT General rule: utility functions don't produce their own messages
.IT \fIReal\fR library functions often don't display anything at all
.i1 They throw exceptions with message text
.SS Summary
.IT Functions
.i1 Keep them short
.i1 Avoid \fIpremature optimization\fR
.i1 Avoid \fIpremature pessimization\fR
.IT Split large problems into small ones
.i1 This takes practice

