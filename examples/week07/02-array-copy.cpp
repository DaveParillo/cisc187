#include <iostream>

// an old C idiom to copy a 'string'
int main()
{
  char a[] = "Hello World!";
  char b[13];
  for (int i=0; i<12;++i) std::cout << a[i];

  std::cout << std::endl;

  char *p1 = a;
  char *p2 = b;
  while ((*p2++ = *p1++));

  std::cout << "copy:\n";;
  for (int i=0; i<12;++i) std::cout << p2[i];

  std::cout << std::endl;

  return 0;
}


