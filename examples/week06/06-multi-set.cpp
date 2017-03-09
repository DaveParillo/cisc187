#include <iostream>
#include <set>

struct Greater {
  constexpr bool operator()(int lhs, int rhs) const 
  {
    return lhs > rhs;
  }
};

int main()
{
  std::multiset<int, Greater> x {2,7,1,8,2,8,1,8,2,8,4,5,9};

  for (auto i: x) {
    std::cout << i << ' ';
  }
}

