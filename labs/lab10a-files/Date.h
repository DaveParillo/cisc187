#pragma once

#include <iostream>

namespace mesa {

  enum class Month {
    JAN=1, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC
  };

  class Date {
    public:
      Date (int y, Month m, int d);
      Date();

      int   day()   const { return day_; }
      Month month() const { return month_; }
      int   year()  const { return year_; }

    private:
      int year_;
      Month month_;
      int day_;
  };

  /**
   * @return true if the provided values are a valid Date.
   * @param year component of Date
   * @param month component of Date
   * @param day component of Date
   */
  bool is_date(int year, Month month, int day);

  Month to_month(int month);

  /**
   * @return true if the year is a leapyear.
   * @param year to evaluate
   */
  inline bool is_leapyear(int year) {
    return false;
  }

  inline bool operator==(const Date& lhs, const Date& rhs) {
    return false;
  }

  inline bool operator!=(const Date& lhs, const Date& rhs) {
    return false;
  }

  std::ostream& operator<<(std::ostream& os, const Date& d);
  std::istream& operator>>(std::istream& is, Date& d);

}
