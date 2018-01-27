#include <iostream>

#include "Person.h"

std::ostream& operator<<(std::ostream& os, Person& p) {
    return os << p.message();
}

