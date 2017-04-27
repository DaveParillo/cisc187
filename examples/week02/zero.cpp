//
// floating point values have two ways to represent zero
//
// see:
// https://en.wikipedia.org/wiki/Signed_zero
// and
// http://www.volkerschatz.com/science/float.html
//
#include <iostream>

int main() {

  // C++ integral types store negatives as the two's complement
  // of the positive number.
  //   1. Makes most arithmetic consistent for negative & pos numbners
  //   2. No inconsistency representing 0
  int x = -1;
  int y = ~x;  // one's complement of x
  int z = x * -0;

  std::cout << "x: " << x << '\n';
  std::cout << "y: " << y << '\n';
  std::cout << "z: " << z << '\n';

  // The IEEE standard for floating point numbers requires both +0 and −0
  double u = -1.0;
  double v = u * 0.0;
  double w = ~u;

  std::cout << "u: " << u << '\n';
  std::cout << "v: " << v << '\n';
  std::cout << "w: " << w << '\n';
}
