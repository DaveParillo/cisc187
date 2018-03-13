#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <lab7b.h>
#include <doctest.h>
#include <map>
#include <string>
#include <sstream>

SCENARIO( "Overload operator<< for a map<string, size_t>") {

  GIVEN( "a valid map" ) {
    std::map<string, size_t> words;
    words["awesome"] = 7;
    words["make"] = 4;
    words["Bob"] = 3;
    words["Alice"] = 5;
    words["Zoom"] = 4;
    words["cat"] = 3;
    WHEN( "<< is used" ) {
      std::stringstream actual;
      size_t expected = 30;

      actual << words;
      actual.seekg(0, std::ios_base::end);
      THEN( "the stream should contain no less than 30 characters" ) {
        REQUIRE(actual.tellg() >= expected);
      }
    }
  }
}

SCENARIO( "Compute the invariants of operator<<") {

  GIVEN( "an empty map" ) {
    std::map<string, size_t> words;
    WHEN( "nothing is provided" ) {
      std::stringstream actual;
      size_t expected = 0;
      actual << words;
      actual.seekg(0, std::ios_base::end);
      THEN( "the stream should contain no characters" ) {
        REQUIRE(actual.tellg() == expected);
      }
    }
  }
}




