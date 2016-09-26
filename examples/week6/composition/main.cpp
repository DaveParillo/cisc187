#include <cassert>
#include <iostream>
#include "Color.h"
#include "ColorPoint.h"
#include "Point.h"

// This example correctly adds a 'color' feature to a point using composition
//
// It's still very minimal.
//
int main ()
{
  Point p {3,4};
  ColorPoint cp {p, Color::RED};
  ColorPoint cp2 {p, Color::BLUE};

  assert (p == cp.as_point());
  assert (cp != cp2);
  
}
