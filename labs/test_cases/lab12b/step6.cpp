#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Rational.h>
#include <doctest.h>

const Rational zero = Rational{0};
const Rational one = Rational{1};

SCENARIO( "Check addition") {
  GIVEN( "a single rational" ) {
    WHEN("added to itself") {
      THEN( "it should equal a+a" ) {
        REQUIRE (one+one == Rational{2});
        REQUIRE (Rational{13/3}+Rational{13/3} == Rational{26/3});
      }
    }
    WHEN("zero is added to anything") {
      THEN( "the identity value should be preserved" ) {
        REQUIRE (zero+zero == zero);
        REQUIRE (one+zero == one);
        REQUIRE (zero+one == one);
        REQUIRE (Rational{2}+zero == Rational{2});
        REQUIRE (zero+Rational{-22,7} == Rational{-22,7});
      }
    }
    WHEN("one is added to anything") {
      THEN( "the value should increase by 1" ) {
        REQUIRE (Rational{2}+one == Rational{3});
        REQUIRE (one+Rational{-22,7} == Rational{-15,7});
      }
    }
  }
  GIVEN( "two rationals" ) {
    REQUIRE (Rational{2} + Rational{3} == Rational{5});
    REQUIRE (Rational{2} + Rational{-2} == zero);
    WHEN("using += ") {
      Rational a {1,2};
      Rational b {2};
      Rational c {1,2};
      Rational d {2};
      THEN( "a += b should change a in the same manner as a = a+b" ) {
        REQUIRE (a+b == c+d);
        a+=b;
        REQUIRE (a == c+d);
      }
    }
  }
}



