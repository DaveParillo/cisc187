#include <chrono>
#include <ctime>
#include <stdexcept>

#include "Date.h"

namespace mesa {

  Date::Date (int y, Month m, int d) {
  }

  Date::Date() {
  }


  //
  //
  //  date helpers
  //
  //

  Month to_month(int month) {
    return Month::JAN;
  }

  bool is_date(int year, Month month, int day) {
    return false;
  }

  
  
  std::ostream& operator<<(std::ostream& os, const Date& d) {
    return os;
  }

  std::istream& operator>>(std::istream& is, Date& dd) {
    return is;
  }

}
