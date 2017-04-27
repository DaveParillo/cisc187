#pragma once

#include <iosfwd>
#include <string>

using std::string;

// A POD for a God
struct God {
    God() = default;
    God(const string& n, const string& m, const string& v, const string& w)
        : name(n), mythology(m), vehicle(v), weapon(w) { }
    string name;
    string mythology;
    string vehicle;
    string weapon;
};

std::ostream& operator<<(std::ostream& os, const God& g);



