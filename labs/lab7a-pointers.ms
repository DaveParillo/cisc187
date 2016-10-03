.ds CH Lab #7a
.TL
Lab #7a: Pointers
.so cover-page.ms

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










.NH
Pointers and arrays: 60 minutes \fImaximum\fR
.time_box
.QP
Extra credit.

Only complete if time allows.  This must still be handed in at the end of lab. 
Partially complete attempts will get partial credit.

This exercise is intended to build your understanding of pointers and their relation to arrays. 
It uses \*[c]print_array()\*[r] from the last exercise.

.RS
.nr step 1 1
.IP \n[step].
Allocate an \*[c]int\*[r], initialize it to 7, and assign its address to a variable \fBp1\fR.
.IP \n+[step].
Print out the value of \fBp1\fR and of the \*[c]int\*[r] it points to.
.IP \n+[step].
Allocate an array of seven \*[c]int\*[r]s; initialize it to 1, 2, 4, 8, etc.; 
and assign its address to a variable \fBp2\fR.
.IP \n+[step].
Print out the value of \fBp1\fR and of the \*[c]int\*[r] it points to.
.IP \n+[step].
Declare an int* called \fBp3\fR and initialize it with \fBp2\fR.
.IP \n+[step].
Assign \fBp1\fR to \fBp2\fR.
.IP \n+[step].
Assign \fBp3\fR to \fBp2\fR.
.IP \n+[step].
Print out the values of \fBp1\fR and \fBp2\fR and of what they point to.
.IP \n+[step].
Deallocate all the memory you allocated from the heap.
.IP \n+[step].
Allocate an array of ten \*[c]int\*[r]s; initialize it to 1, 2, 4, 8, etc.; 
and assign its address to a variable \fBp1\fR.
.IP \n+[step].
Allocate an array of ten \*[c]int\*[r]s, and assign its address to a variable \fBp2\fR.
.IP \n+[step].
Copy the values from the array pointed to by p1 into the array pointed to by \fBp2\fR.
.RE

