
.TL
.gcolor blue
Introduction to 

Data Structures and Classes 
.gcolor
.LP
.ce 1
Week 3
.SS Overview
.IT Data Structures
.IT Software Reuse
.IT Implementing Data Structures

.SS Data Structures
.IT It's not enough to have data
.IT It must be organized to be useful
.IT A data structure is 
.i1s
A meaningful representation of data 
.br
 and
.i1e
.i1 The operations associated with the data
.IT Together, the data and operations form an \fIabstract data type\fR
.IT When you write a class
.i1 Your are creating a new Abstract Data Type (ADT)
.i1 Sometimes called a \fIuser defined type\fR
.SS Reuse and Abstraction
.IT The most useful software is written once and re-used in many applications
.IT How to increase reuse?
.IT \fBAbstraction\fR
.i1 Hide the details of data structures from users [Meyers #20]
.i2 Avoid data members in the public interface
.IT In all programming, this is the one simple idea
.i1 That is one of the hardest to master


.IT
But this is the
.BI entire\0point
behind object oriented programming!
.IT So it's important to get right
.SS Implementing ADT's
.IT Define the data type
.i1 Types and public operations
.IT The public operations define what users of the ADT must know to use it effectively
.IT ADT operations specify an interface
.i1 Between users of the ADT and the actual implementation
.IT Advantages
.i1 Abstraction
.i1 No users need to know how the ADT is implemented
.i2 Multiple implementations of the same ADT interface are possible
.i2 Example: \*[c]vector\*[r] and \*[c]list\*[r]
.i3 There is no way to know how either is implemented
.i3 Other than reading the source code

.SS Questions

What are the issues with the original \*[c]Date struct\*[r] presented in the chapter?
.CW

  struct Date
  {
    int y;    // year
    int m;    // month
    int d;    // day
  }
.R

.bp

What are the invariants of the \*[c]Date class\*[r] in the chapter?
.bp


When should functions be put in the class definition?



When should they be defined outside of the class?  


Why?
.bp



When is it acceptable to use a \*[c]struct\*[r]?  


When is it not acceptable?





.SS Summary
.IT Data must be organized to be useful
.IT Data + operations = ADT (abstract data type)
.IT Why Bother?
.i1s
.B Abstraction
.i1e
.IT General principles
.i1 Keep data private
.i1 Keep class interfaces simple & minimal

