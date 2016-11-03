#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE BigIntTestAdd
#include <boost/test/unit_test.hpp>
#include <iostream>
#include <string>
#include <stack>
#include <vector>

#include "../src/BigInt.h"
#include "../src/Calc.h"

using namespace mesa;

BOOST_AUTO_TEST_CASE( simple_addition )
{
  Calc c;
  string e = c.evaluate ("2 2 +");
  BOOST_CHECK_EQUAL("4", e);
  e = c.evaluate ("0 99 +");
  BOOST_CHECK_EQUAL("99", e);
  e = c.evaluate ("1 0 +");
  BOOST_CHECK_EQUAL("1", e);
}

BOOST_AUTO_TEST_CASE( add_1234567890123456789_and_0 )
{
  Calc c;
  string e = c.evaluate ("1234567890123456789 0 +");
  BOOST_CHECK_EQUAL("1234567890123456789", e);
  e = c.evaluate ("0 1234567890123456789 +");
  BOOST_CHECK_EQUAL("1234567890123456789", e);
}

BOOST_AUTO_TEST_CASE( add_leading_zeros )
{
  Calc c;
  string e = c.evaluate ("0000000890123456789 9876543210 +");
  BOOST_CHECK_EQUAL("899999999999", e);
  e = c.evaluate ("9876543211 0000000890123456789 +");
  BOOST_CHECK_EQUAL("900000000000", e);
}

BOOST_AUTO_TEST_CASE( carry_addition )
{
  Calc c;
  string e = c.evaluate ("18 999 +");
  BOOST_CHECK_EQUAL("1017", e);
  e = c.evaluate ("888 9999 +");
  BOOST_CHECK_EQUAL("10887", e);
  e = c.evaluate ("987665 567890 +");
  BOOST_CHECK_EQUAL("1555555", e);
  e = c.evaluate ("99999999 8888888 +");
  BOOST_CHECK_EQUAL("108888887", e);
  e = c.evaluate ("999999999999999999999999999999 8888888888888888888888888 +");
  BOOST_CHECK_EQUAL("1000008888888888888888888888887", e);
}

