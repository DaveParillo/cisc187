.ds CH Lab #12a: Pointers and Data Structures
.so headings.ms
.TL
\*[CH]
.NH
Gods linked list : 100 points, 90 minutes \fImaximum\fR
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
Create an operator<< for \fCGod\fR so that \fCprint_all()\fR lists gods with attributes all on one line. 

.IP \n+[step].
Add a member function \fCadd_ordered()\fR that places its new element 
in its correct lexicographic (alphabetically sorted) position. 

.IP \n+[step].
Make a list of gods from three mythologies. 

.IP \n+[step].
Move the elements (gods) from that list to the three alphabetically ordered lists, 
one for each mythology.

You may find this easier to implement if you add a \fCremove(Link* node, const string& name)\fR
helper function.  The erase provided in the text is not suitable for
removing gods a list so that they can be inserted in another.
The \fCerase\fR function returns a pointer to the next list element, not the element removed.

.RE


