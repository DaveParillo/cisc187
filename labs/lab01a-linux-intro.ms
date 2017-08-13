.ds CH Lab #1a: Exploring GNU/Linux 
.so headings.ms
.TL
\*[CH]
.SH
\fBBackground\fR

Early in its evolution, the command-line environment of UNIX (its only user interface back then) 
became dominated by dozens of small text-processing tools and are still in common use today.
These tools are small and generally do one thing well. 
Most read from 'standard input' and write to 'standard output'.
The tools are commonly chained together in longer command pipelines, 
one program passing its output to the next as input, 
and controlled by a variety of command-line options and arguments.

This is one aspect of UNIX that makes it a powerful environment for processing 
text-based data, one of its first uses in a corporate environment. 
Dump some text in one end of a command pipeline and retrieve processed output from the other end.
As programmers, this is useful, because at its core, programming involves manipulating text:
transforming source code into executable machine code, 
converting database query results into readable reports, etc.
.NH
Exploring the Linux server: 20 pts, 30 minutes \fImaximum\fR
.LP
Ensure you have your user name and default password for buffy.
.RS
.nr step 0 1
.IP \n+[step].
Open \*[c]git bash\*[r] or \*[c]putty\*[r] on a lab workstation and ssh to buffy.
.IP \n+[step].
Provide your own login information (user name and password)
.IP \n+[step].
You are now in your own \fIhome directory\fR
.br
Take a few moments to explore the following commands:
.RS
.IP a.
 \*[c]ls\*[r] - list files and directories
.IP b.
 \*[c]mkdir\*[r] - make a directory
.IP c.
 \*[c]cd\*[r] - change directory
.IP d.
 \*[c]man\*[r] - open manual pages
.IP a.
 \*[c]cp\*[r] - copy files or directories
.IP f.
 \*[c]mv\*[r] - move files or directories
.IP g.
 \*[c]rm\*[r] - remove files or directories
.IP h.
 \*[c]passwd\*[r] - change your login password
.RE
.IP \n+[step].
Use the \*[c]passwd\*[r] program to change your login password from the default.

Pick something you can remember!!

If you forget it I can't help you and it may take a few days to reset it.
.RE
.bp
.NH
Vim tutorial: 50 pts, 30 minutes \fImaximum\fR
.LP
Either \*[c]vi\*[r] or \*[c]vim\*[r] is installed on essentially every *nix computer by default.
If you plan to program in C++, 
you should have at least a minimal familiarity with \fIvi\fR.
\*[c]vi\*[r] is a very old, but very capable text editor with many features
specifically designed for writing software.
It has thousands of features.
No one knows them all, that is not the point.
It is a very efficient editor that has intuitive commands.
Most commands 'reward' you, if you know how to touch type.
.RS
.nr step 0 1
.IP \n+[step].
Login to buffy.
.IP \n+[step].
In the terminal, type \*[c]vimtutor\*[r].
.IP \n+[step].
Complete the entire tutorial, or until you get to 30 minutes of activity.

If you don't complete the tutorial in lab, 
then I highly recommend you complete it outside of class.
.RE
.NH
Hello world: 30 points, 15 minutes \fImaximum\fR
.LP
Using \*[c]vim\*[r] create a simple hello world and get it to run.
.RS
.nr step 0 1
.IP \n+[step].
If not already, open a shell and login to buffy.
.IP \n+[step].
Use \*[c]mkdir\*[r] to make a new directory to hold your work (lab1a is recommended).
.IP \n+[step].
Create a new file \*[c]hello.cpp\*[r] and create a simple working C++ program.
.IP \n+[step].
Compile the program using the command 
.br
\fC   make hello\fR
.IP \n+[step].
Turn in your completed lab using the \*[c]turnitin\*[r] script:
.RS
These steps are written assuming the directory name you created is '\*[c]lab1a\*[r]'.
.IP a.
Go up to the previous directory:
.br
\fC   cd ..\fR
.IP b.
Run turnitin: 
.br
\fC   turnitin lab1a\fR
.br
.br
When prompted, answer \*[c]Y\*[r] or \*[c]Yes\*[r] to the question.
.br
You should see something like this:
.CW
    turnitin lab1a
    About to turn in the files in lab1a
    Is this correct? [Y/n]:  y

      adding: lab1a/ (stored 0%)
      adding: lab1a/hello.cpp (deflated 29%)
    Your assignment was handed in as:    
       /var2/home/turnitin.d/dparillo_1501959813.zip
    A copy is also in this directory as: 
       dparillo_1501959813.zip
    now go and have some fun.
.R
.RE
.RE

.bp
.NH
Extra credit
.LP
Parsing the command line:  about an hour

All *nix programs, even those with graphical user interfaces (GUIs), accept and process command-line options. 
For some programs, this is the primary means of interacting with either other programs, or users. 
Having robust handling of complex command-line arguments makes your application better and more useful. 
You can 'roll your own' command line argument processing, or use a library.
Library functions such as \*[c]getopt\*[r] or \*[c]boost::program_options\*[r],
are designed specifically to ease the burden of command-line processing. 
.RS
.nr step 0 1
.IP \n+[step].
Modify your hello world program from earlier to take command line arguments that will modify
its behavior.
.IP \n+[step].
Add an argument 'r' to control how many times the hello message is repeated.
.IP \n+[step].
Add an argument 'n' to change the name displayed in the hello world message.
.IP \n+[step].
Add an argument 'h' to display help on using your program
.RE

You may use any command line argumernt processing technique that seems natural.
.LP

Ensure this program compiles with no errors or warnings.

Use the \*[c]turnitin\*[r] script when complete.

