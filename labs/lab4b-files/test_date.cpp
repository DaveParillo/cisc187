#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE DateTests
#include <boost/test/unit_test.hpp>
#include <sstream>
#include <stdexcept>
#include "Date.h"


BOOST_AUTO_TEST_CASE( to_month )
{
  BOOST_CHECK_EQUAL(static_cast<int>(mesa::to_month(1)), static_cast<int>(mesa::Month::JAN));
  BOOST_CHECK_EQUAL(int(mesa::to_month(2)),  int(mesa::Month::FEB));
  BOOST_CHECK_EQUAL(int(mesa::to_month(3)),  int(mesa::Month::MAR));
  BOOST_CHECK_EQUAL(int(mesa::to_month(4)),  int(mesa::Month::APR));
  BOOST_CHECK_EQUAL(int(mesa::to_month(5)),  int(mesa::Month::MAY));
  BOOST_CHECK_EQUAL(int(mesa::to_month(6)),  int(mesa::Month::JUN));
  BOOST_CHECK_EQUAL(int(mesa::to_month(7)),  int(mesa::Month::JUL));
  BOOST_CHECK_EQUAL(int(mesa::to_month(8)),  int(mesa::Month::AUG));
  BOOST_CHECK_EQUAL(int(mesa::to_month(9)),  int(mesa::Month::SEP));
  BOOST_CHECK_EQUAL(int(mesa::to_month(10)), int(mesa::Month::OCT));
  BOOST_CHECK_EQUAL(int(mesa::to_month(11)), int(mesa::Month::NOV));
  BOOST_CHECK_EQUAL(int(mesa::to_month(12)), int(mesa::Month::DEC));
  BOOST_CHECK_THROW (mesa::to_month(0), std::invalid_argument);
  BOOST_CHECK_THROW (mesa::to_month(13), std::invalid_argument);
}

BOOST_AUTO_TEST_CASE( is_date )
{
  BOOST_CHECK(mesa::is_date(1976,mesa::Month::JUL,4));
  BOOST_CHECK(mesa::is_date(1976,mesa::Month::JUL,0)  == false);
  BOOST_CHECK(mesa::is_date(1976,mesa::Month::JUL,32) == false);
}
BOOST_AUTO_TEST_CASE( leapyear )
{
  BOOST_CHECK(mesa::is_leapyear(1976) == true);
  BOOST_CHECK(mesa::is_leapyear(1965) == false);
  BOOST_CHECK(mesa::is_leapyear(2000) == true);
}
BOOST_AUTO_TEST_CASE( simple_date )
{
  mesa::Date d = {2001, mesa::Month::JAN, 1};

  BOOST_REQUIRE_EQUAL(d.day(), 1);
  BOOST_CHECK(d.month() == mesa::Month::JAN);
  BOOST_CHECK_EQUAL(d.year(), 2001);
}

BOOST_AUTO_TEST_CASE( date_equals )
{
  mesa::Date d1 = {2001, mesa::Month::JAN, 1};
  mesa::Date d2 = {2001, mesa::Month::JAN, 1};
  mesa::Date d3 = {2001, mesa::Month::JAN, 2};

  BOOST_REQUIRE_EQUAL(d1,d1);
  BOOST_CHECK_EQUAL(d1,d2);
  BOOST_CHECK(d1 != d3);

  d1 = {2001, mesa::Month::JAN, 1};
  d2 = {2011, mesa::Month::JAN, 1};
  BOOST_CHECK(d1 != d2);

}

BOOST_AUTO_TEST_CASE( date_to_string_ok )
{
  mesa::Date d1 = {1776, mesa::Month::JUL, 4};
  std::ostringstream s;
  s << d1;
  BOOST_CHECK_EQUAL(s.str(),"(1776,7,4)");
}
BOOST_AUTO_TEST_CASE( date_from_string_ok )
{
  mesa::Date d1 = {1776, mesa::Month::JUL, 4};
  mesa::Date d2;
  std::istringstream("(1776,7,4)") >> d2;
  BOOST_CHECK_EQUAL(d1,d2);
}
BOOST_AUTO_TEST_CASE( date_from_string_bad_year )
{
  mesa::Date d1 = {1776, mesa::Month::JUL, 4};
  mesa::Date d2;
  std::istringstream("(1777,7,4)") >> d2;
  BOOST_CHECK(d1 != d2);
}
BOOST_AUTO_TEST_CASE( date_from_string_missing_paren )
{
  mesa::Date d1 = {};  // a malformed date will result in now as the date
  mesa::Date d2;
  std::istringstream("(1776,7,4") >> d2;
  BOOST_CHECK_EQUAL(d1, d2);
}



