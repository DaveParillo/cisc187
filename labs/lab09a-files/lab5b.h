#pragma once


#include <algorithm>
#include <chrono>
#include <iostream>
#include <iomanip>
#include <list>

#include <random>
#include <vector>

using std::list;
using std::vector;
using sys_time = std::chrono::system_clock;
using time_point = std::chrono::time_point<std::chrono::system_clock>;

/**
 * Insert a value into a container
 * keeping the sort order as the insert progress.
 */
template<class C> 
inline void sorted_insert(C& container, const int value) {
  // Your code here:
  // Step 1: create an iterator pointing to the beginning of the container
  // Step 2: loop and increment until you find the correct insert position
  // Step 3: Insert the provided value at the iterator position
}

/**
 * print the total duration of an event based on the difference
 * between the start time and now
 */
void print_duration(const time_point& start) {
  std::cout << std::setw(10) << std::right 
    << std::chrono::duration_cast<std::chrono::milliseconds>(sys_time::now() - start).count();
}

/**
 * Return a random integer between 1 and max.
 */
inline int randint(const int max) {
  static std::random_device r;
  static std::default_random_engine eng(r()); 
  return std::uniform_int_distribution<int> {0, max} (eng);
}


/**
 * Shuffle the values in the provided container.
 */
inline void randomize(vector<int>& sequence) {
  static std::random_device r;
  static std::default_random_engine eng(r()); 
  std::shuffle(sequence.begin(), sequence.end(), eng);
}


 
/**
 * Insert 'max' number of elements into a container
 * keeping the sort order as the insert progress.
 */
template<class C> 
void test_insert(C& container, const int max) {
  auto start = sys_time::now();
  // Your code here
  // 
  // Call the sorted_insert function max times
  // pass the provided container and a random integer as arguments
  //
  // Consider using the randint function provided in this header.
  //
  
 
  // Leave this line here
  print_duration(start);
}


/**
 * Insert elements into a container
 * keeping the sort order as the insert progress.
 * Values to be inserted are drawn from 'rand_values',
 * which is expected to be properly randomized before
 * this function is called.
 */
template<class C> 
void test_insert(C& container, const vector<int>& rand_values) {
  auto start = sys_time::now();
  // Your code here
  // 
  // Call the sorted_insert function once for each rand_value
  // Insert each of the values from rand_values
  // one at a time into the provided container.
  //
 
  // Leave this line here
  print_duration(start);
}


/**
 * Add 'max' number of elements to the beginning of a container
 */
template<class C> 
void test_insert_begin(C& container, const int max) {
  auto start = sys_time::now();
  // Your code here
  // 
  // Call the function insert() on the provided container
  // max number of times.
  // Ensure EVERY insert is at the front of the container.
  // You may insert any value, even the same value repeatedly.
  //
  
  // Leave this line here
  print_duration(start);
}

/**
 * Add 'max' number of elements to the end of a container
 */
template<class C> 
void test_insert_end(C& container, const int max) {
  auto start = sys_time::now();
  // Your code here
  // 
  // Call the function insert() on the provided container
  // max number of times.
  // Ensure EVERY insert is at the back of the container.
  // You may insert any value, even the same value repeatedly.
  //
  
  // Leave this line here
  print_duration(start);
}


/**
 * Remove elements randomly from a container.
 * @param max number of removes to execute.
 * @return a vector of the randomly selected container positions
 * used during the remove process.
 * This allows the randomly generated positions to be reused in
 * another test_remove call.
 */
template<class C> 
vector<int> test_remove(C& container, const int max) {
  auto start = sys_time::now();
  vector<int> rand_sequence;

  for (int i = 0; i < max; ++i) {
    auto it = container.begin();
    auto rand = randint(max-1) % container.size();
    std::advance(it,rand);
    container.erase(it);
    rand_sequence.push_back(rand);
  }
  print_duration(start);
  return rand_sequence;
}

/**
 * Remove elements from a container.
 * Values are removed at random locations as determined by 'rand_indices'
 * which is expected to be properly randomized before
 * this function is called.
 */
template<class C> 
void test_remove(C& container, const C& rand_indices) {
  auto start = sys_time::now();
  // Your code here
  // 
  // Erase each element in the provided container
  // one at a time, using the index values provided in rand_indices.
  //
  // Your solution must use a range for loop
  
  // Leave this line here
  print_duration(start);
}

