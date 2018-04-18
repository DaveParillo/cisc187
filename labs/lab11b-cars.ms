.ds CH Lab #11b: Car abstraction
.so headings.ms
.TL
\*[CH]
.NH
Car abstraction: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
Implement some functions in a \fBvery\fR simple car simulation.
Some of the code has been provided.
You are expected to complete the rest.
The goal is to implement a car that can speed up, turn, 
and slow down.
.RS
.nr step 0 1
.IP \n+[step].
Create the files \fCCar.h\fR and \fCCar.cpp\fR.
.IP \n+[step].
Define an \*[c]enum class\*[r] \*[c]Direction\*[r] in file \fCCar.h\fR:
.CW
  enum class Direction { CENTER, LEFT, RIGHT };
.R
.br
Define a \*[c]struct\*[r] \*[c]Point\*[r] in file \fCCar.h\fR:
.CW
  struct Point {
    double x;   
    double y;
  };
.R
.br
Define both of these types in the \*[c]namespace\*[r] mesa.
.IP \n+[step].
Declare a class \*[c]Car\*[r] in file \fCCar.h\fR:
.CW
  namespace mesa {
    \m[green]/**
     * An abstraction demonstration.
     *
     * Functions that use this class must use steer,
     * accelerate, and update to change the state of the Car.
     */\m[]
    class Car {
      \m[blue]private:\m[]
        double speed_;
        double heading_;
        Point  location_;   \m[green]// relative position of car\m[]
        double angle_ = 0;  \m[green]// current steering angle\m[]
        double rate_ = 0;   \m[green]// current change in speed\m[]
      \m[blue]public:\m[]
        \m[green]// getters\m[]
        double speed()    const { return speed_;    }
        double heading()  const { return heading_;  }
        Point  location() const { return location_; }
    };
  }
.R
.bp
.IP \n+[step].
Add a public member function to the \*[c]Car\*[r] class to steer the car:
.CW
  \m[green]/**
   * Steer the car by changing direction.
   * Choices are LEFT, RIGHT, and CENTER.
   * CENTER means no change in direction.
   * @return a new heading
   */\m[]
  double steer (Direction dir);

.R
.br
This function should modify the steer \*[c]angle_\*[r],
which then modifies \*[c]heading_\*[r].

Do not allow the steer angle to grow > +10 or < -10
regardless of how many times this function is called.
.IP \n+[step].
Add a public member function to the \*[c]Car\*[r] class to change the car acceleration:
.CW
  \m[green]/**
   * Change the car speed by (de)accelerating.
   * Positive values will increase car speed.
   * Negative values will reduce car speed.
   * Zero values leave the car speed unchanged.
   * @return a new speed
   */\m[]
  double accelerate (double rate);

.R
.br
This function should modify the car \*[c]rate_\*[r],
which then modifies \*[c]speed_\*[r].

Do not allow the acceleration rate to grow > +3 or < -3
regardless of how many times this function is called.

.IP \n+[step].
Add a public member function to the \*[c]Car\*[r] class to move the car each simulation time step:
.CW
  \m[green]/**
   * Move car based on current speed and heading.
   */\m[]
  void   update();
.R

Use this code as the implementation for the update function:
.CW
  void mesa::Car::update() {
    static const double dtor = std::acos(-1)/180.0;
    const auto angle = dtor * heading_;
    location_.x += std::cos(angle) * speed_;
    location_.y += std::sin(angle) * speed_;
  }
.R

You will need to \*[c]#include <cmath>\*[r] to support this function.

.RE

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab11b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab11b
.R

Consider writing a program that uses your Car class.

