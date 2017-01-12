.ds CH Lab #13a: Copying and moving memory
.so headings.ms
.TL
\*[CH]
.LP
This lab contains two sections: one to exercise array and one to exercise vectors 
in roughly the same manner. Do both and compare the effort involved in each.

.NH
Copying memory in arrays: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a global array \*[c]int ga\*[r] of ten \*[c]int\*[r]s initialized to 1, 2, 4, 8, 16, etc.
.IP \n+[step].
Define a function \*[c]f()\*[r] taking an \*[c]int\*[r] array argument and an \*[c]int\*[r] argument 
indicating the number of elements in the array.
.IP \n+[step].
In \*[c]f()\*[r]:
.RS
.IP a.
Define a local \*[c]int\*[r] array \*[c]la\*[r] of ten \*[c]int\*[r]s.
.IP b.
Copy the values from \*[c]ga\*[r] into \*[c]la\*[r].
.IP c.
Print out the elements of \*[c]la\*[r].
.IP d.
Define a pointer \*[c]p\*[r] to \*[c]int\*[r] and initialize it with an 
array allocated on the free store with the same number of elements as the argument array.
.IP e.
Copy the elements from the argument array into the free-store array.
.IP f.
Print out the elements of the free-store array.
.IP g.
Deallocate the free store array.
.RE
.IP \n+[step].
In \*[c]main()\*[r]:
.RS
.IP a.
Call \*[c]f()\*[r] with \*[c]ga\*[r] as its argument.
.IP b.
Define an array \*[c]aa\*[r] with ten elements, and initialize it with 
the first ten factorial values (1, 2*1, 3*2*1, 4*3*2*1, etc.).
.IP c.
Call \*[c]f()\*[r] with \*[c]aa\*[r] as its argument.
.RE
.RE

.bp
.NH
Copying memory in vectors: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Define a global \*[c]vector int gv\*[r] of ten \*[c]int\*[r]s initialized to 1, 2, 4, 8, 16, etc.
.IP \n+[step].
Define a function \*[c]f()\*[r] taking an \*[c]vector<int>\*[r] argument.
.IP \n+[step].
In \*[c]f()\*[r]:
.RS
.IP a.
Define a local \*[c]vector<int> lv\*[r] with the same number of elements as the argument \*[c]vector\*[r].
.IP b.
Copy the values from \*[c]gv\*[r] into \*[c]lv\*[r].
.IP c.
Print out the elements of \*[c]lv\*[r].
.IP d.
Define a local \*[c]vector<int> lv2\*[r] and initialize it to be a copy of the argument \*[c]vector\*[r].
.IP e.
Print out the elements of \*[c]lv2\*[r].
.RE
.IP \n+[step].
In \*[c]main()\*[r]:
.RS
.IP a.
Call \*[c]f()\*[r] with \*[c]gv\*[r] as its argument.
.IP b.
Define a \*[c]vector<int> vv\*[r] and initialize it with 
the first ten factorial values (1, 2*1, 3*2*1, 4*3*2*1, etc.).
.IP c.
Call \*[c]f()\*[r] with \*[c]vv\*[r] as its argument.
.RE
.RE

