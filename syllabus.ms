.ds LH Data Structures in C++
.ds CH CISC-187
.ds RH CRN 40299
.ds CF %
.TL
Data Structures in C++
.AU
Dave Parillo
.AI
\fBE-Mail: \fP dparillo@sdccd.edu
\fBOffice Hours: \fP M & W 6:00 - 7:00 PM, K201B
\fBClass Meets: \fP M & W, 7:05 - 10:00 PM, K201B
\# source external file:     .so defines.s
.SH
Course Description
.LP
This course introduces students to data structures and object-oriented software engineering. 
Emphasis is placed on basic data structures, including collections and linked structures 
(stacks, queues, lists, arrays, trees, and hashes) from the perspective of 
object-oriented implementation. Topics also include object-oriented analysis, design, 
and implementation in C++.
This course is designed for students majoring in computer information systems and 
professionals in the field who want to update their skills.

.TS
center box tab (:);
cb|cb
l|l.
Transfer Credit:California State University System
_
Content Learning hours per week:3
_
Equivalent lab hours per week:3
_
Advisory:English 51 with a grade of C or better 
:or equivalent or assessment skill level W5
.TE
.SH
Prerequisites
.RS
.IP \[bu] 2
CISC 192 with a grade of "C" or better, or equivalent.
.RE
.SH
Required Text
.LP
The following textbook is /fBrequired/fR for this course. 
.RS
.nr step 1 1
.IP \n[step].
\fBStroustrup, Bjarne\fP. 
\fIProgramming: Principles and Practice Using C++\fP. 
Addison-Wesley Professional, 2\*[{]nd\*[}] edition,
June 2014. ISBN: 978-0321992789.
.RE
.LP
.ce 1
\fBNOTE\fR

.B1
.QP
.ce 1
Avoid the kindle or e-book editions.
.br
.ce 1
They are not cheaper and the example source code is impossible to read.

.B2
.LP
.SH
Required Supplies
.LP
Within the class & lab, no additional supplies are required.  
Students wishing to complete work outside of class will need access to a computer, 
a good text editor: \fINotepad++\fP, \fIVim\fP, \fIEmacs\fP, or equivalent, and a modern C++ tool-chain.
\fIClang\fP version 7 or greater or \fIg++\fP version 4.8.1 or greater are recommended,
but any ISO-compliant C++ compiler / IDE that supports C++11, such as MS Visual Studio 2015 is sufficient.
You may also find \fImake\fP helpful.

Completed projects must compile on the Mesa cislinux server, mesa-cislinux.sdmesa.sdccd.cc.ca.us (buffy).
To access this server off campus, you will need an ssh client.
.bp
.SH
Official Course Learning Outcomes
.RS
.nr step 1 1
.IP \n[step].
Apply appropriate design patterns to solve real-world software problems.
.IP \n+[step].
Use C++ templates to create extensible, flexible classes.
.IP \n+[step].
Apply the Standard Template Library to solve real-world software problems.
.IP \n+[step].
Use C++ to create an Abstract Data Type as a solution to a software problem.
.IP \n+[step].
Understand from a C++ perspective, the control of program flow with a looping structure.
.RE
.SH
Course Objectives
.LP
Upon successful completion of this course, you will have achieved the following 
Student Learning Outcomes (SLOs):
.RS
.IP \[bu] 2
Compare, contrast and apply the concepts of the main phases (disciplines) of 
software engineering best practices, including an iterative approach to 
project management to form the contextual foundation for syntax, logic, 
and semantics learning of data structures, classes, and objects.
.IP \[bu] 2
Identify and apply the language features in C++ to the development of 
reusable software components, using principles of 
abstraction, inheritance, encapsulation, and polymorphism.
.IP \[bu] 2
Identify and apply various data structures in C++ to the development of useful, 
robust, and reusable software components.
.IP \[bu] 2
Apply relevant Design Patterns to the best-practices implementation of 
data structure components through the correlation of their understanding and 
knowledge of object-orientation with the implementation of various data structures in C++.
.IP \[bu] 2
Demonstrate and practice the serialization of objects for persistent storage 
in files and databases to handle issues of file and database input-output, 
including opening and closing, connecting, and read and write operations.
.IP \[bu] 2
Identify and apply the various approaches pursued in C-family languages to 
manage memory, including their respective impacts on program performance and efficiency. 
.RE
.SH
Weekly Schedule 
.LP
Maintained in Blackboard, there is a Learning Module for each week of the semester.  
Each module contains the complete list of what is due for that week, 
including links to the resources needed to complete the tasks.
.B
Always use the Learning Modules for a complete list of everything due each week.
.R
.SH
Attendance Requirements
.LP
Consistent participation is critical to learning. 
Students who fail to participate will fall behind in acquiring course content 
and skills, resulting in reduced academic success.

Your attendance is based on your presence in class and in Blackboard activities. 
Permanent removal from the course for lack of attendance is at my discretion, 
following standard Community College District course attendance guidelines:  
failure to show up for class or failure to complete assignments, tests or quizzes. 

It is the student's responsibility to add, drop, or withdraw from classes 
before the deadlines stated in the class schedule. Petitions to add, drop, 
or withdraw after the deadline will not be approved without proof of circumstances 
beyond the student's control, which made him/her unable to meet the deadline. 
Lack of money to pay fees is not considered an extenuating circumstance. 
Students anticipating difficulty in paying fees before the add deadline should 
check with the Financial Aid Office about sources of funds or other 
alternatives for which they may be eligible.

If a student decides to withdraw or drop from this course, they must do so on 
or before the date specified by the Academic Calendar as to the last day to withdraw or drop. 
Failure to drop by the "last day to drop" date will result in a grade being assigned, 
regardless of attendance. 
Students are responsible for processing the WITHDRAWAL or DROP action.

In Summary:
.RS
.IP \[bu] 2
It is the student's responsibility to drop all classes in which he/she is no longer participating.
.IP \[bu] 2
It is the instructor's discretion to withdraw a student after the add/drop deadline due to excessive absences. 
.IP \[bu] 2
Students who remain enrolled in a class beyond the published withdrawal deadline, 
as stated in the class schedule, will receive an evaluative letter grade in this class. 
.RE
.SH
Policy Regarding Late or Incomplete Work
.LP
.B
Zero credit for late quizzes and tests!
.R
There is no process for "making up" quizzes.  
If you cannot take an exam on the scheduled date, see me to arrange a makeup date.  
No extra-credit activities will be given as a replacement for late work. 
All other work is penalized 1% per day. The number of days late is calculated 
as the difference between the assignment due date and the actual date submitted 
as recorded on the Blackboard server.  No exceptions.
.SH
Online Behavior and Student Code of Conduct
.LP
Students are expected to respect and obey standards of student conduct while in 
communication online and while on campus in person. No foul language or conduct 
that disrupts learning will be tolerated. Respectful communication with the 
instructor and fellow students using English language syntax and structure 
appropriate for an academic environment is expected. 
The Student Code of Conduct, Disciplinary Procedure, and Student Due Process 
(Policies 3100, 3100.1, and 3100.2) are documented in the College Catalog and at 
the Office of the Dean of Student Affairs (Room H-500). 
Charges of misconduct and disciplinary sanctions may be imposed upon students 
who violate these standards of conduct or provisions of college regulations.
.SH
Accommodation of Disability
.LP
I have made every effort to make this course accessible to all students, 
including students with disabilities. 
If you encounter a problem accessing anything in this course, 
please contact me immediately by email and also contact the college's 
Disability Support Programs and Services (DSPS) Office.

Students with disabilities who may need academic accommodations are encouraged to discuss 
their authorized accommodations from Disability Support Programs and Services (DSPS) 
with their professors early in the semester so that accommodations may be 
implemented as soon as possible.

I will work with the DSPS Office to ensure that proper accommodations are 
made for each student. By law, it is up to the DSPS Office what constitutes 
"appropriate accommodation" - it is not up to the student or the faculty.

Students that need evacuation assistance during campus emergencies should also 
meet with the instructor as soon as possible to assure the health and safety 
of all students.
.SH
Academic Integrity
.LP
Students are expected to be honest and ethical at all times in the pursuit of academic goals. 
Students found to be in violation of Administrative Procedure 3100.3 Honest Academic Conduct, 
will receive a grade of zero on the assignment, quiz, or exam in question and may be referred 
for disciplinary action in accordance with Administrative Procedure 3100.2, 
Student Disciplinary Procedures.  
There is an academic integrity quiz that is the first assignment in Blackboard.  
I will not grade any labs or projects until you complete this.

.B
Class Communication Caveat
.R
.LP
Do not post assignment answers or code in discussion forums or other online repositories.
.SH
Student Code of Conduct
.LP
Students are expected to adhere to the Student Code of Conduct at all times. 
Students who violate the Student Code of Conduct may be removed from class by the p
faculty for the class meeting in which the behavior occurred, and the next class meeting.

Incidents involving removal of a student from class will be reported to the college 
disciplinary officer for follow up.  
The Student Code of Conduct can be found in Board of Trustees Policy, 
BP 3100, Student Rights, Responsibilities, Campus Safety and 
Administrative Due Process posted on the District website at: 
http://www.sdccd.edu/public/district/policies/index.shtml
.SH
Evaluation
.LP
A student's grade will be based on multiple measures of performance and will 
reflect the objectives set forth for this course. 
A final grade of C or better indicates the student has the ability to 
successfully apply theory and techniques taught in this course, 
in subsequent courses, and in practice.
.so grading-criteria.tbl
.I
.ce 1
Note: Dates and weights of course items are subject to change
.R
.SH
Grading
.LP
.RS
.IP \fBA\fP
>= 90
.IP \fBB\fP
>= 80, < 90
.IP \fBC\fP
>= 70, < 80
.IP \fBD\fP
>= 60, < 70
.IP \fBF\fP
< 60
.RE
.SH
Instructional Approach
.LP
Active learning is encouraged and best accomplished through doing.  
Make the most effective use of in-class exercises and lab time.

All activities must be completed individually unless otherwise noted.

All submissions associated with any activity are to be typed and submitted electronically. 
Handwritten assignments or any other format than the one specified online will not be accepted.





