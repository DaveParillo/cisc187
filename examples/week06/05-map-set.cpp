#include <iostream>
#include <map>
#include <set>
#include <string>

using std::string;

int main() {
  std::map<string, int> inventory {
    {"apple", 12},
    {"kiwi", 4},
    {"lemon", 1},
    {"pear", 4},
    {"peach", 4},
    {"grape", 100},
    {"cocoa", 3},
  };

  std::set<string> all_keys;
  std::cout << "All fruit keys:\n";
  for (const auto& i: inventory) {
    auto result = all_keys.insert(i.first);
    if (!result.second) std::cout << "no insertion\n";
  }
  for (const auto& key: all_keys) {
    std::cout << key << ' ';
  }

  std::set<string> keys;

  std::cout << "\n\nAll fruit keys greater than 'kiwi':\n";
  auto it = inventory.upper_bound("kiwi");
  while(it != inventory.end()) {
    auto result = keys.insert(it->first);
    if (!result.second) std::cout << "no insertion\n";
    ++it;
  }
  for (const auto& key: keys) {
    std::cout << key << ' ';
  }
}

