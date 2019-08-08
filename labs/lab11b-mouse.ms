.ds CH Lab #11b: Mouse class
.so headings.ms
.TL
\*[CH]
.NH
Mouse abstraction: 4 points, 90 minutes \fImaximum\fR
.LP
Implement some functions in a \fBvery\fR simple mouse simulation.
The goal is to implement a mouse that can turn and move in a specified direction.

Define all of the types in the \*[c]namespace\*[r] mesa.
.RS
.nr step 0 1
.IP \n+[step].
Create the files \fCmouse.h\fR, \fCmouse.cpp\fR,
\fCpoint.h\fR, and \fCpoint.cpp\fR.
.IP \n+[step].
Define a scoped \*[c]enum\*[r] named \*[c]direction\*[r] in file \fCmouse.h\fR.
It should define the following values:
.CW
  CENTER, LEFT, RIGHT, UP, and DOWN
.R

The order does not matter, except for \*[c]CENTER\*[r], which should be first.
.IP \n+[step].
Define a \*[c]struct\*[r] \*[c]point\*[r] in file \fCpoint.h\fR:
.CW
  struct point {
    int x;   
    int y;
  };
.R

Ensure your point has a default constructor.
.IP \n+[step].
Create a 2 argument constructor to make a point from 2 ints.
Make sure the first argument initializes \*[c]point.x\*[r].
.IP \n+[step].
This test verifies your point is 'copy constructible'.
Depending on how you implemented your point, 
this test may pass without your doing anything.

If this test fails,
then create a copy constructor to make a point from another point.

.IP \n+[step].
Create 2 functions to check if 2 points are equivalent to eachother:
.CW
  inline
  bool operator==(const point& lhs, const point& rhs) { . . . 
  inline
  bool operator!=(const point& lhs, const point& rhs) { . . . 
.R

Define these in point.h, but do \fBnot\fR put them in the mesa namespace.


.IP \n+[step].
Declare a class \*[c]mouse\*[r] in file \fCmouse.h\fR:
Create private member variables for the mouse name and the mouse position.

The name should be stored in a \*[c]std::string\*[r] and
the position should be stored in a \*[c]mesa::point\*[r].

The default name of your mouse should be 'Alice'.

Add public member functions to retrieve the name and location of a mouse:
.CW
  std::string name ();
  point location ();
.R
.IP \n+[step].
Create a 1 arg mouse constructor, so that we can create a mouse with a name.

Ensure your mouse also has a default constructor.
.IP \n+[step].
Add a public member function to the \*[c]mouse\*[r] class to move the mouse:
.CW
  \m[green]/**
   * Move the mouse a distance in a given direction.
   *
   * @param dir movement direction
   *        Choices are UP, DOWN, LEFT, RIGHT, and CENTER.
   *        CENTER means no change in direction.
   *
   *        UP and RIGHT are positive movements in the
   *        y  and x directions respectively.
   *
   * @param distance amount to move
   *        distance < 0 is ok: means move in reverse
   * @return the new mouse position
   */\m[]
  point move (direction dir, int distance);

.R
.br
This function should modify the mouse \*[c]location\*[r].
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab11b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab11b
.R

.SH
Try This!
.LP
Implement a main that uses the classes implemented in this lab.

Performing this extra step will help you understand how to use
the functions you created in the lab.



