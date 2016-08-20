.ds CH Lab #7a
.TL
Lab #7a: Pointers
.so cover-page.ms

.bp
.NH
Free-store allocated arrays vs \fCvector\fB: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to build your understanding of free-store allocated arrays and 
contrasts arrays with vectors.

.RS
.nr step 1 1
.IP \n[step].
Allocate an array of ten \fCints\fR on the free store using \fCnew\fR.
.IP \n+[step].
Print the values of the ten \fCint\fRs to \fCcout\fR.
.IP \n+[step].
Deallocate the array (using \fCdelete[]\fR).
.IP \n+[step].
Write the function \fCprint_array10(ostream& os, int* a)\fR that prints out the values of a (assumed to have ten elements) to \fCos\fR.
.IP \n+[step].
Allocate an array of ten \fCint\fRs on the free store, initialize it with the values of
 100, 101, 102, etc., and print out its values.
.IP \n+[step].
Allocate an array of 11 \fCint\fRs on the free store, 
initialize it with the values of 100, 101, 102, etc., and print out its values.
.IP \n+[step].
Write a function \fCprint_array(ostream& os, int* a , int n)\fR that prints out 
the values of \fCa\fR (assumed to have n elements) to \fCos\fR.
.IP \n+[step].
Allocate an array of 20 \fCint\fRs on the free store, 
initialize it with the values of 100, 101, 102, etc., and print out its values.
.IP \n+[step].
Did you remember to delete the arrays? (If not, do it.)
.IP \n+[step].
Repeat 5, 6, and 8 using a \fCvector\fR instead of an array and \fCprint_vector()\fR instead of \fCprint_array()\fR.
.RE 
.NH
Pointers and arrays: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to build your understanding of pointers and their relation to arrays. 
It uses \fCprint_array()\fR from the last exercise.

.RS
.nr step 1 1
.IP \n[step].
Allocate an \fCint\fR, initialize it to 7, and assign its address to a variable \fBp1\fR.
.IP \n+[step].
Print out the value of \fBp1\fR and of the \fCint\fR it points to.
.IP \n+[step].
Allocate an array of seven \fCint\fRs; initialize it to 1, 2, 4, 8, etc.; 
and assign its address to a variable \fBp2\fR.
.IP \n+[step].
Print out the value of \fBp1\fR and of the \fCint\fR it points to.
.IP \n+[step].
Declare an int* called \fBp3\fR and initialize it with \fBp2\fR.
.IP \n+[step].
Assign \fBp1\fR to \fBp2\fR.
.IP \n+[step].
Assign \fBp3\fR to \fBp2\fR.
.IP \n+[step].
Print out the values of \fBp1\fR and \fBp2\fR and of what they point to.
.IP \n+[step].
Deallocate all the memory you allocated from the free store.
.IP \n+[step].
Allocate an array of ten \fCint\fRs; initialize it to 1, 2, 4, 8, etc.; 
and assign its address to a variable \fBp1\fR.
.IP \n+[step].
Allocate an array of ten \fCint\fRs, and assign its address to a variable \fBp2\fR.
.IP \n+[step].
Copy the values from the array pointed to by p1 into the array pointed to by \fBp2\fR.
.IP \n+[step].
Repeat 10-12 using a \fCvector\fR rather than an array.
.RE

.bp
.so reflection.ms

