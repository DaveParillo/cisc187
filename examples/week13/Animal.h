#pragma once

#include <iostream>
#include <string>

using std::cout;
using std::string;

struct Animal {
    string name_;
    Animal(string name) : name_{name} 
    {}
    virtual string name() const {
      return string("Animal name is ") + name_;
    }
};

struct Canine : public Animal {
    Canine(string name) : Animal{name} 
    {}
    virtual string name() const {
      return string("Canine name is ") + name_;
    }
};


struct Wolf : public Canine {
    Wolf(string name) : Canine{name} 
    {}
    virtual string name() const {
      return "Wolf name is Bob";
    }
};

void call_v (Animal a) {
  cout << a.name() << '\n';
}
void call_r (Animal& a) {
  cout << a.name() << '\n';
}
void call_cr (const Animal& a) {
  cout << a.name() << '\n';
}
void call_p (Animal* a) {
  cout << a->name() << '\n';
}


