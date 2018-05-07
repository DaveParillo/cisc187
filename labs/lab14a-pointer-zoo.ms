.ds CH Lab #14a: Pointer Zoo
.so headings.ms
.TL
\*[CH]
.NH
Pointer Zoo: 100 points, 60 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to increase familiarity with 
using pointers and the class concepts from the last two weeks: 
virtual functions, overloads, etc.

The key idea is that the \*[c]Animal\*[r], \*[c]Pet\*[r], 
and \*[c]Robot\*[r] classes represent \fIinterfaces\fR.
The \*[c]Pet\*[r] class, for example, defines an interface (a contract)
which guarantees that all implementing classes must honor.

When the \*[c]Pet\*[r] interface is passed to a function,
The function only knows about the \*[c]Pet\*[r] part of the object.
It doesn't know if the \*[c]Pet\*[r] is a 
\*[c]Cat\*[r], \*[c]Fish\*[r], or \*[c]RoboDog\*[r].

.RS
.nr step 0 1
.IP \n+[step].
Download the supporting files for this lab from buffy.
The files are in
.CW
  ~dparillo/public_html/cisc187/labs/lab14a-files/
.R
.br
Copy the files into a new directory and cd into the directory you created.

You should be able to type \fCmake\fR.
The provided makefile should produce an executable named \fCzoo\fR.
.IP \n+[step].
Implement a function \fCvector<Pet*> make_pets()\fR that creates a vector,
adds a \*[c]Cat\*[r], \*[c]Dog\*[r], 
\*[c]Fish\*[r], and a \*[c]RoboDog\*[r] to the vector and returns it.
.IP \n+[step].
Implement a function
.br
\fCvoid play_with_pets(const vector<Pet*>&, const uint16_t n)\fR that 
contains a loop that plays with each pet \fBn times\fR.
.IP \n+[step].
Implement a function \fCvector<unique_ptr<Animal>> make_animals()\fR 
.br
that creates a vector, 
adds a \*[c]Cat\*[r], \*[c]Dog\*[r], 
\*[c]Owl\*[r], and a \*[c]Wolf\*[r] to the vector and returns it.
.IP \n+[step].
Implement a function 
.br
\fCvoid treat_animals(const vector<unique_ptr<Animal>>&)\fR that 
gives each \*[c]Animal\*[r] a 'shot'.

To give an \*[c]Animal\*[r] a shot,
just stream \*[c]make_sound()\*[r] to \fCstdout\fR.

.IP \n+[step].
The code in the file \fCmain.cpp\fR is incomplete.
Complete the program using the prompts in the comments provided.

Ensure that when complete, no memory has leaked.
.RE

Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab14a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab14a
.R

