#include <iostream>
#include <map>
#include <unordered_map>
#include <string>
#include <random>

using std::map;
using std::unordered_map;
using std::string;

struct Point {
  int x;
  int y;
  Point() : x(0), y(0) {}
  Point(int _x, int _y)
    : x{_x}, y{_y} {}
};

struct Color {
  int r;
  int g;
  int b;
  Color() : r(0), g(0), b(0) {}
  Color(int _r, int _g, int _b)
    : r{_r}, g{_g}, b{_b} {}
};

namespace std {
  template <>
  struct hash<Point> {
    std::size_t operator()(const Point& rhs) const {
       return  ((std::hash<int>()(911)
              ^ (std::hash<int>()(rhs.x) << 1)) >> 1)
              ^ (std::hash<int>()(rhs.y) << 1);
    }
  };
}

int randint(int max) {
  static std::random_device r;
  static std::default_random_engine eng(r());
  return std::uniform_int_distribution<int> {0, max} (eng);
}

int main() {
  return 0;
}

