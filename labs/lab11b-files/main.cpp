#include "Car.h"

#include <iostream>
#include <memory>

// Complete main
// Add code to perform the following:
//  1. print the car state
//  2. Accelerate to at least 50
//  3. print the car state
//  4. Turn the car to 0 degrees
//  5. print the car state
//  6. Stop the car & print final state
//
int main() {
  // Use this declaration
  // Change the car name, if you like
  std::unique_ptr<Car> c ( new Car {"Mesa Jolt"});

  return 0;
}
