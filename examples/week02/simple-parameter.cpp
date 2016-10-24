
#include <iostream>

using namespace std;

// Declare a function that takes a parameter.
void printFavorite(int x);

int main()
{
  printFavorite(72); // Call the function.
  return 0;
}

// define the function
void printFavorite(int x){
  cout << "my favorite numbner is " << x << endl;
}
