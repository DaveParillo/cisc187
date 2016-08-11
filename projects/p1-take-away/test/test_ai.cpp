#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE ComputerPlayerTests
#include <boost/test/unit_test.hpp>
#include <vector>

#include "../src/ComputerPlayer.h"


BOOST_AUTO_TEST_CASE( ai_one_pile_1 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {1};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(0, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}

BOOST_AUTO_TEST_CASE( ai_one_pile_99 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {99};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(0, ai.which_heap());
  BOOST_CHECK_EQUAL(99, ai.how_many());
}


BOOST_AUTO_TEST_CASE( ai_endgame_1 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {1,1};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(0, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}

BOOST_AUTO_TEST_CASE( ai_endgame_2 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {2,2};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(0, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}

BOOST_AUTO_TEST_CASE( ai_endgame_11 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {11,11};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(0, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}

BOOST_AUTO_TEST_CASE( ai_endgame_1_2 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {1,2};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(1, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_endgame_2_1 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {2,1};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(0, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_endgame_7_11 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {7,11};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(1, ai.which_heap());
  BOOST_CHECK_EQUAL(4, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_endgame_11_7 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {11,7};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(0, ai.which_heap());
  BOOST_CHECK_EQUAL(4, ai.how_many());
}

BOOST_AUTO_TEST_CASE( ai_mid_1_2_3 ) // nim sum of 1,2,3 == 0
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {1,2,4};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(2, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_mid_1_4_5 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {1,5,5};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(2, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_mid_2_5_7 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {7,5,5};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(2, ai.which_heap());
  BOOST_CHECK_EQUAL(3, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_mid_1_6_6_1 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {1,6,6,6};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(3, ai.which_heap());
  BOOST_CHECK_EQUAL(5, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_mid_4_4_4_4 )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {4,4,4,11,4};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(3, ai.which_heap());
  BOOST_CHECK_EQUAL(11, ai.how_many());
}
BOOST_AUTO_TEST_CASE( ai_mid_unfair )
{
  ComputerPlayer ai;
  std::vector<size_t> piles = {1,7,5,3};
  ai.evaluate_position(piles);
  BOOST_CHECK_EQUAL(1, ai.which_heap());
  BOOST_CHECK_EQUAL(1, ai.how_many());
}

