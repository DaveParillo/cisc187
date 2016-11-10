#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main()
{
  vector<int> numbers { 1, 2, 3, 4, 5, 
                        10, 15, 20, 25, 
                        35, 45, 50 };
  auto gt_5 = count_if(numbers.begin(), 
                       numbers.end(), [](int x) { return (x > 5); });
  cout << "The # of elements > 5 is: "
    << gt_5 << "." << endl;
}
