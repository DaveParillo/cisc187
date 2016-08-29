
#include <iostream>

/**
 * A copy of x is passed to this function.
 * Changes to x are not reflected in the caller.
 */
void by_value(int x) 
{
  x = 99;
}

/**
 * A reference to x is passed to this function.
 * Changes to x are not reflected in the caller.
 *
 * What if the signature is changed to 'const int& x'?
 */
void by_reference (int& x)
{
  std::cout << "in by_ref the address of x is   " << &x << '\n';
  x = -1;
}

int main ()
{
  int alpha = 11;
  int beta = 11;

  std::cout << "in main the address of alpha is " << &alpha << '\n';
  std::cout << "in main the address of beta is  " << &beta << '\n';

  by_value(alpha);
  by_reference(beta);

  std::cout << "alpha is now " << alpha << '\n';
  std::cout << "beta is now " << beta << '\n';
  return 0;
}



