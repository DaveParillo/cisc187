#include "tree.h"

#include <iostream>
#include <string>

using std::string;


int main () {
  auto yes = make_tree(string("an elephant"));
  auto no = make_tree(string("a mouse"));
  auto root = make_tree(string("Is it bigger than a breadbox?"), no, yes);

  std::cout << root;

  return 0;
}
