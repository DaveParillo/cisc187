#include <algorithm>
#include <iostream>
#include <vector>
#include <cstdlib>
 
int main()
{
    std::vector<int> v(5);
    std::generate(v.begin(), v.end(), std::rand); // Using the C function rand()

    std::cout << "v: ";
    for (auto iv: v) {
        std::cout << iv << " ";
    }
    std::cout << "\n";

    // Initialize with default values 0,1,2,3,4 from a lambda function
    // Equivalent to std::iota(v.begin(), v.end(), 0);
    int n = {0};
    std::generate(v.begin(), v.end(), [&n]{ return n++; });

    std::cout << "v: ";
    //print using a lambda instead
    std::for_each(v.begin(), v.end(), [](int iv){ std::cout << iv << ' ';});
    std::cout << "\n";
}

