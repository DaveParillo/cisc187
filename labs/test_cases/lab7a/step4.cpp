#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <lab7a.h>
#include <doctest.h>

#include <algorithm>
#include <stack>
#include <string>
#include <vector>

SCENARIO( "Compare two stacks for equality" * doctest::timeout(0.5)) {

  GIVEN( "two stack of 10 ints, 0 through 9" ) {
    std::stack<int> x;
    std::stack<int> y;
    std::vector<int> v(10);
    std::iota(v.begin(), v.end(), 0);
    for (const auto& i: v) { x.push(i); y.push(i);}

    WHEN( "the values are equal" ) {
      THEN("equal_to should return true") {
        while (!x.empty()) {
          REQUIRE (mesa::equal_to(x,y) == true);
          x.pop();
          y.pop();
        }
      }
    }
  }

  GIVEN( "a stack of 7 names, Alice through Greg" ) {
    std::stack<std::string> x;
    std::stack<std::string> y;
    x.push("Alice");     y.push("Alice");
    x.push("Bob");       y.push("Bob");
    x.push("Clarice");   y.push("Clarice");
    x.push("Darla");     y.push("Darla");
    x.push("Earl");      y.push("Earl");
    x.push("Fran");      y.push("Fran");
    x.push("Greg");      y.push("Greg");

    WHEN( "the values are equal" ) {
      THEN("equal_to should return true") {
        while (!x.empty()) {
          REQUIRE (mesa::equal_to(x,y) == true);
          x.pop();
          y.pop();
        }
      }
    }
  }
}

SCENARIO( "Compute the invariants of equal_to" * doctest::timeout(0.5) ) {

  GIVEN( "one or more empty stacks" ) {
    std::stack<int> a;
    std::stack<int> b;
    b.push(1);
    WHEN( "the first stack is empty and the second is not" ) {
      THEN( "equal_to should return false" ) {
        REQUIRE(mesa::equal_to(a,b) == false);
      }
    }
    a.push(1);
    b.pop();
    WHEN( "the second stack is empty and the first is not" ) {
      THEN( "equal_to should return false" ) {
        REQUIRE(mesa::equal_to(a,b) == false);
      }
    }
    a.pop();
    WHEN( "the both stacks are empty" ) {
      THEN( "equal_to should return true" ) {
        REQUIRE(mesa::equal_to(a,b) == true);
      }
    }
  }
}


