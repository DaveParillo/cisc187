#include <iostream>

#include "Person.h"

using std::cout;
using std::endl;

void change_and_compare(Person& a, Person& b);
void copy1(Person& a);
void copy2(Person& a);

int main () 
{
  Person a;
  Person* b = new Person();
  Person* c = new Person();

  b->child(c);
  a.child(b);

  a.message("Alice");
  b->message("Bob");
  c->message("Carol");
  cout << "Copy 1: " << endl;
  cout << "Original: " << '\t';
  cout << a << '\t';
  copy1(a);

  cout << "Copy 2: " << endl;
  cout << "Original: " << '\t';
  cout << a << '\t';
  copy2(a);

  cout << endl;
  return 0;
}

void copy1(Person& a)
{
  Person* xcopy = new Person(a);
  change_and_compare(a, *xcopy);
  delete xcopy;
}

void copy2(Person& a)
{
  Person xcopy;
  xcopy = a;
  change_and_compare(a, xcopy);
}

void change_and_compare(Person& x, Person& y)
{
  cout << "Copy: " << '\t';
  cout << y << endl;

  cout << "change and compare: " << endl;
  y.message("Alpha");
  y.child()->message("Beta");
  y.child()->child()->message("Charlie");
  cout << "Original: " << '\t';
  cout << x << '\t';
  cout << "Copy: " << "\t";
  cout << y << endl;
}


