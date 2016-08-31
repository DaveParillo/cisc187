#include <string>
#include <iostream>

using namespace std;

int main()
{
	string a = "hello";
	a += ", world!";   // joining strings is pretty easy

	string b = a;      // so is copying one string into another

	if (a == b) {
		b[0] = 'H';      // and a string feels like an 'array of char' 
		b[7] = 'W';
	}

	cout << a << endl;
	cout << b << endl;

	return 0;
}
