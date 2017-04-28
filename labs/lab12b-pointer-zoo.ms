.ds CH Lab #12b: Pointer Zoo
.so headings.ms
.TL
\*[CH]
.NH
Pointer Zoo: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to increase familiarity with 
using pointers and the class concepts form the last two weeks: 
virtual functions, overloads, etc.
.RS
.nr step 1 1
.IP \n[step].
Download the supporting files for this lab from buffy.  There is a link in Blackboard.
.IP \n+[step].
The code in the file \fCmain.cpp\fR is incomplete.
Complete the program using the prompts in the comments provided.
.IP \n+[step].
When finished, submit the completed source code using the turnitin script,
or zip the source directory and upload to Blackboard.
.RE
.SH
Summary Question
.QP
Which of the variables / objects in your \fCmain.cpp\fR are on the stack?  

Which are on the heap?
.SH
Example output
.LP
.CW
  Address in play_with     : 0x7f8772c04cc0
  Address in play_with_pets: 0x7f8772c04cc0
  Fido wants to fetch!!
  Address in play_with     : 0x7f8772c04d00
  Address in play_with_pets: 0x7f8772c04d00
  Jaws wants to swim ...
  Address in play_with     : 0x7f8772c04d40
  Address in play_with_pets: 0x7f8772c04d40
  Robie wants to beep!
  Address in play_with     : 0x7f8772c04d90
  Address in play_with_pets: 0x7f8772c04d90
  beep!
  beep!
  beep!
  beep!
  beep!
  Charge: 94
  Giving a shot to Fluffy who says meow.
  Address in give_shot    : 0x7f8772c04d98
  Address in treat_anmials: 0x7f8772c04d98
  Giving a shot to Fido who says arf, arf!
  Address in give_shot    : 0x7f8772c04cd8
  Address in treat_anmials: 0x7f8772c04cd8
  Giving a shot to Jaws who says bubble . . .
  Address in give_shot    : 0x7f8772c04d18
  Address in treat_anmials: 0x7f8772c04d18
  Giving a shot to White Fang who says Woo woo woooooooo!
  Address in give_shot    : 0x7f8772c04dc0
  Address in treat_anmials: 0x7f8772c04dc0
.R
.bp
.so reflection2.ms

