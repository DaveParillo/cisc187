#include <iostream>

using std::cout;
using std::endl;

// The add function from week 2 example
// Now template powered
// 
template <class N> N addSame(N x, N y);

//template <class A, class B> auto addAny(A x, B y);  //auto return type is a C++14 feature

template <class A, class B>  // must be defined before use
auto addAny(A x, B y) -> decltype(x+y) {
  return x + y;
}

int main()
{
  // both args need to be the same type
  cout << addSame(13, 21) << std::endl;
  cout << addSame(double(2), 3.14159) << std::endl;

  cout << addAny(2, 3.14159) << std::endl;
  return 0;
}

template <class N> 
N addSame(N x, N y) {
  return x + y;
}



