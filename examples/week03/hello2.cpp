#include "Hello.h"
#include <iostream>

int main()
{
  Hello me;                                      // Create an object from a class
  std::cout << "Hello, " << me.name() << "!\n";  // use the name
  me.name("Dave");                               // Call a function to change the name
  std::cout << "Hello, " << me.name() << "!\n";  // use the name
  return 0;
}
