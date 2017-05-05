.ds CH Lab #14a: Input and Output streams
.so headings.ms
.TL
\*[CH]
.so cover-page.ms

.bp
.NH
Reading Points from a file: 60 minutes \fImaximum\fR
.time_box
.QP
In this lab, the goal is to reinforce the basic concepts from this chapter.

The game plan is to prompt the user for data, store the data temporarily in memory,
then write the data to file.
After the data has been saved, read it back from the file and compare the two copies.
.RS
.nr step 0 1
.IP \n+[step].
Create a \*[c]Point\*[r] struct.  It should store two coordinates, \*[c]x\*[r] and \*[c]y\*[r].
.IP \n+[step].
Using the example source for this chapter, prompt the user to input 7 \fI(x,y)\fR pairs.
As the data is entered, store it in a vector of \*[c]Point\*[r]s called \*[c]original_points\*[r].
.IP \n+[step].
Print the \*[c]original_points\*[r] vector.
.IP \n+[step].
Open an \*[c]ofstream\*[r] and output each point to a file named \fCmydata.txt\fR.
.IP \n+[step].
Close the \*[c]ofstream\*[r] and open an \*[c]ifstream\*[r] to \fCmydata.txt\fR.
Read the data from \fCmydata.txt\fR and store it in a new \*[c]vector\*[r] called \*[c]processed_points\*[r].
.IP \n+[step].
Print the data elements from \*[c]processed_points\*[r].

Example output:
.CW
  > ./point
  Enter 7 integer pairs, separated by a space:
  Pair 1: 0 1
  Pair 2: 2 3
  Pair 3: 3 4
  Pair 4: 4 5
  Pair 5: 6 7
  Pair 6: 7 8
  Pair 7: 13 21

  Points entered:
  1: 0, 1
  2: 2, 3
  3: 3, 4
  4: 4, 5
  5: 6, 7
  6: 7, 8
  7: 13, 21

  Points read back in from file:
  1: 0, 1
  2: 2, 3
  3: 3, 4
  4: 4, 5
  5: 6, 7
  6: 7, 8
  7: 13, 21
.R
.bp
You may find the following function declarations for point.h helpful:
.CW
  #pragma once

  #include <string>
  #include <vector>


  using std::string;
  using std::vector;

  struct Point {
    int x;
    int y;
  };

  Point get_next_point (const string& prompt);
  vector<Point> get_points  ();
  void  write_points(const vector<Point> points, const string& fname);
  void  show_points (const vector<Point> points);
  vector<Point> read_points (const string& fname);

  std::istream& operator>>(std::istream& is, Point& p);
.R

You are not obligated to use them, but breaking the problem into manageable
chunks may help.

This is a main.cpp that uses them:
.CW
  #include "point.h"
  #include <iostream>
  #include <string>
  #include <vector>

  int main() {
    std::string fname = "mydata.txt";
    auto original_points = get_points();

    std::cout << "\nPoints entered:\n";
    show_points (original_points);
    write_points(original_points, fname);

    auto processed_points = read_points(fname);
    std::cout << "\nPoints read back in from file:\n";
    show_points(processed_points);
  }
.R

Which leaves completing point.cpp as your task.

