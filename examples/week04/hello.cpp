#include <iostream>
#include <string>

using std::cout;

class Hello {
  public: 
    Hello () { 
      name_ = "Alice"; 
      cout << "make a default hello\n";
    }
    Hello (std::string n) { 
      name_ = n; 
      cout << "make a '" << n << "' hello\n";
    }
    ~Hello () { 
      cout << "destroy the '" << name_ << "' hello\n";
    }

    std::string name() const        { return name_; }
    void        name(std::string n) { name_ = n; }

  private:
    std::string name_;
};

Hello g("Global");

int main()
{
  cout << "entering main\n";

  Hello al;
  cout << "Hello, " << al.name() << "!\n";

  cout << "leaving main\n";
  return 0;
}
