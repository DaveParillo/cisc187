#pragma once

#include <iostream>
#include "Figure.h"

using std::size_t;

class Rectangle : public Figure {
  public:
    Rectangle()
      : _ht{1}, _wd{1} {}

    Rectangle(size_t height, size_t width)
      : _ht{height}, _wd{width} {}

    size_t height() const { return _ht;};
    size_t width()  const { return _wd;};
    double area()   const override;
  private:
    const size_t _ht;
    const size_t _wd;
};

std::ostream& operator<<(std::ostream& os, const Rectangle& r);


