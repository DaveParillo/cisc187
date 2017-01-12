//
// From the overload and template tutorial at
// http://www.cplusplus.com/doc/tutorial/functions2/
//


#include <iostream>
template <class T, class U>
bool are_equal (T a, U b) {
  return (a==b);
}

int main () {
  if (are_equal(10,10.0)) {
    std::cout << "x and y are equal\\n";
  } else {
    std::cout << "x and y are not equal\\n";
  }
}


