#include <iostream>

// Declare a class and define function inside the class
class Talk 
{
  public:
    void hello() 
    {
      std::cout << "Hello, world!" << std::endl;
    }

};  // semi-colon required at end of declatation

int main()
{
  Talk say;        // Create an object from a class
  say.hello();     // Call a function in the object
  return 0;
}


