.ds CH Lab #12a
.TL
Lab #12a: Associative Containers
.so cover-page.ms

.bp
.NH
\fCmap\fB vs \fCvector\fB: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a \fCstruct Item { string name; int count; double value; /* . . . */};\fR,
make a \fCvector<Item>\fR, \fCitems\fR, and fill it with ten items from a file.
.IP \n+[step].
Sort \fCitems\fR by \fCname\fR and print it.
.IP \n+[step].
Insert \fCItem{"horse shoe",99,12.34}\fR and \fCItem{"Canon S400",9988,499.95}\fR and print \fCitems\fR.
.IP \n+[step].
Print the sum of all \fCvalue\fRs in \fCitems\fR.
.IP \n+[step].
Sort \fCitems\fR by \fCvalue\fR; print it in order of decreasing value (i.e., largest value first).
.IP \n+[step].
Remove (erase) two \fCItem\fRs identified by \fCname\fR from \fCitems\fR.


Now perform a similar set of operations, but using a map instead.



.nr step 1 1
.IP \n[step].
Define a \fCstruct Item { int count; double value; /* . . . */};\fR,
make a \fCamp<string,Item>\fR, \fCitems\fR, and fill it with ten items from a file.
.IP \n+[step].
Output the (name,value) pairs to cout in some format of your choice.
.IP \n+[step].
Insert map entries "horse_shoe", \fCItem{99,12.34}\fR and "Canon S400", 
\fCItem{9988,499.95}\fR and print \fCitems\fR.
.IP \n+[step].
Print the sum of all \fCvalue\fRs in \fCitems\fR.
.IP \n+[step].
Copy \fCitems\fR int a new \fCmap <int, string>;\fR
.IP \n+[step].
Print the new map to cout.



.RE


.bp
.so reflection.ms

