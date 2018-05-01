#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include "../BigInt.h"
#include <doctest.h>
#include <limits>
#include <string>
#include <vector>

using mesa::BigInt;
using mesa::zero;
using mesa::one;
using std::string;
using std::vector;


//
// For these tests to compile create:
//  - all 6 comparison overloads
//


TEST_CASE( "Test BigInt operator==") {
  REQUIRE (operator==(BigInt{0}, zero));
  REQUIRE (operator==(BigInt{1}, one));

  BigInt x {987654321};
  BigInt y {987654321};
  BigInt z {987654321};
  CHECK (operator==(x,x));
  CHECK (operator==(x,y));
  CHECK (operator==(y,x));
  CHECK (operator==(y,z));
  CHECK (operator==(x,z));
}


TEST_CASE( "Test BigInt operator!=") {
  REQUIRE (operator!=(BigInt{0}, one));
  REQUIRE (operator!=(BigInt{1}, zero));

  BigInt x {"9876543210"};
  BigInt y {"9876543211"};
  CHECK (operator!=(x,y));
  CHECK (operator!=(y,x));
}

TEST_CASE( "Test BigInt operator>") {
  CHECK (operator>(BigInt {"9876543211"},BigInt {"9876543210"}));
}





