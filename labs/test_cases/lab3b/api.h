#pragma once

//
// A common interface used by solutions #3 and #4
//

#include <string>
#include <vector>

using std::size_t;
using std::vector;
using std::string;

namespace mesa {

  /**
   * a POD for a 3 sided polygon, with sides a, b & c.
   * c = the hypotenuse
   */
  struct trigon {
    float a;
    float b;
    float c;
  };

  /**
   * construct a pythagorean triple from two integers,
   * where m > n > 0.
   */
  trigon make_triple (const uint16_t m, const uint16_t n); 

  /**
   * resize a triangle by multiplying each side by a scale factor.
   * @param triangle the trigon to be modified 
   * @param factor the scaling factor applied to the triangle
   *        values < 1.0 reduce the length of each side
   *        factor must be > 0.01
   *        if factor is <= 0.01 the triangle lengths are not changed
   */
  void  scale (trigon& triangle, const float factor);

  /**
   * Compute the area of a triangle.
   */
  float  area (const trigon& triangle);

  /**
   * Find the triangle with the smallest area.
   */
  trigon smallest (const vector<trigon>& shapes);

  /**
   * Find the first word in the list according to it's lexical order, 
   * also known as: dictionary order, alphabetical order.
   *
   * @return the alphabetically 'first' word in a word list.
   */
  string first (const vector<string>& words);

}



