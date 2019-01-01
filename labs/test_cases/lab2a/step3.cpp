#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <lab2a.h>
#include <doctest.h>

#include <string>

SCENARIO( "Format a string using US phone numer rules if the text appears to be a phone number") {

  GIVEN( "typical strings" ) {

    WHEN( "strings contain exactly 10 digits" ) {
      THEN( "then assume it's a phone number and format as (ddd) ddd-dddd" ) {
        REQUIRE( phone_format("5558675309") == "(555) 867-5309" );
        REQUIRE( phone_format("5556060842") == "(555) 606-0842" );
      }
    }

    WHEN( "a string does not contain 10 digits" ) {
      THEN( "return 'Not a phone number.'" ) {
        REQUIRE( phone_format("90210") == "Not a phone number." );
        REQUIRE( phone_format("howdy") == "Not a phone number." );
        CHECK( phone_format("hello, world") == "Not a phone number." );
        CHECK( phone_format("can you hear me?") == "Not a phone number." );
        CHECK( phone_format("woot!") == "Not a phone number." );
      }
    }

  }

  GIVEN( "empty strings" ) {

    WHEN( "strings contain nothing" ) {
      std::string s;
      THEN( "return 'Not a phone number.'" ) {
        CHECK( phone_format(s) == "Not a phone number." );
      }
    }

  }
}



