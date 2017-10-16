.ds CH Lab #9a: ADT's and classes
.TL
\*[CH]
.NH
Tiny, simple classes: 50 points, 45 minutes \fImaximum\fR
.time_box
.QP
Design and implement a few simple classes.  
The goal is become comfortable writing code in a new style.
That is, encapulating functions inside classes.

Do not waste time making these classes "perfect."

Ensure all class data is private and implement the following:
.RS
.nr step 0 1
.IP \n+[step].
Create a simple 'Clock' class.
.RS
.IP a.
It should have 1 member string to store a time value.
.IP b.
Add functions to change and retrieve the time.
.IP c.
Use the assert macro to test these two functions work correctly.
.RE
.IP \n+[step].
Create a simple 'Complex' class.
.RS
.IP a.
It needs two member variables: one for the real part oof the number and one for the imaginary part
.IP b.
Create a default constructor to initialize the number to (0,0).
Use initializer list syntax.
.IP b.
Create a two argument constructor to initialize the number to (double real, double imaginary).
.IP c.
Add functions to retrieve the complex value components (real part and imaginary part).
.IP d.
Use the assert macro to test these two functions work correctly.
.RE
.IP \n+[step].
Create a simple 'Truck' class.
.RS
.IP a.
Define a member variable 'tires' to store the number of tires on the vehicle.
Initialize the variable to some value > 4.
.IP b.
Add a function 'pop_tire' that reduces the number of tires by 1.
.IP c.
Use the assert macro to test the class.
.RE
.bp
.NH
Dog class: 50 points, 45 minutes \fImaximum\fR
.time_box
.QP
Create a Dog class from the following \*[c]struct\*[r]:
.CW
  enum class Size {SMALL, MEDIUM, LARGE};

  struct Dog {
    std::string  name;
    Size sz;
  };              
.R

Keep definitions and declarations in separate compilation units.

.RS
.nr step 0 1
.IP \n+[step].
Transfer the struct to a class.  
Make \fCname\fR and \fCsz\fR private.
.IP \n+[step].
Add a constructor so that the dog size can be set when a Dog is initialized.
.IP \n+[step].
Implement \fCbark()\fR so that:
.RS
.IP \(bu
LARGE dogs say "Woof"
.IP \(bu
MEDIUM dogs say "Ruff"
.IP \(bu
SMALL dogs say "Yip"
.RE
.IP \n+[step].
Create a vector of 3 dogs.
Give them names and different sizes.
.IP \n+[step].
Have each Dog bark.
.IP \n+[step].
Write your Dog class so that it passes the unit tests provided. 
.RE

