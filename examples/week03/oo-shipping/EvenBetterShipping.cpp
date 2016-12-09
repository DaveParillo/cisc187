#include <string>

/** 
 * A class with simple encapsulation 
 */
class BetterShipping {
  public:
    int  weight()          { return _weight; }
    void weight(int value) { 
      value < min_weight? _weight = min_weight: _weight = value; 
    }


    int distance() { return _distance; }
    std::string address() {
      return _address;
    }
  private:
    static constexpr int min_weight = 1;
    int _weight;      // in pounds
    int _distance;    // in miles
    std::string _address;
}

int main() 
{
  BetterShipping better;
  better.weight(-3);  // Weight no longer allows this to fly
}

