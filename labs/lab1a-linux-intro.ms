.ds CH Lab #1a
.TL
Lab #1a: Exploring GNU/Linux and compiling simple programs
.so cover-page.ms

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


.bp
.NH
Exploring the Linux server:  20 minutes \fImaximum\fR
.time_box
Manager: Ensure everyone on the team has their user name and default password for buffy.

.nr step 1 1
.IP \n[step].
Each person on the team should open \fCputty\fR on a lab workstation and ssh to buffy.
.IP \n+[step].
Provide your own login information (user name and password)
.IP \n+[step].
Have each person on the team, in their own ssh session type
.CW
    ls
.R

Then type
.CW
    ls -la
.R
.QP
What does this program do?




How is the output for each person the same?  Different?







.IP \n+[step].
Have 1 team member type \fCman ls\fR in a terminal
.QP
Take a moment to review the output.
You can press \fCd\fR or \fCf\fR to page forward, \fCd\fR or \fCu\fR to go back.
You can press the spacebar to page forward.

How does the description of the 'ls' command match your expectations?






.LP
.IP \n+[step].
There are many, many commands available in linux.  Most of them are in the directory /usr/bin - list that directory to see what's available.

You already know 2 commands: what are they?




.IP \n+[step].
What command would you type to gain an understanding of how to use the unix manuals?



.IP \n+[step].
What command would you type to perform a keyword search of the installed manuals?
.bp
.NH
Moving files onto the Linux server:  20 minutes \fImaximum\fR
.time_box

.ce 1
\fBNOTE\fR

.B1
.QP
If you don't have it already, get the source code for lab.

.B2
.LP
On buffy, the command:
.CW
    curl https://codeload.github.com/DaveParillo/cisc187/zip/master > master.zip
.R
will do the trick.
.nr step 1 1
.IP \n[step].
On a workstation, open a command window in the folder containing the lab source bundle from git hub.
Type 
.CW
    scp master.zip #your login name#@buffy:master.zip
.R
Replace #your login name# with your actual login name.


.IP \n+[step].
Close the scp window and login to buffy. Type
.CW
    unzip master.zip
    cd cisc187-master/labs
    ls
.R

Observe the contents of the directory, then type
.CW
    make format=ascii
.R

What happened?




.IP \n+[step].
Type
.CW
    less lab1.ms.ascii
.R
What do you see?

In your own words, provide an explanation for what is happening.






.IP \n+[step].
Use the \fCpasswd\fR prgram to change your login password from the default.
Pick something you can remember - if you forget it I can't help you and it may take a few days to reset it.




.IP \n+[step].
Write a simple 'hello world' program and save it to 'hello.cpp'

.IP \n+[step].
Compile it using the commnd
.CW
    make hello
.R
What is the output?


Does your program compile and run?





.IP \n+[step].
Type \fR rm hello\fR and then compile it using the commnd
.CW
    c++ hello.cpp
.R
What is the output?




Does your program compile and run?





.IP \n+[step].
Briefly explain how \fImake\fR is different from \fIc++\fR or \fIg++\fR.








.IP \n+[step].
Use the program \fIzip\fR to make an archive of all of the files in the labs directory you just extracted.  Refer to the man page if you need help.  Use \fIscp\fR to copy this file back to your windows workstation.




When you are done, show your results to the instructor.


.bp
.NH
Using getopt:  30 minutes \fImaximum\fR
.time_box
All *nix programs, even those with graphical user interfaces (GUIs), accept and process command-line options. 
For some programs, this is the primary means of interacting with either other programs, or users. 
Having robust handling of complex command-line arguments makes your application better and more useful. 
And yet, many developers are spending their precious time writing their own command-line parsers 
instead of using getopt(), a library function designed specifically to ease the burden of 
command-line processing. 

.nr step 1 1
.IP \n[step].
Modify your hello world program from earlier to take command line arguments that will modify
its behavior.
.IP \n+[step].
Add an argument 'r' to control how many times the hello message is repeated.
.IP \n+[step].
Add an argument 'n' to change the name displayed in the hello world message.
.IP \n+[step].
Add an argument 'h' to display help on using your program
.LP

Ensure this program compiles with no errors or warnings.

Show it to your instructor when complete.

.bp
.so reflection.ms


