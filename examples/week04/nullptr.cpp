#include <cstdio>
// common, but not a universal C definition of null
#ifndef NULL
#define NULL (0LL) 
#endif

void func (int i) {
  printf ("int i = %d\n", i);
}

void func (const char * s) {
  printf ("pointer s = %p\n", s);
}

int main () {
  func (0);
  //func (NULL);     // an error in C++, 
                   // unless you create an overload that takes a long long
  func (nullptr);  // preferred
  return 0;
}
