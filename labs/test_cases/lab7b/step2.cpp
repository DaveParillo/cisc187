#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <lab7b.h>
#include <doctest.h>
#include <string>

using std::string;

SCENARIO( "Transform a string to lower case") {

  GIVEN( "a valid string" ) {
    WHEN( "HELLO is provided" ) {
      string orig = "HELLO";
      string expected = "hello";
      string actual = mesa::to_lower(orig);
      THEN( "the string should become hello" ) {
        REQUIRE(actual.compare(expected) == 0);
      }
    }
    WHEN( "'Goodbye, World!' is provided" ) {
      string orig = "Goodbye, World!";
      string expected = "goodbye, world!";
      string actual = mesa::to_lower(orig);
      THEN( "the string should become 'goodbye, world!'" ) {
        REQUIRE(actual.compare(expected) == 0);
      }
    }
    WHEN( "'ncdSNCVFIEncGckdJdXsM' is provided" ) {
      string orig = "ncdSNCVFIEncGckdJdXsM";
      string expected = "ncdsncvfiencgckdjdxsm";
      string actual = mesa::to_lower(orig);
      THEN( "the string should become 'ncdsncvfiencgckdjdxsm'" ) {
        REQUIRE(actual.compare(expected) == 0);
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
        REQUIRE(actual.compare(expected) == 0);
      }
    }
  }
}




