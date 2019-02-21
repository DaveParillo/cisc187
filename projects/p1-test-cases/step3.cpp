#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include "../options.hpp"
#include <doctest.h>
#include <string>

//
// For these tests to compile,
// a function wignature
// std::string usage (const char*);
// needs to exist.
//

TEST_CASE( "a function usage exists") {
  auto prog = "test_step_3";
  auto actual = usage(prog);
  std::string expected = "Usage: test_step_3 [-h] [-c] [-p # piles] [-s # stones]\n";
  CHECK (expected == actual);
}


