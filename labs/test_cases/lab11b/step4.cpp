#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Car.h>
#include <doctest.h>

using mesa::Direction;

SCENARIO( "Steer a Car") {
  GIVEN( "a default Car" ) {
    mesa::Car c;
    THEN( "the default heading should be 0" ) {
      CHECK (c.heading() == doctest::Approx(0));
    }
    AND_WHEN( "steer(RIGHT) is called the first time" ) {
      auto actual = c.steer(Direction::RIGHT);
      THEN( "the new direction should be 1" ) {
        CHECK (1 == doctest::Approx(actual));
      }
    }
    AND_WHEN( "steer(LEFT) is called the first time" ) {
      auto actual = c.steer(Direction::LEFT);
      THEN( "the new direction should be 359" ) {
        CHECK (359 == doctest::Approx(actual));
      }
    }
    WHEN( "steer(RIGHT) is called twice" ) {
      double actual;
      actual = c.steer(Direction::RIGHT);
      actual = c.steer(Direction::RIGHT);
      THEN( "the final direction should be 3" ) {
        CHECK (3 == doctest::Approx(actual));
      }
    }
    WHEN( "steer(LEFT) is called 4 times" ) {
      double actual;
      actual = c.steer(Direction::LEFT);
      actual = c.steer(Direction::LEFT);
      actual = c.steer(Direction::LEFT);
      actual = c.steer(Direction::LEFT);
      THEN( "the final direction should be 350" ) {
        CHECK (350 == doctest::Approx(actual));
      }
    }
    WHEN( "steer(RIGHT) is called 13 times" ) {
      double actual;
      for (auto i = 0; i < 13; ++i) actual = c.steer(Direction::RIGHT);
      THEN( "the final direction should be 85" ) {
        CHECK (85 == doctest::Approx(actual));
      }
    }
    WHEN( "steer(LEFT) is called 13 times" ) {
      double actual;
      for (auto i = 0; i < 13; ++i) actual = c.steer(Direction::LEFT);
      THEN( "the final direction should be 275" ) {
        CHECK (275 == doctest::Approx(actual));
      }
    }
    WHEN( "steer(LEFT) is called 13 times, followed by CENTER 13 more times" ) {
      double actual;
      for (auto i = 0; i < 13; ++i) actual = c.steer(Direction::LEFT);
      for (auto i = 0; i < 13; ++i) actual = c.steer(Direction::CENTER);
      THEN( "the final direction should be 275" ) {
        CHECK (275 == doctest::Approx(actual));
      }
    }
  }

}


