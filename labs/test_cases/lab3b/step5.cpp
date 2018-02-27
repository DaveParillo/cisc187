#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

#include "api.h"

SCENARIO( "find the smallest triangle in a vector") {
  std::vector<mesa::trigon> test_vector;
  const auto t4 = mesa::make_triple(4,3);
  const auto t3 = mesa::make_triple(4,1);
  const auto t2 = mesa::make_triple(3,1);
  const auto t1 = mesa::make_triple(2,1);

  GIVEN( "only 1 triangle is in the vector" ) {
    WHEN( "the sides are {7,24,25}" ) {
      test_vector.push_back(t4);
      auto tmp = mesa::smallest(test_vector);
      THEN( "it should be returned" ) {
        CHECK( tmp.a  == doctest::Approx(7));
        CHECK( tmp.b  == doctest::Approx(24));
        REQUIRE( tmp.c  == doctest::Approx(25));
      }
    }
    test_vector.clear();
    WHEN( "the sides are {3,4,5}" ) {
      test_vector.push_back(t1);
      auto tmp = mesa::smallest(test_vector);
      THEN( "it should be returned" ) {
        REQUIRE( tmp.a  == doctest::Approx(3));
        REQUIRE( tmp.b  == doctest::Approx(4));
        REQUIRE( tmp.c  == doctest::Approx(5));
      }
    }
  }
  GIVEN( "two triangles are in the vector" ) {
    WHEN( "the sides are {7,24,25} {3,4,5}" ) {
      test_vector.push_back(t4);
      test_vector.push_back(t1);
      auto tmp = mesa::smallest(test_vector);
      THEN( "the last should be returned" ) {
        REQUIRE( tmp.a  == doctest::Approx(3));
        REQUIRE( tmp.b  == doctest::Approx(4));
        REQUIRE( tmp.c  == doctest::Approx(5));
      }
    }
    test_vector.clear();
    WHEN( "the sides are {3,4,5} {7,24,25}" ) {
      test_vector.push_back(t1);
      test_vector.push_back(t4);
      auto tmp = mesa::smallest(test_vector);
      THEN( "the first should be returned" ) {
        REQUIRE( tmp.a  == doctest::Approx(3));
        REQUIRE( tmp.b  == doctest::Approx(4));
        REQUIRE( tmp.c  == doctest::Approx(5));
      }
    }
  }
  test_vector.clear();
  GIVEN( "more triangles are in the vector" ) {
    WHEN( "the sides are {5,12,13} {8,15,17} {3,4,5} {7,24,25}" ) {
      test_vector.push_back(t2);
      test_vector.push_back(t3);
      test_vector.push_back(t1);
      test_vector.push_back(t4);
      auto tmp = mesa::smallest(test_vector);
      THEN( "the third should be returned" ) {
        REQUIRE( tmp.a  == doctest::Approx(3));
        REQUIRE( tmp.b  == doctest::Approx(4));
        REQUIRE( tmp.c  == doctest::Approx(5));
      }
    }
    test_vector.clear();
    const auto x = mesa::make_triple(1,1);
    WHEN( "the sides are {5,12,13} {8,15,17} {3,4,5} {0,0,0} {7,24,25}" ) {
      test_vector.push_back(t2);
      test_vector.push_back(t3);
      test_vector.push_back(t1);
      test_vector.push_back(x);
      test_vector.push_back(t4);
      auto tmp = mesa::smallest(test_vector);
      THEN( "the fourth should be returned" ) {
        REQUIRE( tmp.a  == doctest::Approx(0));
        REQUIRE( tmp.b  == doctest::Approx(0));
        REQUIRE( tmp.c  == doctest::Approx(0));
      }
    }
  }
}



SCENARIO( "validate invariants of smallest") {

  std::vector<mesa::trigon> empty_vector;

  WHEN( "when the provided vector is empty" ) {
    THEN( "the function should return {0,0,0}" ) {
      auto tmp = mesa::smallest(empty_vector);
      REQUIRE( tmp.a  == doctest::Approx(0));
      REQUIRE( tmp.b  == doctest::Approx(0));
      REQUIRE( tmp.c  == doctest::Approx(0));
    }
  }
}



