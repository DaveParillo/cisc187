//
// Test program for lab5b functions
//
//
#include "lab5b.h"

#include <cassert>
#include <iostream>
#include <list>
#include <vector>

static constexpr auto iterations = 1024 * 256;

void test_list() {
    std::cout << "                 times in msec\n";
    std::cout << "             |--  begin times  --|--   end times     --|--  remove times  --|\n";
    std::cout << "  # items      list     vector       list     vector      list     vector\n";
    std::cout << "  ---------  --------  ----------  --------  ---------- --------  ----------\n";
    for (int n = 1000; n < iterations; n *=2) {
                             // n = the number of iterations for each test
        std::vector<int> v;  // v = the vector under test
        std::list<int> t;    // t = the list   under test

        std::cout << std::setw(10) << std::right << n;
        test_insert_begin(t, n);
        test_insert_begin(v, n);
        assert(v.size() == std::size_t(n));
        assert(t.size() == std::size_t(n));

        v.clear();
        t.clear();
        assert(v.empty());
        assert(t.empty());
        
        test_insert_end(t, n);
        test_insert_end(v, n);
        assert(v.size() == std::size_t(n));
        assert(t.size() == std::size_t(n));
        
        // Ensure the vector and list are working on the same
        // set of random data.
        std::vector<int> rand_sequence(n);
        rand_sequence = test_remove(t, n); // remove from list, store remove sequence
        test_remove(v, rand_sequence);     // remove from vector in same order as list
        std::cout << "\n";

        assert(v.empty());
        assert(t.empty());

    }
}


void test_random() {
    std::cout << "                 times in msec\n";
    std::cout << "             |--  insert times  --|-- remove times --|\n";
    std::cout << "  # items      list     vector       list     vector\n";
    std::cout << "  ---------  --------  ----------  --------  ----------\n";
    for (int n = 1000; n < iterations; n *=2) {
        std::vector<int> v;
        std::list<int> t;
        std::vector<int> rand_sequence(n);
        // fill with values from (0..n]
        std::iota (rand_sequence.begin(), rand_sequence.end(), 0);
        randomize(rand_sequence);

        std::cout << std::setw(10) << std::right << n;
        test_insert(t, rand_sequence);
        test_insert(v, rand_sequence);
        assert(v.size() == std::size_t(n));
        assert(t.size() == std::size_t(n));

        rand_sequence = test_remove(t, n);
        test_remove(v, rand_sequence);
        std::cout << "\n";

        assert(v.empty());
        assert(t.empty());

    }
}

int main () {
    test_list();
    test_random();
}
