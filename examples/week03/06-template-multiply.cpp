//
// From the overload and template tutorial at
// http://www.cplusplus.com/doc/tutorial/functions2/
//


#include <iostream>

template <class T, int N>
T multiply (T val) {
  return val * N;
}

int main() {
  std::cout << multiply<int,2>(10) << '\n';
  std::cout << multiply<int,3>(10) << '\n';
}


