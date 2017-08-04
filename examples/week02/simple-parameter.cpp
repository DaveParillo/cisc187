
#include <iostream>

// Declare a function that takes a parameter.
// This parameter could be const
void printFavorite(int x);

int main()
{
  printFavorite(72); // Call the function.
  return 0;
}

// define the function
void printFavorite(int x){
  std::cout << "my favorite number is " << x << '\n';
}
