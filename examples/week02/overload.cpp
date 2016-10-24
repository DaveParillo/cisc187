#include <iostream>

// C++ allows function names to be 'overloaded'
// that is, used more than once
//
// The one requirement is that the parameter lists must be different
int    square(int x);
double square(double x);
//float  square(float x);  // bad declaration: conflicts with double square()
//float  square(double x); // bad declaration: redundant, only return type is different

int main()
{
  std::cout << square(4) << std::endl;
  std::cout << square(3.14159) << std::endl;
  return 0;
}

int square(int x){
  return x * x;
}

double square(double x){
  return x * x;
}

