#include <stdexcept>

#include "Book.h"
#include "Genre.h"


Book::Book (unsigned long isbn, string title, string author, Date d, Genre g)
{
}

void Book::check_out() {
}

void Book::check_in() {
}


std::ostream& operator<<(std::ostream& os, const Book& b) {
  return os;
}

