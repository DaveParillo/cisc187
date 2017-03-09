#include <utility>
#include <iostream>

int main () {
  std::pair<int, int> pair {3, 1};
  std::cout << "first is " << pair.first << ", second is " << pair.second << ".\n";
  return 0;
}

