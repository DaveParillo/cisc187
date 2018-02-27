#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

#include "api.h"

using mesa::abs;

SCENARIO( "take the absolute value of a number") {

  GIVEN( "signed integral types" ) {
    WHEN( "an int is positive" ) {
      int value = 3;
      int expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "an int is negative" ) {
      int value = -5;
      int expected = -value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
  
    WHEN( "an int32_t is positive" ) {
      int32_t value = 13;
      int32_t expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "an int32_t is negative" ) {
      int32_t value = -8;
      int32_t expected = -value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a long is positive" ) {
      long value = 8675309;
      long expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a long is negative" ) {
      long value = -6060842;
      long expected = -value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }

    WHEN( "a char is positive" ) {
      char value = 127;
      char expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a char is negative" ) {
      char value = -92;
      char expected = -value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }


  }

  GIVEN( "unsigned integral types" ) {
    WHEN( "an unsigned int is positive" ) {
      unsigned int value = 997;
      unsigned int expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "an unsigned int is negative" ) {
      unsigned int value = -42;
      unsigned int expected = value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
  
    WHEN( "an uint32_t is positive" ) {
      uint32_t value = 314159;
      uint32_t expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "an uint32_t is negative" ) {
      uint32_t value = -314159;
      uint32_t expected = value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a unsigned long is positive" ) {
      unsigned long value = 6060842;
      unsigned long expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a unsigned long is negative" ) {
      unsigned long value = -6060842;
      unsigned long expected = value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }

    WHEN( "a unsigned char is positive" ) {
      unsigned char value = 34;
      unsigned char expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a unsigned char is negative" ) {
      unsigned char value = -21;
      unsigned char expected = value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
  }

  GIVEN( "floating point types" ) {
    WHEN( "a float is positive" ) {
      float value = 3;
      float expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a float is negative" ) {
      float value = -3;
      float expected = -value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a double is positive" ) {
      double value = 2.06e23;
      double expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a double is negative" ) {
      double value = -3.1415e8;
      double expected = -value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a long double is positive" ) {
      long double value = 3.14e88;
      long double expected = value;
      THEN( "the same value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
    WHEN( "a long double is negative" ) {
      long double value = -3.14e88;
      long double expected = -value;
      THEN( "the absolute value should be returned" ) {
        REQUIRE( expected  == abs(value));
      }
    }
  
  }

}


