#include <iostream>

using namespace std;

// swap and add 1 to each of the values
void swap(long& x, long& y) {
    int t;
    t = x+1;
    x = y+1;
    y = t;
}

int main() {
    int a=10;
    int b=20;

    swap (a, b);

    cout << "a: " << a << endl;
    cout << "b: " << b << endl;

    return 0;
}

