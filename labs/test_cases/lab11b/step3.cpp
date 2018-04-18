#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Car.h>
#include <doctest.h>

SCENARIO( "Test Car constrcution") {
  GIVEN( "a default Car" ) {
    mesa::Car c;
    THEN( "the default speed should be 0" ) {
      CHECK (c.speed() == doctest::Approx(0));
    }
    AND_THEN( "the default heading should be 0" ) {
      CHECK (c.heading() == doctest::Approx(0));
    }
    AND_THEN( "the default location should be i{0,0}" ) {
      CHECK (c.location().x == doctest::Approx(0));
      CHECK (c.location().y == doctest::Approx(0));
    }
  }

}


