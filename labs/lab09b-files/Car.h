#pragma once

#include <cassert>
#include <functional>
#include <iosfwd>
#include <string>

enum class Direction { CENTER, LEFT, RIGHT };
struct Point {
  double x;   
  double y;
};

/**
 * A simple Car.
 * You may add 'getters' for private members,
 * but do NOT add any functions to directly set
 * private member values.
 *
 * Functions that use this class must use steer, accelerate, and update
 * to change the state of the Car.
 */
class Car {
  private:
    std::string name_;      // Make/model of this car
    double speed_;
    int    heading_;
    Point  location_;       // relative position of car

  public:
    /**
     * Create a new Car.
     * @param name the make/model of this Car.
     */

    /**
     * Steer the car by changing direction.
     * Choices are LEFT, RIGHT, and CENTER.
     * CENTER means no change in direction.
     */
    int steer (Direction dir);
    /**
     * Change the car speed by (de)accelerating.
     * Positive values will increase car speed.
     * Negative values will reduce car speed.
     * Zero values leave the car speed unchanged.
     */
    double accelerate (double rate);

    /**
     * Update car location based on current car speed and heading.
     */
    void   update();

};

std::ostream& operator<<(std::ostream& os, const Car& rhs);
std::ostream& operator<<(std::ostream& os, const Point& rhs);


namespace mesa {

  //  clamp function is not in the standard until c++17
  template<class T, class Compare>
  constexpr const T& clamp( const T& v, const T& lo, const T& hi, Compare comp )
  {
    return assert( !comp(hi, lo) ),
           comp(v, lo) ? lo : comp(hi, v) ? hi : v;
  }


  template<class T>
  constexpr const T& clamp( const T& v, const T& lo, const T& hi )
  {
      return clamp( v, lo, hi, std::less<T>() );
  }

}

