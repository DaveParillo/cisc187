.ds CH Lab #15b: Serialization
.so headings.ms
.TL
\*[CH]
.NH
Serialization : 4 points,  90 minutes \fImaximum\fR
.LP
In this lab, the goal is to perform some very simple serialization using boost::serialization.

.RS
.nr step 0 1
.IP \n+[step].
Download the lab14b-files as a starting point.
These are the classes from the Pointer zoo lab.
.IP \n+[step].
Pick 1 or 2 classes from the zoo that you like, 
modify it, if you prefer.

You may find adding a setter for pet name is a convenience.
.IP \n+[step].
Add command line argument handling so that you can invoke your program in two different 'modes'
.RS
 1. write mode: serialize your animal or pet
 2. read mode: deserialize your animal or pet
.RE

Consider using getopt for command line argument processing.

.IP \n+[step].
Run your program and write out a serialized object.
.IP \n+[step].
Run your program a second time and read in the serialized object written in the previous step.

