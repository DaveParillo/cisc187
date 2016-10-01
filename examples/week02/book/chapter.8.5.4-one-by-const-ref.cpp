
//
// This is example code from Chapter 8.5.4 "Call by const reference" of
// "Programming -- Principles and Practice Using C++" by Bjarne Stroustrup
//

#include <iostream>
#include <vector>

using namespace std;

//------------------------------------------------------------------------------

void print(vector<double> v)      // call by value; appropriate?
{
    cout << "{ ";
    for (int i = 0; i<v.size(); ++i) {
        cout << v[i];
        if (i!=v.size()-1) cout << ", ";
    }
    cout << " }\n";
}

//------------------------------------------------------------------------------

void f(int x)
{
    vector<double> vd1(10);       // small vector
    vector<double> vd2(10000);    // large vector
    vector<double> vd3(x);        // vector of some unknown size
    // ... fill vd1, vd2, vd3 with values ...
    print(vd1);
    print(vd2);
    print(vd3);
}

//------------------------------------------------------------------------------

int main()
{
    f(10);
}

//------------------------------------------------------------------------------
