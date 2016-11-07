.ds CH Lab #12a
.TL
Lab #12a: Working woth maps
.so cover-page.ms

.bp
.NH
Working with 
.code 
map
.B
: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a 
 \*[c]struct Item {int count; double value; /* ... */};\*[r],
 make an \*[c]map<string,Item>\*[r], \*[c]items\*[r], and fill it with ten items.
Add constructors as needed. Assign the same count to two items, but make the others different.
.IP \n+[step].
Output the (name,value) pairs to cout in some format of your choice.
.RS
You will need \fBtwo\fR overloads for \*[c]operator<<\*[r].
.br
One for \*[c]const Item&\*[r], and 
another for \*[c]const std::pair<T1,T2>&\*[r].
.RE
.IP \n+[step].
Add two new map entries 
 \fC"kiln"\fR, \*[c]Item{99,499.34}\*[r] and 
 \fC"lima beans"\fR, \*[c]Item{9988,4.95}\*[r] and print \*[c]items\*[r].
.IP \n+[step].
Print the sum of all \*[c]value\*[r]s in \*[c]items\*[r].
.IP \n+[step].
Remove (erase) two \*[c]Item\*[r]s identified by \*[c]count\*[r] from \*[c]items\*[r].

You will need to think differently about your loop in this situation.
You can't always increment your iterator as sometime, you are deleting the element it points to.
Use the return value from \*[c]erase()\*[r] to make sure you have the correct
iterator when an element is removed, 
otherwise increment the iterator.
.IP \n+[step].
Print out the map again.
.RE


.bp
.so reflection.ms

