#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Car.h>
#include <doctest.h>

SCENARIO( "update a Car") {
  GIVEN( "a default Car" ) {
    mesa::Car c;
    WHEN( "accelerate(1), then update are called once" ) {
      auto actual = c.accelerate(1);
      c.update();
      THEN( "the {x,y} location should be {1,0}" ) {
        CHECK (1 == doctest::Approx(actual));
        CHECK (1 == doctest::Approx(c.location().x));
        CHECK (0 == doctest::Approx(c.location().y));
      }
    }
  }
  GIVEN( "a default Car" ) {
    mesa::Car c;
    WHEN( "accelerate(1), then steer(RIGHT), then update is called once" ) {
      c.accelerate(1);
      c.steer(mesa::Direction::RIGHT);
      c.update();
      THEN( "the {x,y} location should be {0.999,0.0175}" ) {
        CHECK (0.9998 == doctest::Approx(c.location().x).epsilon(0.01));
        CHECK (0.0175 == doctest::Approx(c.location().y).epsilon(0.01));
      }
      WHEN( "update is called 3 more times" ) {
        c.update();
        c.update();
        c.update();
        THEN( "the {x,y} location should be {3.99,0.07}" ) {
          CHECK (3.99 == doctest::Approx(c.location().x).epsilon(0.01));
          CHECK (0.07 == doctest::Approx(c.location().y).epsilon(0.01));
        }
      }
    }
  }

}




