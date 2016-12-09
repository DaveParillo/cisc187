#include <iostream>
#include <fstream>
#include <string>

struct test
{
  int16_t a;
  double b;
  char c[25];
};

void write_binary(test& obj, std::string& fname);
void read_binary (test& obj, std::string& fname);
std::ostream& operator<<(std::ostream& os, const test& rhs);

int main()
{
  std::string filename = "test.bin";
  test mine;

  mine.a = 42;
  mine.b = 2.781828;

  char string[] = "Hello World!";

  char *p1;
  char *p2;

  p1 = string;
  p2 = &mine.c[0];

  while ((*p2++ = *p1++));

  std::cout << mine << std::endl;
  write_binary(mine, filename);

  test yours;
  std::cout << "before read:\n";
  std::cout << yours << std::endl;
  read_binary(yours, filename);

  std::cout << "after:\n";
  std::cout << yours << std::endl;

  return 0;
}

void write_binary(test& obj, std::string& fname) 
{
  using std::ios;
  std::ofstream fileout(fname, ios::out|ios::binary|ios::ate);

  fileout.write(reinterpret_cast<char *>(&obj), sizeof(test));
  fileout.close();
}

void read_binary(test& obj, std::string& fname) 
{
  using std::ios;
  std::ifstream filein(fname, ios::binary|ios::in);
  filein.read(reinterpret_cast<char *>(&obj) ,sizeof(test));
  filein.close();
}

std::ostream& operator<<(std::ostream& os, const test& rhs)
{
  return os << rhs.a << ' ' << rhs.b << ' ' << rhs.c;
}



