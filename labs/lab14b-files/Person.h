#pragma once 

#include <iosfwd>
#include <memory>
#include <string>

using std::shared_ptr;

class Person {

  public:
    Person(std::string name = "Generic person") 
      : name_{name}, 
        child_{shared_ptr<Person>(nullptr)} 
     {}
    ~Person() = default;                          // Destructor
    
    // other constructors
    Person(const Person&) = default;              // Copy constructor
     
    Person& operator=(const Person&) = default;   // Copy assignment

    // setters and getters
    shared_ptr<Person> child()           const { return child_; }
    void          child(shared_ptr<Person> p)  { child_ = p; }
    std::string   name()                 const { return name_; }
    void          name(std::string n)          { name_ = n; }

    bool          has_child()            const { return child_ != nullptr; }

  private:
    std::string name_;
    shared_ptr<Person> child_;
};

std::ostream& operator<<(std::ostream&, const Person&);

