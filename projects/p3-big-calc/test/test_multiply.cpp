#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE BigIntTestMultiply
#include <boost/test/unit_test.hpp>
#include <iostream>
#include <string>
#include <stack>
#include <vector>

#include "../src/BigInt.h"
#include "../src/Calc.h"

using namespace mesa;

BOOST_AUTO_TEST_CASE( simple_multiplication )
{
  Calc c;
  string e = c.evaluate ("2 2 *");
  BOOST_CHECK_EQUAL("4", e);
  e = c.evaluate ("1 99 *");
  BOOST_CHECK_EQUAL("99", e);
  e = c.evaluate ("99 1 *");
  BOOST_CHECK_EQUAL("99", e);
  e = c.evaluate ("1 0 *");
  BOOST_CHECK_EQUAL("0", e);
  e = c.evaluate ("0 1 *");
  BOOST_CHECK_EQUAL("0", e);
  e = c.evaluate ("0 0 *");
  BOOST_CHECK_EQUAL("0", e);
}

BOOST_AUTO_TEST_CASE( mul_12345678901234567891234567890123456789_times_1 )
{
  Calc c;
  string e = c.evaluate ("12345678901234567891234567890123456789 1 *");
  BOOST_CHECK_EQUAL("12345678901234567891234567890123456789", e);
  e = c.evaluate ("1 12345678901234567891234567890123456789 *");
  BOOST_CHECK_EQUAL("12345678901234567891234567890123456789", e);
}

BOOST_AUTO_TEST_CASE( add_leading_zeros )
{
  Calc c;
  string e = c.evaluate ("000000089012345678912345678901234567891234567890123456789 9876543210 *");
  BOOST_CHECK_EQUAL("879134278321234567900124828532123456790012482853211126352690", e);
  e = c.evaluate ("9876543210 000000089012345678912345678901234567891234567890123456789  *");
  BOOST_CHECK_EQUAL("879134278321234567900124828532123456790012482853211126352690", e);
}

BOOST_AUTO_TEST_CASE( carry_multiplication )
{
  Calc c;
  string e = c.evaluate ("18 999 *");
  BOOST_CHECK_EQUAL("17982", e);
  e = c.evaluate ("0321 100 *");
  BOOST_CHECK_EQUAL("32100", e);
}

