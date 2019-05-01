// mesa::string class. An abstract data type for handling strings.
#ifndef MESA_STRING_H
#define MESA_STRING_H
#include <iosfwd>
#include <cstdint>
#include <cstring>
#include <utility>

namespace mesa {

  class string
  {
    private:
      size_t sz;
      char* str;
    public:
      string() 
        : sz{0}, str{0}
      { }

      string(string &other) = default;

      string(string&& other) = default;

      // The following constructor initializes the
      // string object with a C-string
      explicit string(const char* other) 
        : sz  {std::strlen(other)},
        str {new char[sz+1]}
      { 
        strcpy(str, other); 
      }
      string& operator=(const string&) = default;
      string& operator=(string &&) = default;

      ~string() = default;

      size_t length() const { return sz; }
      size_t size() const { return sz; }

      // The getValue function returns the string.
      const char* data() const { return str; };
      char*       data()       { return str; };

      // string append
      string& operator+=(string &);

  };

} // end namespace mesa

inline
mesa::string operator+(mesa::string lhs, mesa::string& rhs)
{
  lhs += rhs;
  return lhs;
}

inline
bool operator==(const mesa::string& lhs, const mesa::string& rhs) {
  return strcmp(lhs.data(), rhs.data()) == 0;
}

inline
bool operator<(const mesa::string& lhs, const mesa::string& rhs) {
  return strcmp(lhs.data(), rhs.data()) < 0;
}

inline
bool operator!=(const mesa::string& lhs, const mesa::string& rhs) {
  return !(lhs == rhs);
}

inline
bool operator>(const mesa::string& lhs, const mesa::string& rhs) {
  // note that lhs & rhs operands are reversed
  return rhs < lhs;
}

inline
bool operator<=(const mesa::string& lhs, const mesa::string& rhs) {
  return !(lhs > rhs);
}

inline
bool operator>=(const mesa::string& lhs, const mesa::string& rhs) {
  return !(lhs < rhs);
}

std::ostream& operator<<(std::ostream&, const mesa::string &);
std::istream& operator>>(std::istream&, mesa::string &);

#endif

