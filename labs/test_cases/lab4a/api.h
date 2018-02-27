#pragma once

namespace mesa {

  long abs (const long n);

  double abs (const double n);

  // seems redundant, but included so that any type provided will compile
  unsigned abs (const unsigned n);

  // for types that are at least 64 bit
  // see http://en.cppreference.com/w/cpp/language/types

  long long abs (const long long n);
  long double abs (const long double n);
  unsigned long abs (const unsigned long n);

}

