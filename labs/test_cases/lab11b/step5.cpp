#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Car.h>
#include <doctest.h>

using mesa::Direction;

SCENARIO( "Accelerate a Car") {
  GIVEN( "a default Car" ) {
    mesa::Car c;
    THEN( "the default speed should be 0" ) {
      CHECK (c.speed() == doctest::Approx(0));
    }
    WHEN( "accelerate(1) is called the first time" ) {
      auto actual = c.accelerate(1);
      THEN( "the new speed should be 1" ) {
        CHECK (1 == doctest::Approx(actual));
      }
    }
    WHEN( "accelerate(-1) is called the first time" ) {
      auto actual = c.accelerate(-1);
      THEN( "the new speed should be 0" ) {
        CHECK (0 == doctest::Approx(actual));
      }
    }
    WHEN( "accelerate(1.5) is called twice (after 1,-1)" ) {
      double actual;
      actual = c.accelerate(1.5);
      actual = c.accelerate(1.5);
      THEN( "the new speed should be 4.5" ) {
        CHECK (4.5 == doctest::Approx(actual));
      }
      AND_WHEN( "accelerate(-2.0) is called once" ) {
        actual = c.accelerate(-2.0);
        THEN( "the new speed should be 5.5 (acceleration rate is now 1.0)" ) {
          CHECK (5.5 == doctest::Approx(actual));
        }
      }
    }
  }

  GIVEN( "a default Car" ) {
    mesa::Car c;
    WHEN( "accelerate(1.5) is called twice" ) {
      double actual;
      actual = c.accelerate(1.5);
      actual = c.accelerate(1.5);
      THEN( "the new speed should be 4.5" ) {
        CHECK (4.5 == doctest::Approx(actual));
      }
      AND_WHEN( "accelerate(-1.5) is called twice" ) {
        actual = c.accelerate(-1.5);
        actual = c.accelerate(-1.5);
        THEN( "the new speed should be 6 (acceleration rate is now 0)" ) {
          CHECK (6 == doctest::Approx(actual));
        }
      }
      AND_WHEN( "accelerate(-2.5) is called three times" ) {
        actual = c.accelerate(-2.5);
        actual = c.accelerate(-2.5);
        actual = c.accelerate(-2.5);
        THEN( "the new speed should be 0" ) {
          CHECK (0 == doctest::Approx(actual));
        }
      }
    }
  }

}




