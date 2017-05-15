#include <iostream>
// From 'The C++ Programming Language'
//
template<int M, int K, int S> 
struct Unit { // a unit in the MKS system
 enum { m=M, kg=K, s=S };
};

template<class Unit>
struct Quantity {
  double val;                          // magnitude
  explicit Quantity(double d) : val(d) {} // construct a Quantity from a double
};

// if we multiply two unit value add their units
template <class U1, class U2>
struct Uplus {
  using type = Unit<U1::m+U2::m, U1::kg+U2::kg, U1::s+U2::s>;
};
template <class U1, class U2>
using unit_plus = typename Uplus<U1, U2>::type;
// if we divide two unit value subtract their units
template <class U1, class U2>
struct Uminus {
  using type = Unit<U1::m-U2::m, U1::kg-U2::kg, U1::s-U2::s>;
};
template <class U1, class U2>
using unit_minus = typename Uminus<U1, U2>::type;

using Speed = Quantity<Unit<1,0,-1>>; // meters/second type
using Acceleration = Quantity<Unit<1,0,-2>>; // meters/second/second type

using Meter = Unit<1,0,0>; // unit: sec
using Second = Unit<0,0,1>; // unit: sec
using Second2 = Unit<0,0,2>; // unit: second*second

// overload floating point literal
// a f-p literal suffixed by ‘s’
const Quantity<Second> operator"" _s(long double d) {
  return Quantity<Second> (d);
}

const Quantity<Second2> operator"" _s2(long double d) {
  return Quantity<Second2> (d);
}

const Quantity<Meter> operator"" _m(long double d) {
  return Quantity<Meter> (d);
}

template<class U>
Quantity<U> operator+(const Quantity<U>& x, const Quantity<U>& y) {
  return Quantity<U> {x.val + y.val};
}
template<class U>
Quantity<U> operator-(const Quantity<U>& x, const Quantity<U>& y) {
  return Quantity<U> {x.val - y.val};
}
template<class U1, class U2>
Quantity<unit_minus<U1,U2>> operator/(const Quantity<U1>& x, const Quantity<U2>& y) {
  return Quantity<unit_minus<U1,U2>> {x.val / y.val};
}

template<class U>
std::ostream& operator<<(std::ostream& os, const Quantity<U>& rhs) {
  return os << rhs.val;
}

int main() {
  auto distance = Quantity<Meter>{100};  // 100 meters
  auto time = Quantity<Second>{20.5};
  auto speed = distance / time;

  std::cout << "Speed: " << speed << '\n';

  // 3 different ways to express the same thing...
  // verbose
  Speed sp1 = Quantity<Unit<1,0,0>> (100)/ Quantity<Unit<0,0,1>> (9.8); 
  // shorter
  Speed sp2 = Quantity<Meter> (100)/ Quantity<Second> (9.8);
  // using literal overload
  Speed sp3 = 100.0_m/9.8_s;
  std::cout << "Speeds: " << sp1 << '\t' << sp2 << '\t' << sp3 << '\t' << '\n';
}


