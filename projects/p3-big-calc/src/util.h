#pragma once
#include <algorithm> 
#include <functional> 
#include <cctype>
#include <locale>

using std::string;

namespace mesa
{
  /*
   switch to boost trim?
   */

  /**
   * Trim whitespace from the start (left side) of a string.
   * @param s the string to trim
   * @return a copy of the source string with all the whitespace from 
   * position 0 to the first non-whitespace character removed.
   */
  static inline string ltrim(const string& s) {
    string x = s;
    x.erase(x.begin(), std::find_if(x.begin(), x.end(),
          std::not1(std::ptr_fun<int, int>(std::isspace))));
    return x;
  }

  /**
   * Trim whitespace from the end (right side) of a string.
   * @param s the string to trim
   * @return a copy of the source string with all the whitespace 
   * starting from the end position int the string to the 
   * first non-whitespace character removed.
   */
  static inline string rtrim(const string& s) {
    string x = s;
    x.erase(std::find_if(x.rbegin(), x.rend(),
          std::not1(std::ptr_fun<int, int>(std::isspace))).base(), x.end());
    return x;
  }

  /**
   * Trim whitespace from both ends of a string.
   * @param s the string to trim
   * @return a copy of the source string with all the 
   * surrounding whitespace removed 
   */
  static inline string trim(const string& s) {
    string x = s;
    return ltrim(rtrim(x));
  }

}


