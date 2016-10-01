// from Effective C++, item # 35
//
// Does is make sense for a Square to inherit from Rectangle?
#include <cassert>
#include <iostream>
#include "Rectangle.h"
#include "Square.h"

using std::size_t;

void   Rectangle::height(size_t new_height) { _ht = new_height; }
void   Rectangle::width (size_t new_width)  { _wd = new_width; }
size_t Rectangle::height() const { return _ht; }
size_t Rectangle::width () const { return _wd; }

void   Square::height(size_t new_height) { _ht = new_height; _wd = _ht; }
void   Square::width (size_t new_width)  { _wd = new_width;  _ht = _wd; }
size_t Square::height() const { return _ht; }
size_t Square::width () const { return _wd; }


// function to increase r's area
void makeBigger(Rectangle& r);

std::ostream& operator<<(std::ostream& os, const Rectangle& r);
std::ostream& operator<<(std::ostream& os, const Square& s);



int main () 
{
  Rectangle rect;
  std::cout << "Rectangle Size: " << rect << std::endl;
  makeBigger(rect);
  std::cout << "  New: " << rect << std::endl;
  Square s;
  std::cout << "Square Size: " << s << std::endl;
  makeBigger(s);
  std::cout << "  New: " << s << std::endl;
  return 0;
}


void makeBigger(Rectangle& r)
{
  size_t oldHeight = r.height();
  r.width(r.width() + 10);
  assert(r.height() == oldHeight); // assert that r's height is unchanged
}

std::ostream& operator<<(std::ostream& os, const Rectangle& r)
{
  return os << r.height() << " h, " << r.width() << " w\n";
}

std::ostream& operator<<(std::ostream& os, const Square& s)
{
  return os << s.height() << " h, " << s.width() << " w\n";
}

