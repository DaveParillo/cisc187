#include <iostream>
#include <string>

class Hello {
  public: 
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
    std::string name_;  // this *cant* be just 'name'
                        // it would conflict with our class functions

};

int main()
{
  Hello me;                                      // Create an object from a class
  me.name("Dave");                               // Call a function to change the name
  std::cout << "Hello, " << me.name() << "!\n";  // use the name
  return 0;
}
