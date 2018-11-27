#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <Rational.h>
#include <doctest.h>
#include <cstdint>

SCENARIO( "Test Rational construction") {
  GIVEN( "a default rational" ) {
    Rational<int> r;
    THEN( "the default value should be 0" ) {
      REQUIRE (r.numerator() == 0);
      REQUIRE (r.denominator() == 1);
    }
  }
  GIVEN( "a rational constructed with a int32_t" ) {
      Rational<std::int32_t> r;
      THEN( "the value should be 0" ) {
        REQUIRE (r.numerator() == 0);
        REQUIRE (r.denominator() == 1);
      }
    }
    GIVEN( "a rational constructed with a size_t" ) {
      Rational<std::size_t> r;
      THEN( "the value should be 0" ) {
        REQUIRE (r.numerator() == 0);
        REQUIRE (r.denominator() == 1);
      }
    }

    GIVEN( "a rational constructed with a long" ) {
      Rational<long> r;
      THEN( "the value should be 0" ) {
        REQUIRE (r.numerator() == 0);
        REQUIRE (r.denominator() == 1);
      }
    }

}



