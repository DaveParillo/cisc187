#pragma once 

#include <iostream>
#include <string>

class Person {

  public:
    Person() :message_{"Generic person"}, child_{nullptr} {}
    
    // other constructors
    Person(const Person& p);              // Copy constructor
    ~Person();                            // Destructor
     
    Person& operator=(const Person* p);   // Copy assignment

    // setters and getters
    // modifiable get_child
    Person*&      child()                      { return child_; }

    // constant get_child
    Person* child()                      const { return child_; }

    void          child(Person* p)             { child_ = p; }
    std::string   message()              const { return message_; }
    void          message(std::string s)       { message_ = s; }

    bool          has_child()            const { return child_ != nullptr; }

  private:
    std::string message_;
    Person*     child_;
};

std::ostream& operator<<(std::ostream& os, Person*& p);
