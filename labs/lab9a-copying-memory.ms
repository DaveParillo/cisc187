.ds CH Lab #9a
.TL
Lab #9a: Copying and moving memory
.so cover-page.ms

This lab contains two sections: one to exercise array and one to exercise vectors 
in roughly the same manner. Do both and compare the effort involved in each.

.bp
.NH
Copying memory in arrays: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a global array \fCint ga\fR of ten \fCint\fRs initialized to 1, 2, 4, 8, 16, etc.
.IP \n+[step].
Define a function \fCf()\fR taking an \fCint\fR array argument and an \fCint\fR argument 
indicating the number of elements in the array.
.IP \n+[step].
In \fCf()\fR:
.RS
.IP a.
Define a local \fCint\fR array \fCla\fR of ten \fCint\fRs.
.IP b.
Copy the values from \fCga\fR into \fCla\fR.
.IP c.
Print out the elements of \fCla\fR.
.IP d.
Define a pointer \fCp\fR to \fCint\fR and initialize it with an 
array allocated on the free store with the same number of elements as the argument array.
.IP e.
Copy the elements from the argument array into the free-store array.
.IP f.
Print out the elements of the free-store array.
.IP g.
Deallocate the free store array.
.RE
.IP \n+[step].
In \fCmain()\fR:
.RS
.IP a.
Call \fCf()\fR with \fCga\fR as its argument.
.IP b.
Define an array \fCaa\fR with ten elements, and initialize it with 
the first ten factorial values (1, 2*1, 3*2*1, 4*3*2*1, etc.).
.IP c.
Call \fCf()\fR with \fCaa\fR as its argument.
.RE
.RE

.bp
.NH
Copying memory in vectors: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a global \fCvector int gv\fR of ten \fCint\fRs initialized to 1, 2, 4, 8, 16, etc.
.IP \n+[step].
Define a function \fCf()\fR taking an \fCvector<int>\fR argument.
.IP \n+[step].
In \fCf()\fR:
.RS
.IP a.
Define a local \fCvector<int> lv\fR with the same number of elements as the argument \fCvector\fR.
.IP b.
Copy the values from \fCgv\fR into \fClv\fR.
.IP c.
Print out the elements of \fClv\fR.
.IP d.
Define a local \fCvector<int> lv2\fR and initialize it to be a copy of the argument \fCvector\fR.
.IP e.
Print out the elements of \fClv2\fR.
.RE
.IP \n+[step].
In \fCmain()\fR:
.RS
.IP a.
Call \fCf()\fR with \fCgv\fR as its argument.
.IP b.
Define a \fCvector<int> vv\fR and initialize it with 
the first ten factorial values (1, 2*1, 3*2*1, 4*3*2*1, etc.).
.IP c.
Call \fCf()\fR with \fCvv\fR as its argument.
.RE
.RE

.bp
.so reflection.ms

