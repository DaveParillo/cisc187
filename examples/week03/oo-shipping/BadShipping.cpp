#include <string>

/** 
 * A class with no encapsulation 
 */
struct BadShipping {
  int weight;      // in pounds
  int distance;    // in miles
  std::string address;
}

int main() 
{
    BadShipping bad;
    bad.weight = -3;  // Nothing prevents me from doing this
}

