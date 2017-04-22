.ds CH Lab #12a: Pointers and Data Structures
.so headings.ms
.TL
\*[CH]
.NH
Gods linked list : 60 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to practice working with pointers to data structures on the heap.
It is based on exercise #13 from Chapter 17 of the textbook.

.RS
Start with the \fCLink\fR class from \*[sect]17.10.1.
You can find this source code in the examples section,
either on buffy or from GitHub.
.CW
  examples/week12/book/lists-9+10/
  chapter.17.10.1-this-pointer.cpp
.R

.nr step 0 1
.IP \n+[step].
Modify the \fCLink\fR class to hold a value of \*[c]struct\*[r] \fCGod\fR with
\*[c]string\*[r] members: \fCname\fR, \fCmythology\fR, \fCvehicle\fR, and \fCweapon\fR. 
For example:
.CW
  God {"Zeus", "Greek", "", "lightning"};
  God {"Odin", "Norse", "Horse: Sleipner", "Spear: Gungnir"};
.R

.IP \n+[step].
Create a \fCprint_all()\fR function that lists gods with attributes one per line. 

.IP \n+[step].
Add a member function \fCadd_ordered()\fR that places its new element 
in its correct lexicographic (alphabetically sorted) position. 

.IP \n+[step].
Make a list of gods from three mythologies. 

.IP \n+[step].
Move the elements (gods) from that list to the three alphabetically ordered lists, 
one for each mythology.

.RE


