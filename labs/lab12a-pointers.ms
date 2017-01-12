.ds CH Lab #12a: Pointers
.so headings.ms
.TL
\*[CH]
.NH
Free-store allocated arrays vs 
.code vector
.B
: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to build your understanding of free-store allocated arrays 

.RS
.nr step 1 1
.IP \n[step].
Write the function \*[c]print_array10(ostream& os, int* a)\*[r] that prints out the values of array \fCa\fR (assumed to have ten elements) to \*[c]os\*[r].
.IP \n+[step].
Allocate an array of ten \*[c]int\*[r]s on the heap (using \*[c]new\*[r]), initialize it with the values of
 100, 101, 102, etc., and print out its values using \fCprint_array10\fR.
.IP \n+[step].
Write a function \*[c]print_array(ostream& os, int* a , int n)\*[r] that prints out 
the values of \*[c]a\*[r] (assumed to have n elements) to \*[c]os\*[r].
.IP \n+[step].
Allocate an array of 20 \*[c]int\*[r]s on the heap, 
initialize it with the values of 200, 201, 202, etc., and print out its values.
.IP \n+[step].
Did you remember to delete the arrays? (If not, do it.)
.RE 

Compare this to code you have written in the past to work with and print the eleements of a \*[c]vector\*[r].
What advantages does a \*[c]vector\*[r] have over an array?
What advantages does an array have over a \*[c]vector\*[r]?
.bp
.so reflection.ms

