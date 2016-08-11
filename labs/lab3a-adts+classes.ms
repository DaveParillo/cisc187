.ds CH Lab #3a
.TL
Lab #3a: ADT's and classes
.so cover-page.ms

.bp
.NH
Evolving the \fCDate\fB class: 60 minutes \fImaximum\fR
.time_box
.QP
Using the evolving sequence of the Date class from Chapter 9,
sections 9.1 - 9.4, answer the following:
.RS
.nr step 1 1
.IP \n[step].
What are the two parts of a class, as described in this chapter?





.IP \n+[step].
What is the difference between the interface and the implementation in a class?





.IP \n+[step].
What are the issues with the original \fCDate struct\fR presented in the chapter?






.IP \n+[step].
What is an invariant?  Give some examples.
What are the invariants of the \fCDate\fR class?





.IP \n+[step].
When should functions be put in the class definition and when should they be defined
outside of the class?  Why?





.IP \n+[step].
When is it acceptable to use a \fCstruct\fR?  When is it not acceptable?


.RE
.bp
.NH
Shape classes: 60 minutes \fImaximum\fR
.time_box
.QP
Design and implement a \fCCircle\fR class.  
It should store two values: \fClabel\fR and \fCradius\fR, 
where \fClabel\fR is a \fCstring\fR 
and \fCradius\fR is a \fCdouble\fR.

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

Design and implement a \fCRectangle\fR class.  
It should store three values: \fClabel\fR, \fCheight\fR, and \fCwidth\fR, 
where \fClabel\fR is a \fCstring\fR 
and \fCheight\fR and \fCwidth\fR are \fCdouble\fR.

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


How are these classes similar?  






Using tools covered so far, what could be done to reduce the duplication?


.bp
.so reflection.ms


