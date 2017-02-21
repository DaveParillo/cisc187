#include <iostream>
#include <stack>
#include <string>
#include <list>
using std::cout;
using std::stack;

template <class T>
void pop_all(T& s) {
  cout << "\nsize of stack: " << s.size() << '\n';
  while(!s.empty()) {
    cout << s.top() << " ";
    s.pop();
  }
  cout << "\npop all from stack\n";
  cout << "size of stack: " << s.size() << '\n';
}

int main () {
  cout << "initialize stack from list:\n";
  std::list<int> t = { 1, 2, 3, 4, 5 };
  stack<int, std::list<int>> istack(t);

  cout << "list has " << t.size() << " entries";

  pop_all (istack);

  stack<std::string> sstack;
  cout << "push strings onto stack...";
  sstack.push("one");
  sstack.push("two");
  sstack.push("three");
  sstack.push("four");
  sstack.push("five");

  pop_all (sstack);

  return 0;
}
