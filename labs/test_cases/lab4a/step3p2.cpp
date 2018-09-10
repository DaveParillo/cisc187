#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <square.h>
#include <doctest.h>

#include <iostream>
#include <sstream>
#include <string>

SCENARIO( "square a number") {

  GIVEN( "signed integral types" ) {
    WHEN( "the value is an int" ) {
      THEN( "the function should square it" ) {
        REQUIRE (square(2) == 4);
      }
    }
    WHEN( "the value is an int32_t" ) {
      int32_t value = 987654;
      THEN( "the function should square it" ) {
        REQUIRE (square(value) == value*value);
      }
    }
    WHEN( "the value is a long" ) {
      long value = -31415926;
      THEN( "the function should square it" ) {
        REQUIRE (square(value) == value*value);
      }
    }
    WHEN( "the value is a wchar_t" ) {
      wchar_t value = 120;
      THEN( "the function should square it" ) {
        REQUIRE (square(value) == value*value);
      }
    }
    WHEN( "the value is a double" ) {
      double value = 6.28;
      THEN( "the function should square it" ) {
        REQUIRE (square(value) == value*value);
      }
    }
    WHEN( "the value is a negative long double" ) {
      long double value = -10e10;
      THEN( "the function should square it" ) {
        REQUIRE (square(value) == value*value);
      }
    }
  
  }

}


