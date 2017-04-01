#include <cmath>
#include <iostream>

#include "Car.h"

// Implement a steer function for a Car
// Given a steering direction, (LEFT or RIGHT)
// modify heading_ and return the new heading_
//
// Do not allow the steering angle to go
// beyond +/- max_angle
int Car::steer(Direction dir) {
  const static int max_angle = 10;
  return 0;
}

// Implement an acceleration function
// Given a rate of change, modify speed_
// and return the new speed_
//
// Do not allow the steering angle to go
// beyond +/- max_rate
double Car::accelerate(double rate) {
  const static double max_rate = 3.5;
  return 0;;
}

// Implement an ostream overload that produces output
// similar to
// name \t location \t speed \t	heading
std::ostream& operator<<(std::ostream &os, const Car& rhs) {
  return os;
}

// Implement an ostream overload to stream a point 
std::ostream& operator<<(std::ostream &os, const Point& rhs) {
  return os;
}

// Don't edit this function
// Calling this function once is like incrementing
// forward in time by one step.
//
// This function will modify the location of a car 
// based on the current values of heading_ and speed_
//
void Car::update() {
  static const double pi   = std::acos(-1);
  static const double dtor = pi/180.0;
  auto angle = dtor * heading_;
  location_.x = location_.x + std::cos(angle) * speed_;
  location_.y = location_.y - std::sin(angle) * speed_;
}

