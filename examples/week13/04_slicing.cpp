#include "Animal.h"

#include <functional>   // std::reference_wrapper and std::ref
#include <memory>       // std::unique_ptr
#include <iostream>
#include <vector>

int main () {
  std::vector<Animal*> v;
  v.push_back(new Animal{"alice"});
  v.push_back(new Canine{"chuck"});
  v.push_back(new Wolf{"white fang"});

  cout << "Calling pass by value\n";
  for (auto i = 0u; i < v.size(); ++i) {
    call_v (*v[i]);
  }
  cout << "\nCalling pass by const reference\n";
  for (auto i = 0u; i < v.size(); ++i) {
    call_cr (*v[i]);
  }
  cout << "\nCalling pass non-owning pointer\n";
  for (auto i = 0u; i < v.size(); ++i) {
    call_p (v[i]);
  }

  cout << "\n\nUsing std::ref instead of raw pointer\n";

  std::vector<std::reference_wrapper<Animal>> ref;
  Animal a = {"alice"};
  Canine c = {"chuck"};
  Wolf w = {"white fang"};
  ref.push_back(a);
  ref.push_back(c);
  ref.push_back(w);

  cout << "Calling pass by value\n";
  for (auto i = 0u; i < ref.size(); ++i) {
    call_v (ref[i].get());
  }
  cout << "\nCalling pass by const reference\n";
  for (auto i = 0u; i < ref.size(); ++i) {
    call_cr (ref[i].get());
  }

}

