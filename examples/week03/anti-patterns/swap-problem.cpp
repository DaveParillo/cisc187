#include <unistd.h>

#include <iostream>

using namespace std;

// swap and add 1 to each of the values
void swap(long& x, long& y) {
    int t;
    t = x+1;
    x = y+1;
    y = t;
}

int main(int argc, char** argv) {
    int a = 10;
    int b = 20;
    int c = 0;
    while ((c = getopt (argc, argv, "a:b:")) != -1) {
        switch (c) {
            case 'a':
                a = std::atoi(optarg);
                break;
            case 'b':
                b = std::atoi(optarg);
                break;
            default:
                std::cerr << "Unrecognized argument. Using defaults.\n";

                std::cerr << "Usage: " << argv[0] 
                          << " [-a an_int] [-b an_int]\n";
                break;
        }
    }

    swap (a, b);

    cout << "a: " << a << ", ";
    cout << "b: " << b << endl;

    return 0;
}

