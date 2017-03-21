#include <iostream>
using namespace std;

int main()
{
  int count = 2;
  auto lambda = [count] { 
    cout << "Hello, lambda " << count << "!" << endl; 
  };
  lambda();
}

