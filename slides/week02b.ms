
.TL
.gcolor blue
Functions
.gcolor
.LP
.ce 1
Week 2
.SS Overview
.IT Chapter review
.IT Potentially useful information (backup slides)
.i1 Function writing guidelines
.i1 Compiler warnings
.i1 Using \*[c]auto\*[r]
.SS Chapter review
.IT Big idea
.i1 What matters is how ideas can be expressed in code
.i2 not the individual language features
.IT Declarations
.i1 A \fIdeclaration\fR is a statement that introduces a name into a scope
.i2 specifying a type and optionally, an initializer
.i1 Before a name can be used in a C++ program, it must be declared
.i1 A declaration specifies \fIhow\fR something can be used
.i2 it specifies the interface for a function, variable, or class
.i1 In a header file the compiler reads the declarations it needs to understand our code
.IT Definitions
.i1 A \fIdefinition\fR is an implementation of a declaration
.i1 A declaration may also fully specify the entity declared 
.i2 This is called a \fIdefinition\fR
.bp
.IT Declarations and definitions
.i1 A \fIdefinition\fR of a variable allocates \fBmemory\fR for that variable
.i2 You cannot define a variable twice
.i2 In other words: You cannot allocate memory for the same name twice
.i1 The \*[c]extern\*[r] keyword states that a declaration is not a definition
.i2 Use sparingly.  You'll see why in lab
.i1 The declaration/definition distinction 
.i2 Allows separating a program into many parts that can be compiled separately
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
.SS Keyword: extern
.IT A major source of confusion!
.IT Primarily handy for global variables
.i1 You'll inherit code with globals, I'm sure
.i1 Prefer to minimize globals in your own code
.i1s
Declare the existence of a variable
.BI
in a header file
.R
.CW
  #ifndef HEADER_H
  #define HEADER_H

  \m[green]// any source file that includes this 
  // will be able to use "global_x"\m[]
  extern int global_x;

  void print_global_x();

  #endif
.R
.i1e
.i1 At this point, the compiler only knows the type and the name
.i2 We have \fIdeclared\fR, but not yet \fIdefined\fR \fCglobal_x\fR
.bp
.IT Now we need to define \fCglobal_x\fR
.i1s
We can define it in only 1 place, or the compiler complains

Source file 1:
.CW
  #include "header.h"
  \m[green]// it needs to be defined\m[]
  int global_x;

  int main()
  {
      \m[green]// and initialized!\m[]
      global_x = 5;
      print_global_x();
  }
.R

Source file 1:
.CW
  #include <iostream>
  #include "header.h"
  \m[green]// defining global_x again here is an error\m[]
  void print_global_x()
  {
      \m[green]// global_x is in scope everywhere!\m[]
      std::cout << global_x << std::endl;
  }
.R
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
.RS
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
.bp
.R
.RE
.IT Not an int
.IT So do error handling
.RS
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
.RE
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
.IT Summary
.i1 #5: Prefer auto to explicit type declarations
.i1s
#6: Use the explicit types initializer idiom when auto deduces undesired types
.CW
   auto x = Type { init_value };
.R
.i1e


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

