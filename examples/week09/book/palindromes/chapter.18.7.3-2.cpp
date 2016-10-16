
//
// This is example code from Chapter 18.7.3 "Palindromes using pointers" of
// "Programming -- Principles and Practice Using C++" by Bjarne Stroustrup
//

#include <iostream>
#include <string>

using namespace std;

//------------------------------------------------------------------------------

bool is_palindrome(const char* first, const char* last)
// first points to the first letter, last to the last letter
{
    if (first<last) {
        if (*first!=*last) return false;
        return is_palindrome(++first,--last);
    }
    return true;
}

//------------------------------------------------------------------------------

istream& read_word(istream& is, char* buffer, int max)
// read at most max-1 characters from is into buffer
{
    is.width(max);         // read at most max-1 characters in the next >>
    is >> buffer;          // read whitespace terminated word,
    // add zero after the last character read into p
    return is;
}

//------------------------------------------------------------------------------

int main()
{
    const int max = 128;
    char s[max];
    while (read_word(cin,s,max)) { 
        cout << s << " is";
        if (!is_palindrome(&s[0],&s[strlen(s)-1])) cout << " not";
        cout << " a palindrome\n";
    }
}

//------------------------------------------------------------------------------
