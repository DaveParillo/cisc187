#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Car.h>
#include <doctest.h>

SCENARIO( "Test Point and Direction") {
  GIVEN( "a default Point" ) {
    mesa::Point p;
    THEN( "the default values should be 0,0" ) {
      CHECK (p.x == doctest::Approx(0));
      CHECK (p.y == doctest::Approx(0));
    }
    WHEN( "the values are set to -3.14,2.718" ) {
      p.x = -3.14;
      p.y = 2.718;
      THEN( "the values should be -3.14,2.718" ) {
        CHECK (p.x == doctest::Approx(-3.14));
        CHECK (p.y == doctest::Approx(2.718));
      }
    }
  }

  GIVEN( "a constructed Point" ) {
    mesa::Point p {3,5};
    THEN( "the values should be 3,5" ) {
      CHECK (p.x == doctest::Approx(3));
      CHECK (p.y == doctest::Approx(5));
    }
    WHEN( "the values are set to -3.14,2.718" ) {
      p.x = 8.14;
      p.y = -21.718;
      THEN( "the values should be 8.14,-21.718" ) {
        CHECK (p.x == doctest::Approx(8.14));
        CHECK (p.y == doctest::Approx(-21.718));
      }
    }
  }

  GIVEN( "a Direction enum" ) {
    using mesa::Direction;
    THEN( "the values CENTER, LEFT, and RIGHT should exist in that order" ) {
      CHECK (int(Direction::LEFT) == int(Direction::CENTER) + 1);
      CHECK (int(Direction::RIGHT) == int(Direction::CENTER) + 2);
    }
  }
}








