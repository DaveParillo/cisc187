.ds CH Lab #7b: Algorithms
.so headings.ms
.TL
\*[CH]
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

.NH
Expunge Letter: 30 minutes \fImaximum\fR
.time_box
.QP
Write a function \*[c]expunge_letter\*[r] that accepts four parameters - 
two iterators delineating an input range of \*[c]strings\*[r], 
one iterator delineating the start of an output range, and a \*[c]character\*[r] 
- then copies the \*[c]string\*[r]s in the input range that \fIdo not\fR contain 
the specified character into the output range.
The function should then return an iterator one past the last location written. 
Do not use loops.

(Hint: Use the remove_copy_if algorithm and a custom function).

.bp
.so reflection2.ms

