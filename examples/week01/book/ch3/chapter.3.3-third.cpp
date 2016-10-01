
//
// This is example code from Chapter 3.3 "Input and type" of
// "Programming -- Principles and Practice Using C++" by Bjarne Stroustrup
//

#include <iostream>
#include <string>

using namespace std;

//------------------------------------------------------------------------------

int main()
{
    cout << "please enter your first and second names\n";
    string first;
    string second;
    cin >> first >> second;    // read two strings
    cout << "Hello, " << first << ' ' << second << '\n';
}

//------------------------------------------------------------------------------
