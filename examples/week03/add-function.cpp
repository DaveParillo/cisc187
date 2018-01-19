#include <iostream>

#include "concepts.h"

using std::cout;
using std::endl;

// The add function from week 2 example
// Now template powered
//
// The use of 'Number' here is a way to make it clear
// what KIND of typename or class is expected
// see concepts.h
//
// 'Concepts' and 'requires' won't exist until C++17 or 20
// For now, some people (mostly Stepanov) do this.
// 
// Adding two number of the same type is expected to result in a number of the same type:
template <Number N> N addSame(N x, N y);

//template <class A, class B> auto addAny(A x, B y);  //auto return type is a C++14 feature

template <Number A, Number B>  // must be defined before use
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

template <Number N> 
N addSame(N x, N y) {
  return x + y;
}



