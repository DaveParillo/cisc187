.ds CH Lab #3a
.TL
Lab #3a: ADT's and classes
.so cover-page.ms

.bp
.NH
Shape classes: 60 minutes \fImaximum\fR
.time_box
.QP
The goal is to have each team member work on a different part of this lab and 
then bring them together to get them working as a single program at the end.
.SH
Manager
.QP
Design and implement a \*[c]Circle\*[r] class.  
It should store two values: \*[c]label\*[r] and \*[c]radius\*[r], 
where \*[c]label\*[r] is a \*[c]string\*[r] 
and \*[c]radius\*[r] is a \*[c]double\*[r].

Ensure all class data is private and implement the following in the class:
.RS
.nr step 1 1
.IP \n[step].
Provide a default radius of 9 when a circle is created.
.IP \n+[step].
Provide a one parameter constructor that takes the circle diameter.
.IP \n+[step].
Provide functions to return the radius and label.
.IP \n+[step].
Provide methods to change the label, radius and calculate the area and circumfrence.
.RE
.SH
Reflector
.QP
Design and implement a \*[c]Rectangle\*[r] class.  
It should store three values: \*[c]label\*[r], \*[c]height\*[r], and \*[c]width\*[r], 
where \*[c]label\*[r] is a \*[c]string\*[r] 
and \*[c]height\*[r] and \*[c]width\*[r] are \*[c]double\*[r].

Ensure all class data is private and implement the following in the class:
.RS
.nr step 1 1
.IP \n[step].
Provide default dimensions of 4 when a rectangle is created.
.IP \n+[step].
Provide a two parameter constructor that takes the rectable height and width.
.IP \n+[step].
Provide functions to return the height, width, and label.
.IP \n+[step].
Provide methods to change the label and dimensions. 
.IP \n+[step].
Provide functions to calculate the area and perimeter.
.RE
.SH
Speaker
.QP
Create a test program for the two classes.

Implement a main that creates two \*[c]vector\*[r]s, a \*[c]vector<Circle>\*[r]
and a \*[c]vector<Rectangle>\*[r].  Put at least 3 instances in each.
Initialize them with data and display the label and area for each.
For the circles, display the radius and circumference.
For the rectangles, display the height and width and perimeter.

The only lines in \*[c]main()\*[r] should be 1 or two lines calling your test functions.
.SH 
Summary questions for everyone
.RS
.nr step 1 1
.IP \n[step].
How are your shape classes similar?  




.IP \n+[step].
Using tools covered so far, what could be done to reduce the duplication? 
Why can't we have just 1 test vector?
.RE

.bp
.so reflection.ms


