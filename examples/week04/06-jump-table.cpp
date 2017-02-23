#include <iostream>
#include <string>
using std::cout;

// could these be std:: strings? yes.
// or just a char? yes.
// but we are in pointers week, so we're going a bit 'old school'

const char* prompt();
int jump(const char*);

void a() { cout << "you chose a()\n"; }
void b() { cout << "you chose b()\n"; }
void c() { cout << "you chose c()\n"; }

// this is our 'jump table'
// it's just an array of function pointers
void (*functions[])() = { a, b, c, nullptr };

int main() {
  while(jump(prompt()))        // loop until we get a 0 from jump
    ;                          // the semi-colon is on a separate line to 
                               // silence warnings about a missing loop body
  cout << "\nDone.\n";
  return 0;
}

const char* prompt () {
  cout << "Choose an option:\n";
  cout << "1. Function a\n";
  cout << "2. Function b\n";
  cout << "3. Function c\n";
  cout << "q. Quit.\n";
  cout << ">> ";

  std::string opt;
  std::cin >> opt;
  return opt.c_str();  // convert our std::string to const char *
                       // since C++11 data() == c_str()
}

int jump (const char* rs) {
  char code = rs[0];
  if(tolower(code) == 'q') return 0;

  int length = 0;
  while( functions[length] != nullptr ) ++length;

  int choice = int (code - '0');   // convert ASCII char to int
  --choice;                        // convert choice to array index
  if( choice < 0 || choice >= length ) {
    cout << "'" << code << "' is an invalid choice, try again.\n";
  } else {
    functions[choice]();
  }
  return 1;

}

