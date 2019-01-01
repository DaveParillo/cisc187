#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

#include <lab3b.h>
#include <string>
#include <vector>

SCENARIO( "find the first word in a lowercase vector") {

  GIVEN( "A vector of all lowercase words" ) {
    WHEN( "the word list is the set provided as an example in the lab" ) {
      static const std::vector<std::string> words = {
        "reach", "clear", "fall", "set", "yard",
        "liquid", "wise", "badge", "four", "coherent"
      };

      THEN( "the value 'badge' should be returned" ) {
        REQUIRE( mesa::first(words) == "badge");
      }
    }
    WHEN( "the word badge is removed from the lab list" ) {
      static const std::vector<std::string> words = {
        "reach", "clear", "fall", "set", "yard",
        "liquid", "wise", "four", "coherent"
      };

      THEN( "the value 'clear' should be returned" ) {
        REQUIRE( mesa::first(words) == "clear");
      }
    }
  }
}

SCENARIO( "find the first word in a mixed-case vector") {

  GIVEN( "The lab example word list" ) {
    WHEN( "reach is changed to Reach" ) {
      static const std::vector<std::string> words = {
        "Reach", "clear", "fall", "set", "yard",
        "liquid", "wise", "badge", "four", "coherent"
      };

      THEN( "the value 'reach' should be returned: upper case sorts before lower case" ) {
        REQUIRE( mesa::first(words) == "Reach");
      }
    }
    WHEN( "badge is removed and coherent is changed to cOherent" ) {
      static const std::vector<std::string> words = {
        "reach", "clear", "fall", "set", "yard",
        "liquid", "wise", "four", "cOherent"
      };

      THEN( "the value 'cOherent' should be returned: upper case sorts before lower case" ) {
        REQUIRE( mesa::first(words) == "cOherent");
      }
    }
  }
}



SCENARIO( "find the first word in an empty vector") {

  GIVEN( "An empty vector" ) {
    static const std::vector<std::string> words;
    std::string expected;

    THEN( "an empty string should be returned" ) {
      REQUIRE( mesa::first(words) == expected);
    }
  }
}



