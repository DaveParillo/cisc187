#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <lab7b.h>
#include <doctest.h>
#include <string>

SCENARIO( "Transform a string to lower case") {

  GIVEN( "a valid string" ) {
    WHEN( "HELLO is provided" ) {
      string orig = "HELLO";
      string expected = "hello";
      string actual = mesa::to_lower(orig);
      THEN( "the string should become hello" ) {
        REQUIRE(actual == expected);
      }
    }
    WHEN( "'Goodbye, World!' is provided" ) {
      string orig = "Goodbye, World!";
      string expected = "goodbye, world!";
      string actual = mesa::to_lower(orig);
      THEN( "the string should become 'goodbye, world!'" ) {
        REQUIRE(actual == expected);
      }
    }
    WHEN( "'ncdSNCVFIEncGckdJdXsM' is provided" ) {
      string orig = "ncdSNCVFIEncGckdJdXsM";
      string expected = "ncdsncvfiencgckdjdxsm";
      string actual = mesa::to_lower(orig);
      THEN( "the string should become 'ncdsncvfiencgckdjdxsm'" ) {
        REQUIRE(actual == expected);
      }
    }
  }
}

SCENARIO( "Compute the invariants of to_lower") {

  GIVEN( "an empty string" ) {
    WHEN( "nothing is provided" ) {
      string orig;
      string expected;
      string actual = mesa::to_lower(orig);
      THEN( "nothing should be returned" ) {
        REQUIRE(actual == expected);
      }
    }
  }
}




