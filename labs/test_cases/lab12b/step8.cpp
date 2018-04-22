#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Rational.h>
#include <doctest.h>

const Rational zero = Rational{0};
const Rational one = Rational{1};

SCENARIO( "Check multiplication") {
  GIVEN( "a single rational" ) {
    WHEN("multiplied to itself") {
      THEN( "it should equal a*a" ) {
        REQUIRE (one*one == one);
        REQUIRE (Rational{13/3}+Rational{13/3} == Rational{26/3});
      }
    }
    WHEN("zero is multiplied by anything") {
      THEN( "the result is zero" ) {
        REQUIRE (zero*zero == zero);
        REQUIRE (one*zero == zero);
        REQUIRE (zero*one == zero);
        REQUIRE (Rational{2}*zero == zero);
        REQUIRE (zero*Rational{-22,7} == zero);
      }
    }
    WHEN("one is multiplied by anything") {
      THEN( "the value is unchanged" ) {
        REQUIRE (zero*one == zero);
        REQUIRE (Rational{13}*one == Rational{13});
        REQUIRE (Rational{-34}*one == Rational{-34});
        REQUIRE (Rational{1,9}*one == Rational{1,9});
        REQUIRE (one*Rational{-22,7} == Rational{-22,7});
      }
    }
  }
  GIVEN( "two rationals" ) {
    REQUIRE (Rational{2} * Rational{3} == Rational{6});
    REQUIRE (Rational{5} * Rational{-4} == Rational{-20});
    WHEN("using *= ") {
      Rational a {1,2};
      Rational b {2};
      Rational c {1,2};
      Rational d {2};
      THEN( "a *= b should change a in the same manner as a = a*b" ) {
        REQUIRE (a*b == c*d);
        a*=b;
        REQUIRE (a == c*d);
      }
    }
  }
}



