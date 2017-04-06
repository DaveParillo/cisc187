#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE BigIntTestAdd
#include <boost/test/unit_test.hpp>
#include <iostream>
#include <string>
#include <stack>
#include <vector>

#include "../BigInt.h"
#include "../calc.h"

using std::string;
using namespace mesa;

BOOST_AUTO_TEST_CASE( simple_addition )
{
  BOOST_CHECK("5" == string(evaluate("+ 2 3")));
  BOOST_CHECK_EQUAL("99", string(evaluate("+ 0 99")));
  BOOST_CHECK(BigInt::one == evaluate("+ 1 0"));
}
BOOST_AUTO_TEST_CASE( add_1234567890123456789_and_0 )
{
  BOOST_CHECK("1234567890123456789" == string(evaluate("+ 1234567890123456789 0")));
  BOOST_CHECK("1234567890123456789" == string(evaluate("+ 0 1234567890123456789")));
  BOOST_CHECK("1234567890123456789" == string(evaluate("+ 0 1234567890123456789 0 0 0 ")));
  BOOST_CHECK("1234567890123456789" == string(evaluate("+1234567890123456789 0")));
}

BOOST_AUTO_TEST_CASE( add_leading_zeros )
{
  BOOST_CHECK("899999999999" == string(evaluate("+ 0000000890123456789 9876543210")));
  BOOST_CHECK("900000000000" == string(evaluate("+ 9876543211 0000000890123456789")));
  BOOST_CHECK("55" == string(evaluate("+00 001 0002 03 004 05 06 07 000 008 00009 0010 ")));
}

BOOST_AUTO_TEST_CASE( carry_addition )
{
  BOOST_CHECK("1017" == string(evaluate("+18 999")));
  BOOST_CHECK("10887" == string(evaluate("+888 9999")));
  BOOST_CHECK("1555555" == string(evaluate("+987665 567890")));
  BOOST_CHECK("108888887" == string(evaluate("+99999999 8888888")));
  BOOST_CHECK("1000008888888888888888888888887" == string(evaluate("+999999999999999999999999999999 8888888888888888888888888")));
}


