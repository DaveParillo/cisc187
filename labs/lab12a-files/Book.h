#pragma once

#include <iostream>
#include <string>

#include "Date.h"
#include "Genre.h"

using std::string;
using mesa::Date;

class Book {
  public:

    Book (unsigned long isbn, string title, string author, Date d, Genre g);

  private:
    unsigned long isbn_;
    string title_;
    string author_;
    Date   copyright_date_;
    bool   checked_out_;
    Genre  genre_;

};


inline bool operator==(const Book& lhs, const Book& rhs) 
{
  return false;
}

inline bool operator!=(const Book& lhs, const Book& rhs)
{
  return false;
}

std::ostream& operator<<(std::ostream& os, const Book& b);


