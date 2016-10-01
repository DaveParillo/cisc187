#include <cassert>
#include <iostream>
#include "Color.h"
#include "ColorPoint.h"
#include "Point.h"

// This example adds a 'color' feature to a point using inheritance
//
// Not reccommended.
//
int main ()
{
  Point      a {3, 4};
  ColorPoint b {3, 4, Color::RED};
  ColorPoint c {3, 4, Color::BLUE};

  assert (a == b);
  assert (b == a);
  assert (a == c);

  assert (b != c);  // ouch! a == b AND a == c, but b != c
  
  std::cout << "program complete.  all assertions in this program are true\n";
}


