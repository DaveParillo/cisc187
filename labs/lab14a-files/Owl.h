#pragma once

#include "Animal.h"

#include <iosfwd>
#include <string>

struct Owl : public Animal {

    Owl() {}

    std::string name()             const override { return "hootie"; }
    std::string make_sound()       const override { return "Hoot!"; }

    void  fly()
    {
      // do cool night flying things
    }

};

std::ostream& operator<<(std::ostream& os, const Owl& rhs);

