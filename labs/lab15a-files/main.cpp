#include "point.h"
#include <iostream>
#include <string>
#include <vector>

int main() {
  std::string fname = "mydata.txt";
  auto original_points = get_points();

  std::cout << "\nPoints entered:\n";
  show_points (original_points);
  write_points(original_points, fname);

  auto processed_points = read_points(fname);
  std::cout << "\nPoints read back in from file:\n";
  show_points(processed_points);
}

