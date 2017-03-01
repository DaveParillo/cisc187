//
// Create 10 random numbers using C libraries
//

#include <iostream>
#include <cstdlib>
#include <ctime>

int main () {
  std::cout << "Random numbers: \n";
  srand(time(0));            // seed the random number generator
  for(int i=0;i<10;++i) {
    std::cout << rand() << '\n';
  }
}
