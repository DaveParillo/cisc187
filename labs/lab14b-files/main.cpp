#include "Person.h"

#include <iostream>
#include <memory>

using std::shared_ptr;
using std::cout;

void change_and_compare(Person&, Person&);
void copy1(Person&);
void copy2(Person&);

int main () 
{
  // Deep copy scenario #1
  // create objects a,b,c
  Person a {"Alice"};
  shared_ptr<Person> b (new Person{"Bob"});
  auto c = std::make_shared<Person>("Carol");

  b->child(c);
  a.child(b);

  cout << "Copy 1: \n";
  cout << "Original: \t";
  cout << a << '\t';
  copy1(a);

  // Deep copy scenario #2
  // create objects d,e,f
  Person d {"Dan"};
  auto e = std::make_shared<Person>("Edith");
  auto f = std::make_shared<Person>("Fred");

  e->child(f);
  d.child(e);

  cout << "Copy 2: \n";
  cout << "Original: \t";
  cout << d << '\t';
  copy2(d);

  cout << std::endl;
  return 0;
}

void copy1(Person& x)
{
  auto xcopy = std::make_shared<Person>(x);
  change_and_compare(x, *xcopy);
}

void copy2(Person& x)
{
  Person xcopy(x);
  change_and_compare(x, xcopy);
}

void change_and_compare(Person& x, Person& y)
{
  cout << "Copy: \t";
  cout << y << std::endl;

  cout << "changing only the 'copy' objects: \n";
  y.name("First");
  y.child()->name("Second");
  y.child()->child()->name("Third");
  cout << "Original: \t";
  cout << x << '\t';
  cout << "Copy: \t";
  cout << y << std::endl;
}


