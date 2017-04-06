#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE BigIntTestMultiply
#include <boost/test/unit_test.hpp>
#include <iostream>
#include <string>
#include <stack>
#include <vector>

#include "../BigInt.h"
#include "../calc.h"

using std::string;
using namespace mesa;

BOOST_AUTO_TEST_CASE( simple_multiplication )
{
  BOOST_CHECK("6" == string(evaluate("* 2 3")));
  BOOST_CHECK("99" == string(evaluate("* 1 99")));
  BOOST_CHECK("99" == string(evaluate("* 99 1")));
  BOOST_CHECK("123" == string(evaluate("*123 1 1 1 1 1 1")));
  BOOST_CHECK(BigInt::zero == evaluate("* 1 0"));
  BOOST_CHECK(BigInt::zero == evaluate("* 0 999"));
  BOOST_CHECK(BigInt::zero == evaluate("*72 0 999"));
  BOOST_CHECK(BigInt::zero == evaluate("* 0 0"));
}

BOOST_AUTO_TEST_CASE( mul_12345678901234567891234567890123456789_times_1 )
{
  BOOST_CHECK("12345678901234567891234567890123456789" == string(evaluate("*12345678901234567891234567890123456789 1")));
  BOOST_CHECK("12345678901234567891234567890123456789" == string(evaluate("*1 12345678901234567891234567890123456789 1")));
}

BOOST_AUTO_TEST_CASE( mul_leading_zeros )
{

  BOOST_CHECK("879134278321234567900124828532123456790012482853211126352690" == string(evaluate("*000000089012345678912345678901234567891234567890123456789 9876543210")));
  BOOST_CHECK("879134278321234567900124828532123456790012482853211126352690" == string(evaluate("*9876543210 000000089012345678912345678901234567891234567890123456789 ")));
}

BOOST_AUTO_TEST_CASE( carry_multiplication )
{
  BOOST_CHECK("17982" == string(evaluate("* 18 999")));
  BOOST_CHECK("32100" == string(evaluate("* 0321 100")));
}

