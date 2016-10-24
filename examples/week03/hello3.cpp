#include <iostream>
#include <string>

// hello2.cpp allows for no name to be printed if name_ is never set
// A Constructor can fix that
//
class Hello {
  public: 
    Hello()               // The default constructor
    {
      name_ = "Alice";    // set the name in the body of the constructor
    }

    Hello (std::string initial_name)  // set name when object is declared
      : name_{initial_name} { }       // set name in initializer list

    // get the name 
    std::string name() 
    {
      return name_;
    }
    // set the name to something else
    void name(std::string new_name)
    {
      name_ = new_name;
    }

  private:
    std::string name_;
};

int main()
{
  Hello me;
  me.name("Dave");
  std::cout << "Hello, " << me.name() << "!\n";

  Hello al;
  std::cout << "Hello, " << al.name() << "!\n";

  Hello b("Bob");
  std::cout << "Hello, " << b.name() << "!\n";
  return 0;
}
