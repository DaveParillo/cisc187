#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include "../BigInt.h"
#include <doctest.h>

using mesa::BigInt;
using mesa::zero;
using mesa::one;

//
// For these tests to compile create:
//  -  operator+ and +=
//


TEST_CASE( "Test BigInt operator+ simple") {
  REQUIRE (operator==(zero, zero+zero));
  REQUIRE (operator==(BigInt{1}, zero+one));
  REQUIRE (operator==(BigInt{99}, BigInt{99}+zero));

  REQUIRE (operator==(BigInt{5}, BigInt{2}+BigInt{3}));
}


TEST_CASE( "Test BigInt operator+ simple cummutative law") {
  REQUIRE (operator==(BigInt{2}+BigInt{3}, 
                      BigInt{3}+BigInt{2}));
  REQUIRE (operator==(BigInt{111111}+BigInt{3333}, 
                      BigInt{3333}+BigInt{111111}));
  REQUIRE (operator==(BigInt{222}+BigInt{111}+BigInt{333}, 
                      BigInt{333}+BigInt{111}+BigInt{222}));
}

TEST_CASE( "Test BigInt operator+ with carry") {
  REQUIRE (operator==(BigInt{100}, BigInt{99}+one));
  REQUIRE (operator==(BigInt{1017}, BigInt{999}+BigInt{18}));
  REQUIRE (operator==(BigInt{10887}, BigInt{9999}+BigInt{888}));
  REQUIRE (operator==(BigInt{1555555}, BigInt{987665}+BigInt{567890}));

  CHECK (operator==(BigInt{"19753086421"}, 
                    BigInt{"9876543210"}+BigInt{"9876543211"}));
  CHECK (operator==(BigInt{"108888887"}, 
                    BigInt{"99999999"}+BigInt{"8888888"}));
  CHECK (operator==(BigInt{"1000008888888888888888888888887"}, 
                    BigInt{"999999999999999999999999999999"}
                   +BigInt{"8888888888888888888888888"}));
  REQUIRE (operator==(BigInt{55}, 
                      BigInt{0}+BigInt{1}+BigInt{2}+BigInt{3}
                     +BigInt{4}+BigInt{5}+BigInt{6}+BigInt{7}
                     +BigInt{8}+BigInt{9}+BigInt{10}));
}

TEST_CASE( "Test BigInt operator+= simple") {
  BigInt actual;
  actual+=zero;
  REQUIRE (operator==(zero, actual));
  
  actual = BigInt{99};
  actual+=zero;
  REQUIRE (operator==(BigInt{99}, actual));
  actual=BigInt{100};
  actual+=actual;
  REQUIRE (operator==(BigInt{200}, actual));
}

TEST_CASE( "Test BigInt operator+= with carry") {
  BigInt actual{99};
  actual+=one;
  REQUIRE (operator==(BigInt{100}, actual));
  actual=BigInt{999};
  actual+=BigInt{18};
  REQUIRE (operator==(BigInt{1017}, actual));

  actual=BigInt{9999};
  actual+=BigInt{888};
  REQUIRE (operator==(BigInt{10887}, actual));

  actual=BigInt{987665};
  actual+=BigInt{567890};
  REQUIRE (operator==(BigInt{1555555}, actual));

  actual=BigInt{"9876543211"};
  actual+=BigInt{"9876543210"};
  REQUIRE (operator==(BigInt{"19753086421"}, actual));
  actual=BigInt{"8888888"};
  actual+=BigInt{"99999999"};
  REQUIRE (operator==(BigInt{"108888887"}, actual));
  actual=BigInt{"999999999999999999999999999999"};
  actual+=BigInt{"8888888888888888888888888"};
  REQUIRE (operator==(BigInt{"1000008888888888888888888888887"}, actual));

}


