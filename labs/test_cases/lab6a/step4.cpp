#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <lab6a.h>
#include <doctest.h>

#include <vector>
using std::vector;

SCENARIO( "Evaluate greater than") {

  WHEN( "a & b are integral types and a > b" ) {
    vector<int> a = {1,3,5,7,9,11213,667};
    vector<long> b = {0,2,4,6,8,11212,666};
    THEN( "greater should return true" ) {
      for (auto i = 0u; i < a.size(); ++i) {
        CAPTURE("a = " << a[i] << " and b = " << b[i]);
        REQUIRE( mesa::greater(a[i], b[i]) == true);
      }
    }
  }
  WHEN( "a & b are integral types and a <= b" ) {
    vector<long> a = {0,2,4,6,8,11212,666,3};
    vector<int> b = {1,3,5,7,9,11213,666,3};
    THEN( "greater should return true" ) {
      for (auto i = 0u; i < a.size(); ++i) {
        CAPTURE("a = " << a[i] << " and b = " << b[i]);
        REQUIRE( mesa::greater(a[i], b[i]) == false);
      }
    }
  }
  WHEN( "a & b are floating point types and a > b" ) {
    vector<float> a = {1.1,3.14,5.7726,7.07,9.38,11.213,66.7};
    vector<double> b = {0,2,4,6,8,11.212,66.6};
    THEN( "greater should return true" ) {
      for (auto i = 0u; i < a.size(); ++i) {
        CAPTURE("a = " << a[i] << " and b = " << b[i]);
        REQUIRE( mesa::greater(a[i], b[i]) == true);
      }
    }
  }
  WHEN( "a & b are floating point types and a <= b" ) {
    vector<double> a = {0,2,4,6,8,11.212,66.6,3.14};
    vector<float> b = {1,3,5,7,9,11.213,66.601,3.14};
    THEN( "greater should return true" ) {
      for (auto i = 0u; i < a.size(); ++i) {
        CAPTURE("a = " << a[i] << " and b = " << b[i]);
        REQUIRE( mesa::greater(a[i], b[i]) == false);
      }
    }
  }
}

