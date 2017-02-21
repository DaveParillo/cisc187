#include <algorithm>
#include <iostream>
#include <list>
using std::cout;
using std::list;

void print_list(const list<int>& t) {
  // range-based for loop
  cout << "list contains: " << '\n';
  for(const int i: t) {
    cout << i << " ";
  }
  cout << "\n\n";
}
list<int>::iterator move_to(list<int>& t, int value) {
  auto it = t.begin();
  while((*++it != value) && (it != t.end()));
  return it;
}

int main () {
  list<int> ilist = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
  cout << "size: "  << ilist.size() << '\n';
  cout << "front: " << ilist.front() << '\n';
  cout << "back: "  << ilist.back() << "\n\n";

  cout << "push_back 13: " << '\n';
  ilist.push_back(13);
  cout << "size: "  << ilist.size() << '\n';
  cout << "back() " << ilist.back() << '\n';

  print_list(ilist);

  // need an iterator to insert and erase
  auto it1 = move_to(ilist, 5);
  if (it1 != ilist.end()) {
    cout << "insert 21 before 5:" << '\n';
    ilist.insert(it1, 21);
  }
  print_list(ilist);

  it1 = move_to(ilist, 7);
  if (it1 != ilist.end()) {
    cout << "erase 7:" << '\n';
    ilist.erase(it1);
  }

  print_list(ilist);

  cout << "erase items between 21 and 8:" << '\n';
  it1 = move_to(ilist, 21);
  auto it2 = move_to(ilist, 8);
  if (it1 != ilist.end() && it2 != ilist.end()) {
    cout << "found items: " << *it1 << " & " << *it2 << '\n';
    ilist.erase(it1, it2);
    print_list(ilist);
  }

  return 0;
}
