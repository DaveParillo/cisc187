.ds CH Lab #1a: Exploring GNU/Linux 
.so headings.ms
.TL
\*[CH]
.SH
\fBBackground\fR

Early in its evolution, the command-line environment of UNIX (its only user interface back then) 
became dominated by dozens of small text-processing tools. 
These tools were small and generally did one thing well. 
The tools were chained together in longer command pipelines, one program passing its 
output to the next as input, and controlled by a variety of command-line options and arguments.
This is one aspect of UNIX that makes it a supremely powerful environment for processing 
text-based data, one of its first uses in a corporate environment. 
Dump some text in one end of a command pipeline and retrieve processed output from the other end.
As programmers, this is useful, because at its core, programming involves manipulating text:
often transforming text from one thing into another.
.NH
Exploring the Linux server:  30 minutes \fImaximum\fR
.LP
Ensure you have your user name and default password for buffy.
.RS
.nr step 0 1
.IP \n+[step].
Open \fCputty\fR on a lab workstation and ssh to buffy.
.IP \n+[step].
Provide your own login information (user name and password)
.IP \n+[step].
You are now in your own \fIhome directory\fR
.br
Take a few moments to explore the following commands:
.RS
.IP a.
 \fCls\fR - list files and directories
.IP b.
 \fCmkdir\fR - make a directory
.IP c.
 \fCcd\fR - change directory
.IP d.
 \fCman\fR - open manual pages
.IP a.
 \fCcp\fR - copy files or directories
.IP f.
 \fCmv\fR - move files or directories
.IP g.
 \fCrm\fR - remove files or directories
.RE
.RE
.bp
.NH
Moving files onto the Linux server:  30 minutes \fImaximum\fR
.LP
If you don't have it already, get the source code for lab.
.RS
.nr step 0 1
.IP \n+[step].
Go to Blackboard and use the download link provided to get the course material.
.IP \n+[step].
From a workstation, open the program \fBWinSCP\fR
containing the lab source bundle from git hub: probably \fIDownloads\fR.
.IP \n+[step].
In \fBWinSCP\fR, login to buffy using the same credentials as you used with ssh.
.IP \n+[step].
Copy the file master.zip from your local workstation to your home directory on buffy. 
.IP \n+[step].
Close WinSCP and login to buffy. Type:
.CW
    unzip master.zip
    cd cisc187-master/labs
    ls
.R
.br
Observe the contents of the directory, then type
.CW
    make format=ascii
.R
.br
Type \fCls\fR again.  What changed?

.IP \n+[step].
Type
.CW
    less lab1a-linux-intro.ms.ascii
.R
What do you see?

In your own words, provide an explanation for what is happening.

.IP \n+[step].
Use the \fCpasswd\fR prgram to change your login password from the default.
Pick something you can remember - 
if you forget it I can't help you and it may take a few days to reset it.

.IP \n+[step].
Write a simple 'hello world' program and save it to 'hello.cpp'.  
If you have never edited a file on *nix before, use nano.  Start it using the file name you want to create:
.CW 
 nano hello.cpp
.R
.br
Or you can use notepad++ on your windows workstation and use WinSCP to copy it to buffy.
.IP \n+[step].
Compile it on buffy using the commnd
.CW
    make hello
.R
What is the result?

Does your program compile and run? Fix it until it does.
.RE
.NH
Vim tutorial: 30 minutes \fImaximum\fR
.LP
Either \fIvi\fR or \fIvim\fR is installed on essentially every *nix computer by default.
If you plan to program in C++, 
you should have at least a minimal familiarity with \fIvi\fR.
\fCvi\fR is a very old, but very capable text editor with many features
specifically designed for writing software.
It has thousands of features.
No one knows them all, that is not the point.
It is a very efficient editor that has intuitive commands.
Most commands 'reward' you, if you know how to touch type.
.RS
.nr step 0 1
.IP \n+[step].
Login to buffy using putty
.IP \n+[step].
In the terminal, type \fCvimtutor\fR
.IP \n+[step].
Complete the entire tutorial, or until you get to 30 minutes of activity.

If you don't complete the tutorial in lab, 
then I highly recommend you complete it outside of class.
.RE
.bp
.NH
Extra credit
.LP
Parsing the command line:  30 minutes \fImaximum\fR

All *nix programs, even those with graphical user interfaces (GUIs), accept and process command-line options. 
For some programs, this is the primary means of interacting with either other programs, or users. 
Having robust handling of complex command-line arguments makes your application better and more useful. 
You can 'roll your own' command line argument processing, or use a library.
Library functions such as \fCgetopt\fR or \fCboost::program_options\fR,
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

Upload to blackboard or use the \fCturnitin\fR script when complete.

