.ds CH Lab #14b
.TL
Lab #14b: Algorithms
.so cover-page.ms

.bp
.NH
Word frequency: 30 minutes \fImaximum\fR
.time_box
.RS
Starting with a modified version of the example in \*[sect]21.6.1:
.CW
  #include <iostream>
  #include <map>
  #include <string>

  int main () {
    std::map<std::string,int> words;

    std::string line;
    while (std::getline(std::cin, line) && 
          !std::cin.fail() && !line.empty()) {
      ++words[line];
    }

    for (const auto& p: words) {
      std::cout << p.first << ": " << p.second << '\\n';
    }

    return 0;
  }
.R

Modify it so that it lists words in order of frequency rather than alphabetical order.

Why did I change the example provided from the text?

.NH
Expunge Letter: 30 minutes \fImaximum\fR
.time_box
.QP
Write a function \*[c]ExpungeLetter\*[r] that accepts four parameters - 
two iterators delineating an input range of \*[c]strings\*[r], 
one iterator delineating the start of an output range, and a \*[c]character\*[r] 
- then copies the \*[c]string\*[r]s in the input range that \fIdo not\fR contain 
the specified character into the output range.
The function should then return an iterator one past the last location written. 
Do not use loops.

(Hint: Use the remove_copy_if algorithm and a custom functor).


.bp
.so reflection.ms

