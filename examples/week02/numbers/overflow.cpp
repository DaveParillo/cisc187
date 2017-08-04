#include <iostream>

int main() {
  // signed 8 bit int
  int8_t x = 128;
  int8_t y = 1;

  std::cout << "x + y = " << (x + y) << '\n';

  // unsigned 8 bit int
  uint8_t a = 256;
  uint8_t b = 1;
  std::cout << "a + b = " << (a + b) << '\n';
}
