#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <simple-parameter.h>
#include <doctest.h>

#include <iostream>
#include <sstream>
#include <string>

using std::cout;
using std::string;

template <class T>
void check_stdout (T value) {
  std::ostringstream actual;
  auto cout_buff = std::cout.rdbuf();
  cout.rdbuf(actual.rdbuf());
  printFavorite(value);
  cout.rdbuf(cout_buff);
  std::stringstream expected;
  expected << "my favorite number is " << value << '\n';
  REQUIRE (actual.str() == expected.str());
}

SCENARIO( "print a simple parameter") {

  GIVEN( "some standard types" ) {
    WHEN( "the value is an int" ) {
      int value = 3;
      THEN( "the function should print 'my favorite number is ' . . . " ) {
        check_stdout(value);
      }
    }
    WHEN( "the value is an int32_t" ) {
      int32_t value = 987654;
      THEN( "the function should print 'my favorite number is ' . . . " ) {
        check_stdout(value);
      }
    }
    WHEN( "the value is a long" ) {
      long value = -31415926;
      THEN( "the function should print 'my favorite number is ' . . . " ) {
        check_stdout(value);
      }
    }
    WHEN( "the value is a char" ) {
      char value = 120;
      THEN( "the function should print 'my favorite number is ' . . . " ) {
        check_stdout(value);
      }
    }
    WHEN( "the value is a double" ) {
      double value = 6.28;
      THEN( "the function should print 'my favorite number is ' . . . " ) {
        check_stdout(value);
      }
    }
    WHEN( "the value is a negative long double" ) {
      long double value = -10e100;
      THEN( "the function should print 'my favorite number is ' . . . " ) {
        check_stdout(value);
      }
    }
  
  }

}


