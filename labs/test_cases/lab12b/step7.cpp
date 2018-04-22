#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Rational.h>
#include <doctest.h>

const Rational zero = Rational{0};
const Rational one = Rational{1};

SCENARIO( "Check subtraction") {
  GIVEN( "a single rational" ) {
    WHEN("subtracted from itself") {
      THEN( "result should equal 0" ) {
        REQUIRE (one-one == zero);
        REQUIRE (Rational{13/3}-Rational{13/3} == zero);
      }
    }
    WHEN("zero is subtracted from anything") {
      THEN( "the identity value should be preserved" ) {
        REQUIRE (zero-zero == zero);
        REQUIRE (one-zero == one);
        REQUIRE (Rational{2}-zero == Rational{2});
        REQUIRE (Rational{-22,7}-zero == Rational{-22,7});
      }
    }
    WHEN("one is subtracted from anything") {
      THEN( "the value should decrease by 1" ) {
        REQUIRE (Rational{2}-one == one);
        REQUIRE (Rational{-22,7}-one == Rational{-29,7});
        REQUIRE (Rational{1,2}-one == Rational{-1,2});
      }
    }
  }
  GIVEN( "two rationals" ) {
    REQUIRE (Rational{2} - Rational{3} == Rational{-1});
    REQUIRE (Rational{2} - Rational{-2} == Rational{4});
    REQUIRE (Rational{22,7} - Rational{-22,7} == Rational{44,7});
    WHEN("using += ") {
      Rational a {1,2};
      Rational b {2};
      Rational c {1,2};
      Rational d {2};
      THEN( "a -= b should change a in the same manner as a = a-b" ) {
        REQUIRE (a-b == c-d);
        a-=b;
        REQUIRE (a == c-d);
      }
    }
  }
}



