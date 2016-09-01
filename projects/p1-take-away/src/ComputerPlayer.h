#pragma once

#include <vector>
/**
 * The mesa namespace contains potentially reusable code.
 * Out of this entire project, only the ComputerPlayer passes this test.
 * This interface could be used to play many types of simple two-player games based on 'heaps'.
 */
namespace mesa {
  /**
   * A class that plays (fairly) rational "take away".
   * This game is known in mathematical circles as 'nim' and has been extensively studied.
   *
   */
  class ComputerPlayer {
    public:

      /**
       * Evaluates the state of the supplied game.
       * 
       * When evaluation is complete the functions which_heap() and 
       * how_many() can be called.
       * @param piles the current game state received (piles and coins per pile)
       */
      void evaluate_position(const std::vector<size_t>& piles);

      /**
       * Respond to the game query "Which heap?" to choose from.
       * 
       * If the evaluator was unable to choose, then the largest heap is chosen.
       *
       * @return The heap finally chosen by the computer
       */
      size_t which_heap() const { return _heap; }

      /**
       * Respond to the game query "How many?" coins to pick.
       * 
       * If the evaluator was unable to choose, then 1 coin will be chosen.
       * 
       * @return The number of coins finally chosen by the computer
       */
      size_t how_many() const { return _take; }

    private:
      /**
       * The pile that the computer chooses to play.
       */
      size_t _heap;
      /**
       * The number of coins the computer chooses to take.
       */
      size_t _take;

      /**
       * Evaluate the begining and middle state of a game.
       * <p>
       * The result of the evaluation is new values for {@link #_heap} and {@link #_take}
       * </p>
       * @param piles the current game state received (piles and coins per pile)
       */
      void evaluate_midgame(const std::vector<size_t>& piles);

      /**
       * Evaluate the special case when we have only 2 piles.
       * The winning strategy is to ensure at the end of your turn, both piles are equal
       * <p>
       * The result of the evaluation is new values for heap and take
       * </p>
       * @param piles the current game state received (piles and coins per pile)
       */
      void evaluate_endgame(const std::vector<size_t>& piles);
  };

}

