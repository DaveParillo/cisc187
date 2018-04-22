#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Rational.h>
#include <doctest.h>

static const Rational zero = Rational{0};
static const Rational one = Rational{1};
static const auto inf = Rational{0,0};

SCENARIO( "Check division") {
  GIVEN( "a single rational" ) {
    WHEN("divided into itself") {
      THEN( "result should equal 1" ) {
        REQUIRE (one/one == one);
        REQUIRE (Rational{3}/Rational{3} == one);
        REQUIRE (Rational{13/3}/Rational{13/3} == one);
      }
    }
    WHEN("one is divided into anything") {
      THEN( "the value should remain unchanged" ) {
        REQUIRE (Rational{2}/one == Rational{2});
        REQUIRE (Rational{-22,7}/one == Rational{-22,7});
        REQUIRE (Rational{1,2}/one == Rational{1,2});
      }
    }
    WHEN("zero is divided into anything") {
      THEN( "the result should be infinity" ) {
        REQUIRE (zero/zero == inf);
        REQUIRE (one/zero == inf);
        REQUIRE (Rational{2}/zero == inf);
        REQUIRE (Rational{-22,7}/zero == inf);
      }
    }
  }
  GIVEN( "two rationals" ) {
    REQUIRE (Rational{2} / Rational{3} == Rational{2,3});
    REQUIRE (Rational{2} / Rational{-2} == Rational{-1});
    REQUIRE (Rational{22,7} / Rational{-22,7} == Rational{-1});
    WHEN("using /= ") {
      Rational a {1,2};
      Rational b {2};
      Rational c {1,2};
      Rational d {2};
      THEN( "a /= b should change a in the same manner as a = a/b" ) {
        REQUIRE (a/b == c/d);
        a/=b;
        REQUIRE (a == c/d);
      }
    }
  }
}



