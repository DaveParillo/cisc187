#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include "../Power.h"
#include "../BigInt.h"
#include <doctest.h>
#include <stack>
#include <stdexcept>

using mesa::Power;
using mesa::BigInt;
using std::stack;

//
// For these tests to compile implement:
//  - mesa::Power
//
// a note about pulling exponent operands off the stack:
// - pow is not associative (2^3 != 3^2)
// 
// You need to decide which operand is the base and which is the exponent
// My implementation pulls operands off the stack like so:
// exponent first, then base.
//

SCENARIO ("test ability to skip non-multiply command input") {
  std::stack<BigInt> actual;
  Power handler;
  bool response = true;
  GIVEN ("an empty stack") {
    WHEN ("the token is '2'") {
      response = handler.execute(actual, "2");
      THEN ("the stack should remain empty") {
        REQUIRE (actual.empty());
      }
      AND_THEN ("execute should return false") {
        REQUIRE (response == false);
      }
    }

    WHEN ("the token is '+'") {
      response = handler.execute(actual, "+");
      THEN ("the stack should remain empty") {
        REQUIRE (actual.empty());
      }
      AND_THEN ("execute should return false") {
        REQUIRE (response == false);
      }
    }

    WHEN ("the token is '*'") {
      response = handler.execute(actual, "*");
      THEN ("the stack should remain empty") {
        REQUIRE (actual.empty());
      }
      AND_THEN ("execute should return false") {
        REQUIRE (response == false);
      }
    }

    WHEN ("the token is '!'") {
      response = handler.execute(actual, "!");
      THEN ("the stack should remain empty") {
        REQUIRE (actual.empty());
      }
      AND_THEN ("execute should return false") {
        REQUIRE (response == false);
      }
    }
  }
}



SCENARIO ("test ability to process exponentiation commands") {
  std::stack<BigInt> actual;
  Power handler;
  bool response = false;
  GIVEN ("a stack with operands: 3, 2") {
    actual.push(BigInt{2});
    actual.push(BigInt{3});
    WHEN ("the token is '^'") {
      response = handler.execute(actual, "^");
      THEN ("the stack should multiply them and push the result onto the stack: BigInt{8}") {
        REQUIRE (!actual.empty());
        REQUIRE (operator==(actual.top(), BigInt{8}));
      }
      AND_THEN ("execute should return true") {
        REQUIRE (response);
      }
    }
  }

  GIVEN ("a stack with operands: 1, 2, 4, 3") {
    WHEN ("the multiply handler is invoked") {
      actual.push(BigInt{1});
      actual.push(BigInt{2});
      actual.push(BigInt{4});
      actual.push(BigInt{3});
      response = handler.execute(actual, "^");
      THEN ("the handler should multiply the two top elements and push the result onto the stack") {
        REQUIRE (operator==(actual.top(), BigInt{64}));
      }
      AND_THEN ("the stack should contain 3 elements") {
        REQUIRE (actual.size() == 3);
      }
      AND_THEN ("execute should return true") {
        REQUIRE (response);
      }
    }
  }

  GIVEN ("a stack with one operand") {
    WHEN ("the multiply handler is invoked") {
      actual.push(BigInt{1});
      
      THEN ("the handler should throw an invalid_argument exception") {
        CHECK_THROWS_AS(handler.execute(actual, "^"), std::invalid_argument);
      }
    }
  }

  GIVEN ("an empty stack") {
    WHEN ("the multiply handler is invoked") {
      THEN ("the handler should throw an invalid_argument exception") {
        CHECK_THROWS_AS(handler.execute(actual, "^"), std::invalid_argument);
      }
    }
  }
}



