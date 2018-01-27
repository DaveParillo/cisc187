#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include "Clock.h"
#include "Complex.h"
#include "Truck.h"
#include "Dog.h"

// see https://github.com/onqtam/doctest/blob/master/doc/markdown/readme.md

#include <doctest.h>
#include <string>
#include <vector>

TEST_CASE("This is the only test that is not skipped initially") {
    REQUIRE(1 != 0);
}
TEST_CASE("skipped tests" 
        * doctest::should_fail()
        * doctest::skip()) {        // default skip = true
    REQUIRE(1 == 0);
    MESSAGE("should not be reached!");
}

TEST_SUITE ("Dogs") {

    TEST_CASE("Dog class defaults" 
            * doctest::skip(true)) {
        Dog d;
        CHECK(d.name() == "Fido");
        CHECK(d.size() == Size::MEDIUM);
        CHECK(d.bark() == "Ruff");
    }

    TEST_CASE("Dog sizes" 
            * doctest::skip(true)) {
        Dog alfie {Size::SMALL};
        CHECK(alfie.size() == Size::SMALL);

        Dog balto {Size::MEDIUM};
        CHECK(balto.size() == Size::MEDIUM);

        Dog cujo {Size::LARGE};
        CHECK(cujo.size() == Size::LARGE);
    }

    TEST_CASE("Dog sounds" 
            * doctest::skip(true)) {
        Dog alfie {Size::SMALL};
        CHECK(alfie.bark() == "Yip");

        Dog balto {Size::MEDIUM};
        CHECK(balto.bark() == "Ruff");

        Dog cujo {Size::LARGE};
        CHECK(cujo.bark() == "Woof");
    }

    TEST_CASE("Dog names" 
            * doctest::skip(true)) {
        Dog d;
        CHECK(d.name() == "Fido");
        d.name("Balto");
        CHECK(d.name() == "Balto");
        d.name("Cujo");
        CHECK(d.name() == "Cujo");
    }

    TEST_CASE("Dog vector" 
            * doctest::skip(true)) {
        std::vector<Dog> dogs = {Dog{Size::SMALL}, 
                                 Dog{Size::MEDIUM}, 
                                 Dog{Size::LARGE}};
        CHECK(dogs[0].bark() == "Yip");
        CHECK(dogs[1].bark() == "Ruff");
        CHECK(dogs[2].bark() == "Woof");

    }
}

TEST_CASE("Clock test" 
        * doctest::skip(true)) {
    Clock c;
    c.time("15:45");
    CHECK(c.time() == "15:45");
}

TEST_CASE("Complex test" 
        * doctest::skip(true)) {
    Complex a;  // default complex number

    REQUIRE(doctest::Approx(0).epsilon(0.01) == a.real()); // allow for a 1% error
    REQUIRE(doctest::Approx(0).epsilon(0.01) == a.imaginary());

    Complex b = {3.14159, -5.5};
    // verify using a different check function
    CHECK_EQ(doctest::Approx(3.142).epsilon(0.001), b.real()); // allow for a 0.1% error
    CHECK_EQ(doctest::Approx(-5.5), b.imaginary());

}

