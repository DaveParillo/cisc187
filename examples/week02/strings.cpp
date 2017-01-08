#include <string>
#include <iostream>

int main()
{
  std::string a = "hello";
	a += ", world!";   // joining strings is pretty easy

  std::string b = a;      // so is copying one string into another

	if (a == b) {
		b[0] = 'H';      // and a string feels like an 'array of char' 
		b[7] = 'W';
	}

  std::cout << a << '\n';
  std::cout << b << '\n';

	return 0;
}
