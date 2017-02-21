#include <stdio.h>

// an old C idiom to copy a 'string'
int main () {
  char a[] = "Hello World!";
  char b[13];
  for (int i=0; i<12;++i) printf("%c", a[i]);

  printf("\n");


  char *p1 = a;
  char *p2 = b;
  while ((*p2++ = *p1++));

  printf("copy:\n");
  for (int i=0; i<12;++i) printf("%c", p2[i]);

  printf("\n");

  return 0;
}


