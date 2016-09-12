
.TL
.gcolor blue
Classes and enumerations
.gcolor
.LP
.ce 1
Week 4
.SS Overview
.IT Reflection
.IT Enumerations
.SS Reflection
.IT Some common themes from recent reflections
.i1 Linux 'cheat sheet'
.i2 So that we can keep up with your demonstrations
.i2 A list of commands to use buffy more easily
.i1 Bonus questions n labs or quizzes
.i1 More time for labs
.i1 More explanation and examples
.i2 Which kinda conflicts with the previous request
.i1 More examples outside of the book expressed in labs
.SS Linux cheats
.IT What cheats would be most useful?
.IT This is a very broad request
.i1 I suspect, it's less about Linux and more about how to 'follow along'?
.IT What would really be helpful here?
.IT There is no requirement to use buffy for all your work.
.IT Personally I would recommend CodeBlocks over VisualStudio
.i1 Especially since it's week 4 and still not installed in the lab
.i1 And it creates non-portable code
.i1 Which will create more work for you when you finally need to get your project running on buffy
.bp
.IT An asside about "online code interpreters"
.i1 a.k.a \fCcpp.sh\fR
.i1 Long term, I think you are hurting yourself if you choose to use this vice a real compiler
.i1 Labs are an opportunity to learn a programming environment
.i2 It's about more than just finishing this lab
.i1 When it's time for you to work on your project, the pain will start to hit
.i1 My advice?  Take your lumps now
.SS Labs and Time management
.IT What is more important
.i1 Me talking?
.i1 You banging out code?
.IT Labs and quizzes already take longer than I would like
.i1 My initial estimates appear off by about 100%
.i1 I'm reluctant to make long activities longer
.i2 Bad lab smell
.i1 Thoughts?
.IT More time for labs
.i1 The only way to achieve this is for me to talk lots less
.i2 Which I am OK with
.i1 If I only provided slides, labs & examples...
.i1 And let people go though it and ask questions...
.i1 Would people generally feel that was enough?

.SS Enumerations
.IT Consider the following program:
\s-8
.CW
  #include <iostream>
  enum Direction { north, south, east, west };

  static void show_direction(const int direction) {
    std::cout << "Direction: " << direction << "\\n";
  }

  int main() {
    Direction dir = west;
    show_direction(dir);
    int num = dir;
    show_direction(num);

    for (int i = north; i < 8; ++i) show_direction(i);
    return 0;
  }
.R
\s+8
.bp
.nr step 1 1
\n[step].  Does this program compile without error?  

.RS
Without warning? 

Without actually compiling, list them.
.RE


\n+[step].  What problems \fIdoes\fR this program have?

.bp
.RS
a.  The old-style enum \fCDirection\fR is not type safe.

b.  The old-style enum means that \fCDirection\fR 
.RS
can be assigned any \fCint\fR.
.RE

c.  The line \fCint num = dir;\fR also assigns the enum to an int,
.RS
which is meaningless.
.RE

d.  The function \fCshow_direction\fR 
.RS
implies it takes a direction as argument, 

but any integer value is processed without complaint.
.RE

e.  The function \fCshow_direction\fR 
.RS
never prints an actual direction, 

the value is always a number.

Even when the number is a valid \fCDirection\fR.
.RE

.RE
.SS Fixing the Direction enum
.IT Old style enums are limited and not type safe
.IT C++11 \*[c]class enum\*[r]s are type safe
.i1 But still lack many of the conveniences found in other languages
.i2 A C++ \*[c]class enum\*[r] is \fBnot\fR a \*[c]class\*[r]
.i2 Compare to Java, where it actually is a class
.i1 A \*[c]class enum\*[r] is lightweight for efficiency reasons
.i2 But we can add convenience functions
.bp
.IT Change our \*[c]enum\*[r] to be a \*[c]class enum\*[r]
.IT move \fCDirection.h\fR to a separate compilation unit
.IT Provide machinery to transform our enum in a controlled way
.i1 A \*[c]map\*[r] to associate enum values with printable strings
.i1 An array to allow iterating over the \*[c]class enum\*[r] values.

.IT See this weeks example code
