#include "overload.h"
#include <iostream>

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

