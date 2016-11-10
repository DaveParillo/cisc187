.ds CH Lab #12b
.TL
Lab #12b: Working with hash maps
.so cover-page.ms

.bp
.NH
Working with 
.code 
unordered_map
.B
: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a \*[c]struct Point {int x; int y; /* ... */};\*[r],
and a \*[c]struct Color {int r; int g; int b; /* ... */};\*[r],
 make an \*[c]unordered_map<Point, Color>\*[r], \*[c]pixel\*[r], and fill it with ten random items.
Consider the random solution from last week:
.CW
  int randint(int max)
  {
    static std::default_random_engine eng;
    return std::uniform_int_distribution<int> {0, max} (eng);
  }
.R

Add constructors as needed.
.IP \n+[step].
Add an overload for \*[c]std::hash<Point>\*[r].

In order to use a user-defined ADT in an unordered map, you will also need to create overloads for 
\*[c]operator==\*[r] and \*[c]operator<\*[r] at a minimum. 
You code won't compile without these.
.IP \n+[step].
Output each Point, Color pair.
.RS
You will need \fBthree\fR overloads for \*[c]operator<<\*[r].
.br
One for \*[c]const Point&\*[r], 
one for \*[c]const Color&\*[r], and 
another for \*[c]const std::pair<T1,T2>&\*[r].
.RE
.IP \n+[step].
Create a new map object.  A regular \*[c]map\*[r], not an unordered_map.
.IP \n+[step].
Copy all the items from the \*[c]unordered_map pixel\*[r] into the new map.
Print out the new map.
.RE


.bp
.so reflection.ms

