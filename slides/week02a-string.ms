
.TL
.gcolor blue
std::string
.gcolor
.LP
.ce 1
Week 2
.SS Overview
.IT You have \fBalready\fR read the text
.IT Strings in C
.IT Strings in C++
.IT Interoperability
.SS Strings in C
.IT In C, a 'string' is literally an array of \*[c]char\*[r]
.i1 with a null terminator
.i1s
These declarations all do the same thing
.CW
 \m[green]// the char array must be null terminated\m[]
 char a[] = {'h', 'e', 'l', 'l', 'o', '\0'};

 \m[green]// The null character == 0\m[]
 char b[] = {'h', 'e', 'l', 'l', 'o', 0};

 \m[green]// a string is just a special case of a char array\m[]
 char buf[6] = "hello"; 
 char* c = "hello";
.R
.i1e
.SS Limits of C strings
.IT C strings don't know their own size
.IT Array types are not assignable
.i1s
This is a compiler error
.CW
 char a[6] = "hello"; 
 char b[6] = "there";

 a = b;
.R
.i1e
.IT The tools that work with C strings are few and have inconsistent interfaces
.SS Copy a C string
.IT There are a few ways:
.i1s
Hand rolled loop (bad)
.CW
 for (int i = 0; a[i]; ++i) { \m[green]// anything odd here?\m[]
   a[i] = b[i];
 }
.R
.i1e
.SS Copy a C string
.IT There are a few ways:
.i1s
Hand rolled loop (bad)
.CW
 for (int i = 0; a[i]; ++i) { \m[green]// anything odd here?\m[]
   a[i] = b[i];
 }
.R
.i1e

.i1s
While loop idiom (worse)
.CW
  while ( (*dest++ = *src++) );   \m[green]// you'll see this\m[]
.R
.i1e
.SS Copy a C string
.IT There are a few ways:
.i1s
Hand rolled loop (bad)
.CW
 for (int i = 0; a[i]; ++i) { \m[green]// anything odd here?\m[]
   a[i] = b[i];
 }
.R
.i1e

.i1s
While loop idiom (worse)
.CW
  while ( (*dest++ = *src++) );   \m[green]// you'll see this\m[]
.R
.i1e

.i1 \*[c]strcpy\*[r]  is the recommended way
.i1s
Use \*[c]#include <string.h>\*[r] or \*[c]#include <cstring>\*[r]
.CW
  char dest[sizeof(src)];
  strcpy(dest, src);   \m[green]// copy src into dest\m[]
.R
.i1e
.SS Strings in C++
.IT \*[c]std::string\*[r] is a class
.i1 Provides many useful member functions
.IT Designed to 'feel like' a built in type
.i1 Must \*[c]#include <string>\*[r]
.i1s
Declaring a std::string
.CW
 std::string a = "hello";  \m[green]// create a string from a C string\m[]
 std::string c ("class");  \m[green]// this works too\m[]
 std::string b {"there"};  \m[green]// this works since C++11\m[]

 a = b;  \m[green]// no longer a compile error\m[]
 a += b; \m[green]// simple join\m[]
 std::string c = a + b;

 std::cout << "Size: " << a.size();

.R
.i1e
.SS Working with strings
.IT Access feels like an array
.i1s
Access using \*[c]operator[]\*[r] is \fBnot\fR range checked
.CW
 string a = "hello";
 a[0] = 'H';   \m[green]// OK\m[]
 a[-1] = 'H';  \m[green]// Compiles, UBE, might crash\m[]
 char b = a[0];
.R
.i1e

.i1s
Access using \*[c]at()\*[r] is range checked
.CW
 string x = "hello";
 x.at(0) = 'H';   \m[green]// OK\m[]
 x.at(-1) = 'H';  \m[green]// Compiles, throws exception\m[]

 char y = b.at(0);
.R
.i1e
.IT Other access functions
.i1 \*[c]front()\*[r], \*[c]back()\*[r]
.i1 \*[c]data()\*[r]
.i1 \*[c]c_str()\*[r]
.SS String operations
.IT Unlike arrays, \*[c]std::string\*[r] knows its own size
.i1s
Pro tip: always use \*[c]empty()\*[r] if the container offers it
.CW
 string x = "hello";
 for (size_t i = 0; i < x.size(); ++i)
 if (x.empty())
.R
.i1e
.IT \*[c]std::string\*[r] provides several search functions
.i1 \*[c]find()\*[r], \*[c]rfind()\*[r]
.i1 \*[c]find_first_of()\*[r], \*[c]find_first_not_of()\*[r]
.IT and modify functions
.i1 \*[c]clear()\*[r], \*[c]erase()\*[r]
.i1 \*[c]append()\*[r]
.i2 Appends characters to a \*[c]string\*[r]
.i1 \*[c]operator +=\*[r]
.i2 Appends strings to a \*[c]string\*[r]
.i1 \*[c]push_back()\*[r], \*[c]pop_back()\*[r]
.IT More operations exist besides these
.SS Side notes
.IT Some string functions take string arguments
.i1 Some expect a single \*[c]char\*[r]
.i2 This is another common pain point
.i1 When in doubt, look it up
.i2 https://en.cppreference.com/w/cpp/string/basic_string

.IT Although \*[c]std::string\*[r] is most commonly encountered
.i1 It's not the only string type
.IT Technically \*[c]std::string\*[r] is a wrapper around
.i1 \*[c]std::basic_string<char>\*[r]
.IT There are strings of other character types
.i1 \*[c]std::wstring\*[r] wraps \*[c]std::basic_string<wchar_t>\*[r]
.i1 \*[c]std::u16string\*[r] wraps \*[c]std::basic_string<char16_t>\*[r]
.i1 \*[c]std::u32string\*[r] wraps \*[c]std::basic_string<char16_t>\*[r]
.SS Interoperability
.IT A C string is \fBnot\fR a \*[c]std::string\*[r] 
.i1 Can't use a \*[c]std::string\*[r] when a C string is expected
.i1s
This is a common source of error
.CW
 std::string hello = {"my name is Alice"};

 \m[green]// These are compile errors!\m[]
 printf ("Hello again, %s\\n", hello);
 puts (hello);
.R
.i1e

.i1s
The best fix this is to use the \*[c]c_str()\*[r] function

.CW
 printf ("Hello again, %s\\n", hello.c_str());   \m[green]// OK\m[]
 puts (hello.c_str());                          \m[green]// OK\m[]
.R
.i1e
.bp
.IT Another point of confusion
.i1s
Because strings are initialized like this:
.CW
 std::string foo = "some text";
.R
.i1e

.i1 You might think that any place you see double quotes, the type is \*[c]std::string\*[r]

.i1 \m[red]This is \fBnever\fP true!\m[]

.i1 String literals like \fC"any text"\fR are always type \*[c]const char*\*[r]

.i1s
So what's going on in the following statements?
.CW
 std::string foo = "some text";

 auto bar = "other text";        \m[green]// what type is bar?\m[]

 auto yaz = "c++14 text"s;        \m[green]// what type is yaz?\m[]
.R
.i1e
.SS Summary
.IT Strings in C
.i1 Just an array of \*[c]char\*[r]
.i1 Not assignable
.i1 Very lightweight, but troublesome
.IT Strings in C++
.i1 A class
.i1 A container of \*[c]char\*[r]
.i1 Provides functions for many useful operations
.IT Interoperability
.i1 Know which functions expect \*[c]char\*[r]
.i1 Know which functions expect \*[c]std::string\*[r]
.i1 Pass appropriately

