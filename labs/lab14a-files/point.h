#pragma once

#include <string>
#include <vector>


using std::string;
using std::vector;

struct Point {
  int x;
  int y;
};

Point         get_next_point (const string& prompt);
vector<Point> get_points  ();
void          write_points(const vector<Point> points, const string& fname);
void          show_points (const vector<Point> points);
vector<Point> read_points (const string& fname);

std::istream& operator>>(std::istream& is, Point& p);


