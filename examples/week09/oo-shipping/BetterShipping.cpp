#include <string>

/** 
 * A class with simple encapsulation 
 */
class BetterShipping {
  public:
    int weight()   { return _weight; }
    void weight(int value) { 
      _weight = value; 
    }

    int distance() { return _distance; }
    std::string address() {
      return _address;
    }
    // other mutators ommitted . . .
  private:
    int _weight;      // in pounds
    int _distance;    // in miles
    std::string _address;
}

int main() 
{
  BetterShipping better;
  //better.weight = -3;  // This is an error now
  better.weight(-3);  // Nothing prevents me from doing this
                      // But now I can fix it and not break my interface
}

