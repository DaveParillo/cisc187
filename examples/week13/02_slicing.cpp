#include "Animal.h"

#include <iostream>

using std::cout;

int main () {
  Animal a = {"Alice"};
  Canine c = {"Chuck"};
  Wolf w = {"Walt"};

  cout << "Calling pass by value\n";
  call_v(a);
  call_v(c);
  call_v(w);
  cout << "\nCalling pass by const reference\n";
  call_cr(a);
  call_cr(c);
  call_cr(w);
  cout << "\nCalling pass non-owning pointer\n";
  call_p(&a);
  call_p(&c);
  call_p(&w);

}

