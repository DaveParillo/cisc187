
.TL
.gcolor blue
Classes and enumerations
.gcolor
.LP
.ce 1
Week 10
.SS Overview
.IT Classes
.i1 Anatomy of a class
.IT Enumerations

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
