#include <iostream>
#include <string>

// pointers like this string pointer can also point to pointers

using namespace std;

int main()
{
  string message[] = {"Alice","Bob here!","Carol checking in."};

  string *sp;   // a pointer to at least 1 string

  sp = message;
  cout << "sp:\n";
  cout << sp << endl;
  cout << *sp << endl;
  cout << *(sp + 1) << endl;
  cout << *(sp + 2) << endl << endl;


  cout << "sp2:\n";
  string *sp2 = new string [3];          //create string pointer in a different way
  *sp2 = "\nAlice has left the building";
  *(sp2 + 1) = "Bob who?";
  *(sp2 + 2) = "Carol checked out.";

  cout << sp2 << endl;
  cout << *sp2 << endl;
  cout << *(sp2 + 1) << endl;
  cout << *(sp2 + 2) << endl << endl;

  string **sp3;                 // a pointer to a string pointer

  cout << "sp3:\n";
  sp3 = &sp2;
  cout << sp3 << endl;
  cout << **sp3 << endl;

  return 0;
}
