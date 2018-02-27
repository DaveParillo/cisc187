#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

#include "api.h"

SCENARIO( "compute area of a triangle") {

  WHEN( "the sides are {3,4,5}" ) {
    const auto triangle = mesa::make_triple(2,1);
    THEN( "the area is 6" ) {
      REQUIRE( mesa::area(triangle)  == doctest::Approx(6));
    }
  }
  WHEN( "the sides are {5,12,13}" ) {
    const auto triangle = mesa::make_triple(3,2);
    THEN( "the area is 30" ) {
      REQUIRE( mesa::area(triangle)  == doctest::Approx(30));
    }
  }
  WHEN( "the sides are {8,15,17}" ) {
    const auto triangle = mesa::make_triple(4,1);
    THEN( "the area is 60" ) {
      REQUIRE( mesa::area(triangle)  == doctest::Approx(60));
    }
  }
  WHEN( "the sides are {7,24,25}" ) {
    const auto triangle = mesa::make_triple(4,3);
    THEN( "the area is 84" ) {
      REQUIRE( mesa::area(triangle)  == doctest::Approx(84));
    }
  }
}



SCENARIO( "validate invariants of area") {

  GIVEN( "invalid input parameters" ) {
    WHEN( "length of side a is zero" ) {
      auto triangle = mesa::trigon {0,8,13};
      THEN( "the area is defined to be 0" ) {
        REQUIRE( mesa::area(triangle)  == doctest::Approx(0));
      }
    }
    WHEN( "length of side b is zero" ) {
      auto triangle = mesa::trigon {5,0,13};
      THEN( "the area is defined to be 0" ) {
        REQUIRE( mesa::area(triangle)  == doctest::Approx(0));
      }
    }
    WHEN( "length of side c is zero" ) {
      auto triangle = mesa::trigon {5,8,0};
      THEN( "the area is defined to be 0" ) {
        REQUIRE( mesa::area(triangle)  == doctest::Approx(0));
      }
    }
  }
}



