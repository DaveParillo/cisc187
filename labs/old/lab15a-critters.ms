.ds CH Lab #15a: Critters
.so headings.ms
.TL
\*[CH]

.SH
Critters Tournament: 100 points, 60 minutes \fImaximum\fR
.time_box
.QP
The goal of this lab is to use the skills developed during the
semester and engage in a bit of friendly competition.

You may enter the tournament individually, or as part of a team.

The idea is to have fun and show yourself how far you have progressed this semester.

.ce 1
\fBNOTE\fR

.br
.ce 1
This source code does not compile in Visual Studio.
.QP

You need to download and compile this project on a machine that
supports GNU \fCmake\fR or a similar build environment.
The shared library provided is compiled fo the Mesa server.

Your task is to write a class that extends the Critter base class
that can effectively move, fight, eat and mate in competition
against others.

.RS
.nr step 0 1
.IP \n+[step].
Copy and extract the critters source from the my public area on the mesa server.
On buffy:
.CW
  cp ~dparillo/public_html/cisc187/labs/critters.zip . 
.R
.IP \n+[step].
Unpack the archive:
.CW
  unzip critters.zip
  cd critters
.R

There are two main source files in critters: \*[c]main.cpp\*[r] and \*[c]Olympian.h\*[r].

All of the other include files are provided so that your code will compile and link while you develop and test your critter.
.IP \n+[step].
Modify the Olympian starter file.
This is your critter that will be doing batle with others.
Copy or modify this file.

You must change at least:
.RS
.IP a.
The file name and class name.
.IP b.
The default name in the default constructor.
.IP c.
The class name in the create() override.
.RE
.IP \n+[step].
Edit main.cpp and make two changes:
.RS
.IP a.
At the top of the file add an \*[c]#include\*[r] for your critter.
.IP b.
At the bottom of the file change 
.br
\*[c]s.addItem(make_shared<Olympian>(),  max_critters);\*[r]
.br
replacing the Olympian with your class name.
.RE
.IP \n+[step].
Verify you can compile.  
On the command line, type \*[c]make\*[r],
and you should see:
.CW
  rm -f critters
  c++ -I./include -I. -I.. -std=c++11 -Wall -Wextra -pedantic  *.cpp -L. libcritters.so -lncurses -lm -lc -o critters 
.R
then run the program:
.CW
  ./critters -h
.R

If when you run \fIcritters\fR, you see:
.CW
  ./critters: error while loading shared libraries: 
    libcritters.so: cannot open shared object file: 
    No such file or directory
.R

it is because the system can't find the file \fClibcriters.so\fR.
Fix this by sourcing the \fCset_library_path\fR file in the critters directory:
.CW
  source set_library_path
.R
This adds the current directory to the shared library search path.

Now you should see:
.CW
  ./critters -h

  Usage: ./critters [-hd] [-f #] [-s #] [-n #] [-x #] [-y #] [-LTBW]
  Options:
    -h   Show this text
    -d   Enable debug output.
         Output is written to std::cerr.  
         Redirect accordingly, for example:
           a.out 2> debug.txt
    -f   Set the amount of Food on the board.  Default = 250.
    -s   Set the number of Stones on the board.  Default = 10.
    -n   Set the number of Critters for each Species.  
         Default = 25.
    -x   Set the world width.  
         Default = window width.
    -y   Set the world height.  
         Default = window height minus score height.

    -L   Add Lion to the simulation
    -T   Add Tiger to the simulation
    -B   Add Bear to the simulation
    -W   Add Wombat to the simulation
.R


At this point, your critter is essentially named 'Lunch', 
if you have not implemented any critter interface functions.

Review the documentation here: 
.RS
http://buffy/~dparillo/cisc187/labs/critters-docs/
.RE
to get a sense of what a critter can do.

Good luck!
.bp
.SH
Game Plan
.QP
This section describes one possible strategy for getting up and running quickly.

.RS
.nr step 0 1
.IP \n+[step].
Copy instead of replacing \*[c]Olympian.h\*[r].
.IP \n+[step].
Follow the instructions from the previous section to get your new player compiling.
.IP \n+[step].
Verify both your player and the Olympian run within the critters environment.

Don't watch it for long - if neither of you do anything, it's going to be a long night!

.IP \n+[step].
Start with implementing the \*[c]move\*[r] function.

You do not have to use the neighbors map, 
but if you don't,
you will end up walking into lots of Stones,
and may miss a lot of combat opportunities.

Start with simple movement and add more after you have tested your critter.

.IP \n+[step].
Test using you vs the Olympian.

Add at least one attack in your fight function so you can defeat the Olympian.

Since it never moves and never fights back, the challenge is to find them all
in a reasonable amount of time.
.IP \n+[step].
Start adding more complex logic, if you want to.

Remember to read the documentation, 
or look at the source code in
.br
\fCinclude/solution\fR,
which will tell you how the default critters behave.

.IP \n+[step].
Once you can defeat Olympians with no trouble, start adding in other default players.

I would test against them in this order:
.RS
.IP Lion 
.br
 \fC./critters -L\fR
.IP Tiger 
.br
 \fC./critters -T\fR
.IP Bear 
.br
 \fC./critters -B\fR
.IP Wombat
.br
 \fC./critters -W\fR
.RE

A critter order which is generally in increasing difficulty.
.RE

You may also find it helpful to make the game world smaller during earlier testing.

Don't forget to test with different amounts of Stones, Food, and Critters.
Some brackets may be very crowded, or have no food at all.



