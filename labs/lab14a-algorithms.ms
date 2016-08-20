.ds CH Lab #14a
.TL
Lab #14a: Algorithms
.so cover-page.ms

.bp
.NH
Questions: 30 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
List every standard library algorithm on \fCen.cppreference.com/w/\fR.



.RS
Which of these are available on buffy?  In Visual Studio 2015?
.RE

.RE




.bp
.NH
Word frequency: 60 minutes \fImaximum\fR
.time_box
.RS
Starting with a modified version fo the example in §21.6.1:
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
      std::cout << p.first << ": " << p.second << '\n';
    }

    return 0;
  }
.R

Modify it so that it lists words in order of requency rather than lexicographical order.

Why did I change the example provided from the text?


.bp
.so reflection.ms

