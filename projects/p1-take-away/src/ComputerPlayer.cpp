#include <algorithm>
#include <cassert>
#include <iostream>
#include <vector>

#include "ComputerPlayer.h"
namespace mesa {
  void ComputerPlayer::evaluate_position(const std::vector<size_t>& piles) 
  {
    _heap = 0;
    _take = 0;
    switch (piles.size()) {
      case 1:
        _take = piles[_heap];
        break;
      case 2:
        evaluate_endgame(piles);
        break;
      default:
        evaluate_midgame(piles);
        break;
    }
    assert(_heap >=0);
    assert(_take > 0);
  }

  size_t ComputerPlayer::which_heap() const
  {
    return _heap;
  }
  size_t ComputerPlayer::how_many() const
  {
    return _take;
  }

  void ComputerPlayer::evaluate_midgame(const std::vector<size_t>& piles)
  {
    auto sum = 0ul;   // nim sum of all heaps
    auto tmp = 0ul;
    auto index = 0ul;
    auto choice = -1;

    for (auto i: piles) {
      // compute binary sum of each heap
      sum = sum ^ i;
    }

    for (auto i: piles) {
      tmp = sum ^ i;
      if (tmp < i) {
        _take = i - tmp;
        choice = int(index);
      }
      ++index;
    }
    if (choice < 0) { // did not find a playable position
      std::cerr << "Did not find a winning position\n";
      _heap = 0;
      _take = 1;                               // take 1 coin
      for (auto i=1ul; i< piles.size(); ++i) { // take from the biggest heap
        if (piles[_heap] < piles[i]) {
          _heap = i;
        }
      }
    } else {
      _heap = size_t(choice);
    }
  }


  void ComputerPlayer::evaluate_endgame(const std::vector<size_t>& piles)
  {
    int sum = int(piles[0] - piles[1]);
    _heap = 0ul;
    if (sum == 0) {
      _take = 1ul;
    } else if (sum > 0) {
      _take = size_t(sum);
    } else {
      _heap = 1ul;
      _take = size_t(-sum);
    }
  }

}


