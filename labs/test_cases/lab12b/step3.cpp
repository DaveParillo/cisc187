#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Rational.h>
#include <doctest.h>

SCENARIO( "Test Rational construction") {
  GIVEN( "a default rational" ) {
    Rational r;
    THEN( "the default value should be 0" ) {
      REQUIRE (r.numerator() == 0);
      REQUIRE (r.denominator() == 1);
    }
  }
  GIVEN( "a rational constructed with one argument" ) {
    WHEN("the numerator is 0") {
      Rational r {0};
      THEN( "the value should be 0" ) {
        REQUIRE (r.numerator() == 0);
        REQUIRE (r.denominator() == 1);
      }
    }
    WHEN("the numerator is 1") {
      Rational r {1};
      THEN( "the value should be 1" ) {
        REQUIRE (r.numerator() == 1);
        REQUIRE (r.denominator() == 1);
      }
    }
    WHEN("the numerator is -1") {
      Rational r {-1};
      THEN( "the value should be -1" ) {
        REQUIRE (r.numerator() == -1);
        REQUIRE (r.denominator() == 1);
      }
    }
    WHEN("the numerator is 13") {
      Rational r {13};
      THEN( "the value should be 13" ) {
        REQUIRE (r.numerator() == 13);
        REQUIRE (r.denominator() == 1);
      }
    }
  }

  GIVEN( "a rational constructed with two parameters" ) {
    WHEN("the values are {0,1}") {
      Rational r {0,1};
      THEN( "the value should be 0" ) {
        REQUIRE (r.numerator() == 0);
        REQUIRE (r.denominator() == 1);
      }
    }
    WHEN("the values are {-22,7}") {
      Rational r {-22,7};
      THEN( "the value should be -22/7" ) {
        REQUIRE (r.numerator() == -22);
        REQUIRE (r.denominator() == 7);
      }
    }
    WHEN("the values are {-22,7}") {
      Rational r {-22,7};
      THEN( "the value should be -22/7" ) {
        REQUIRE (r.numerator() == -22);
        REQUIRE (r.denominator() == 7);
      }
    }
    WHEN("the values are {3,0}") {
      Rational r {3,0};
      THEN( "the value should be 3/0" ) {
        REQUIRE (r.numerator() == 3);
        REQUIRE (r.denominator() == 0);
      }
    }
  }

}


SCENARIO ("test invariants of construction") {
  GIVEN ("a rational number with numerator and denominator 0") {
    WHEN("the numerator is 0, gcd(0,0) will segfault") {
      Rational r {0,0};
      THEN( "just assign 0 to both and do not try to compute gcd(0,0)" ) {
        REQUIRE (r.numerator() == 0);
        REQUIRE (r.denominator() == 0);
      }
    }
  }
}



