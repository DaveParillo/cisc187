.ds CH Lab #12a
.TL
Lab #12a: Associative Containers
.so cover-page.ms

.bp
.NH
.code 
map
.B
vs
.code vector
.B
: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a 
 \*[c]struct Item {string name; int count; double value; /* ... */};\*[r],
 make a \*[c]vector<Item>\*[r], \*[c]items\*[r], and fill it with ten items from a file.
.IP \n+[step].
Sort \*[c]items\*[r] by \*[c]name\*[r] and print it.
.IP \n+[step].
Insert 
 \*[c]Item{"horse shoe",99,12.34}\*[r] and 
 \*[c]Item{"Canon S400",9988,499.95}\*[r] and print \*[c]items\*[r].
.IP \n+[step].
Print the sum of all \*[c]value\*[r]s in \*[c]items\*[r].
.IP \n+[step].
Sort \*[c]items\*[r] by \*[c]value\*[r]; print it in order of decreasing value (i.e., largest value first).
.IP \n+[step].
Remove (erase) two \*[c]Item\*[r]s identified by \*[c]name\*[r] from \*[c]items\*[r].


Now perform a similar set of operations, but using a map instead.



.nr step 1 1
.IP \n[step].
Define a 
 \*[c]struct Item {int count; double value; /* ... */};\*[r],
 make a \*[c]amp<string,Item>\*[r], \*[c]items\*[r], and fill it with ten items from a file.
.IP \n+[step].
Output the (name,value) pairs to cout in some format of your choice.
.IP \n+[step].
Insert map entries 
 \fC"horse_shoe"\fR, \*[c]Item{99,12.34}\*[r] and 
 \fC"Canon S400"\fR, \*[c]Item{9988,499.95}\*[r] and print \*[c]items\*[r].
.IP \n+[step].
Print the sum of all \*[c]value\*[r]s in \*[c]items\*[r].
.IP \n+[step].
Copy \*[c]items\*[r] int a new \*[c]map <int, string>;\*[r]
.IP \n+[step].
Print the new map to cout.



.RE


.bp
.so reflection.ms

