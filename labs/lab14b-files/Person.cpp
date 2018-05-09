#include "Person.h"
#include <iostream>

std::ostream& operator<<(std::ostream& os, const Person& p) {
  os << p.name() << '\t';
  if (p.has_child()) os << *(p.child()) << ' ';
  return os;
}

