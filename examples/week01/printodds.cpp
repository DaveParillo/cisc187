//
// Print all the odd numbers between 1 and 100, inclusive
//
#include <iostream>
int main()
{
  std::cout << "Odd numbers:\n";
	for(int num = 1; num <= 100; ++num)
	{
		if(num % 2 != 0)
			std::cout << '\t' << num << '\n';
	}
}
