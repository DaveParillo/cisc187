.ds CH Lab #11a: ADT's and classes
.TL
\*[CH]
.NH
Tiny, simple classes: 4 points, 90 minutes \fImaximum\fR
.LP
Design and implement a few simple classes.  
The goal is become comfortable writing code in a new style.
That is, encapulating functions inside classes.

These classes do not need to reside in namepsace mesa.

Ensure all class data is private and implement the following:
.RS
.nr step 0 1
.IP \n+[step].
Create the files \fClab11a.h\fR and \fClab11a.cpp\fR.

.IP \n+[step].
Define a class \*[c]Clock\*[r] in file \fClab11a.h\fR.
.RS
.IP a.
It should have 1 member to store the time in a \*[c]double\*[r].
.IP b.
Add two functions to the class named \*[c]time\*[r] to change and retrieve the time.
.IP c.
Implement the class in \fClab11a.cpp\fR.
.RE
.IP \n+[step].
Define a class \*[c]Complex\*[r] in file \fClab11a.h\fR.
.RS
.IP a.
Add two \*[c]double\*[r] member variables: one for the real part of the number and one for the imaginary part
.IP b.
Create a default constructor to initialize the number to (0,0).
Use initializer list syntax.
.IP c.
Create a two argument constructor to initialize the number to 
.br
(double real, double imaginary).
.IP d.
Add functions to retrieve the complex value components (real part and imaginary part).
.IP e.
Implement the class in \fClab11a.cpp\fR.
.RE
.IP \n+[step].
Define a class \*[c]Truck\*[r] in file \fClab11a.h\fR.
.RS
.IP a.
Define a \*[c]uint16_t\*[r] member variable to store the number of tires on the vehicle.
.br
Create a default constructor to initialize the tires to 6.
.IP b.
Create a one argument constructor to initialize the tires to a provided value.
.IP c.
Add a \*[c]void\*[r] function \*[c]pop_tire\*[r] that reduces the number of tires by 1.
.br
Do not allow this function to reduce the number when the number of tires is already 0.
.IP d.
Add a \*[c]uint16_t\*[r] function \*[c]tires\*[r] that returns the number of tires.
.IP e.
Implement the class in \fClab11a.cpp\fR.
.RE
.IP \n+[step].
Create a \*[c]Dog\*[r] class from the following \*[c]struct\*[r]:
.CW
  enum class Size {SMALL, MEDIUM, LARGE};

  struct Dog {
    std::string  name;
    Size sz;
  };              
.R
.RS
.IP a.
Refactor the \*[c]struct\*[r] into a \*[c]class\*[r] in file \fClab11a.h\fR.  
.br
Make \fCname\fR and \fCsz\fR private.
.bp
.IP b.
Add a constructor so that the dog name and  size can be set when a Dog is created.
.IP c.
Add default values for your Dog class: \fC"Fido"\fR and \fCSize::MEDIUM\fR.
.IP d.
Add functions to retrieve name and Size.
.br
Add a function to change the name of a Dog.
.IP e.
Add a function \*[c]std::string Dog::bark() const\*[r] such that:
.RS
.IP \(bu
LARGE dogs return "Woof"
.IP \(bu
MEDIUM dogs return "Ruff"
.IP \(bu
SMALL dogs return "Yip"
.RE
.RE
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab11a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab11a
.R

Consider writing a program that uses the classes implemented in this lab.

