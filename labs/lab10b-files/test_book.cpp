#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE BookTests
#include <boost/test/unit_test.hpp>
#include <sstream>
#include <stdexcept>
#include "Book.h"
#include "Date.h"
#include "Genre.h"



BOOST_AUTO_TEST_CASE( book_constructor )
{
  Book b = {12345, "The C++ of Wrath", "John Stienstruct", {1939, mesa::Month::APR, 14}, Genre::FICTION};

  BOOST_REQUIRE(b.isbn() == 12345);
  BOOST_CHECK(b.title() == "The C++ of Wrath");
  BOOST_CHECK(b.author() == "John Stienstruct");
  mesa::Date d = {1939, mesa::Month::APR, 14};
  BOOST_CHECK(b.copyright_date() == d);
  BOOST_CHECK(b.genre() == Genre::FICTION);
}


BOOST_AUTO_TEST_CASE( book_equals )
{
  Book b1 = {12345, "The C++ of Wrath", "John Stienstruct", {1939, mesa::Month::APR, 14}, Genre::FICTION};
  Book b2 = {12345, "The Grapes of Wrath", "John Stiensbeck", {1939, mesa::Month::APR, 14}, Genre::FICTION};
  Book b3 = {1234,  "The C++ of Wrath", "John Stienstruct", {1939, mesa::Month::APR, 14}, Genre::FICTION};

  BOOST_CHECK_EQUAL(b1, b1);
  BOOST_CHECK_EQUAL(b1,b2);
  BOOST_CHECK(b1 != b3);


}



