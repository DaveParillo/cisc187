#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <student.h>
#include <doctest.h>

#include <string>
#include <sstream>
#include <vector>

SCENARIO( "Stream a classroom") {

  GIVEN( "a classroom" ) {
    student a {"Alice", 1, {1,2,3}};
    student b {"Bob", 67890, {70,90,84,70,85,94,100,88,92}};
    student c {"Clara", 98765, {66,100,94,82,98,87,83,100,90,86}};

    std::vector<student*> v = {&a, &b, &c};

    WHEN( "the students are Alice, Bob, and Clara" ) {
      THEN( "the class should stream" ) {
        std::ostringstream os;
        os << v;
        auto actual = os.str();
        std::string expected = "Name:\tAlice\tId:\t1\tAvg:\t2\n";
        expected += "Name:\tBob\tId:\t67890\tAvg:\t85.89\n";
        expected += "Name:\tClara\tId:\t98765\tAvg:\t88.6\n";
        REQUIRE(actual == expected);
      }
    }

  }
}


