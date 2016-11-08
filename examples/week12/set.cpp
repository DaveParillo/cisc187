#include <iostream>
#include <set>

int main()
{
  std::set<int> x {2,7,1,8,2,8,1,8,2,8,4,5,9};

  for (auto i: x) {
    std::cout << i << ' ';
  }
}

