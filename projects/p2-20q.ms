.ds LH Twenty Questions
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
\*[LH]
.LP
The goal of this project is to create a game called \*[c]twenty questions\*[r]
that you play against the computer.

The object of the game is for the computer to guess what object you are thinking of.

.h1 Basic Gameplay
.LP
In the game 20 questions the player begins by thinking of an object. 
The computers goal is to successfully guess what that object is. 
The computer will ask the player a set of 20 questions (or less), 
attempting to narrow down the list of possible results 
until it finally thinks it knows the answer. 
It will then present the result to the player. 
If the computer successfully guesses the object it wins, otherwise it loses. 

To get a feel for the spirit of the game we will implement, 
you can play an online version of the 20 questions game 
here: http://www.20q.net/.
Of course our game will be simpler in that the user will be restricted to only 
yes or no questions and answers.

The 'knowledge' the computer stores about the world can be represented as a binary tree, 
as in the figure below. 
Each non-leaf node stores a question that helps the computer narrow down 
the space of possible answers,
while each leaf node stores the computer's guess.

.PSPIC -R 20q-tree.eps

The game can be run either by loading an existing 20 questions tree from a text file 
or by starting with a default tree (described below). 

.h2 Outline of play
.LP
Your program should be able to play at least 1 round of 20 questions.
.RS
.nr step 0 1
.IP \n+[step].
If playing for the first time, the computer should ask:

.RS
  \fCIs it bigger than a breadbox?\fR
.RE

.IP \n+[step].
If the user answers \m[green]No\m[] play continues to the left side.

If the user answers \m[green]Yes\m[] play continues to the right side.
.IP \n+[step].
Continue asking questions until the computer reaches a leaf node.
.IP \n+[step].
Display the leaf node value and ask the user if this guess is correct.
.RS
.IP a.
If the user answers \m[green]Yes\m[] the computer won.
Ask the user if they want to play again.
.IP b.
If the user answers \m[green]No\m[] then ask the user:
.RS
.IP i.
What they were thinking of.
.IP ii.
A question that differentiates their object from the object just guessed by the computer.
.IP iii.
Whether the answer to the new question is \m[green]Yes\m[] or \m[green]No\m[].
.RE
.IP c.
Use the new information to update the in memory tree.
.RE
.IP \n+[step].
Before exiting, ask the user if they want to save the game.

If yes, the program should store the data in the binary tree in a file.

This file can be a plain text file.
.RE

.h1 Project Requirements
.LP
In order to receive full credit, your project must satisfy \fBall\fR
of the following requirements:
.RS
.nr step 0 1
.IP \n+[step].
Process command line arguments: 
.RS
 \*[c]-h\*[r] to display \*[c]h\*[r]elp text and exit.
 \*[c]-f\*[r] to load a game tree from \*[c]f\*[r]file
.RE
.IP \n+[step].
Gameplay proceeds as in the \m[blue]Outline of play\m[].
.IP \n+[step].
While the program executes, it should be clear what input is expected from the player.
.IP \n+[step].
You should assume I will provide a game file too large to fit in stack memory.

If your game can't load my game file because of a 'stack overflow' error,
then you can't get full credit for this project.
.IP \n+[step].
No memory leaks.
.IP \n+[step].
Program functions should be small and each function should perform
exactly one task.
.IP \n+[step].
Project rubric requirements for correctness, clarity, design, and coding are met or exceeded.
.RE

.bp
.h1 Turn in checklist
.LP
All projects will be graded according to the project rubric in BlackBoard.

Before uploading your project, make sure it meets all of the rubric criteria in order to get full credit.
.RS
.nr step 0 1
.IP \n+[step].
Ensure the top of each source file includes your name and student ID.
.IP \n+[step].
Source code contains no global variables.
.IP \n+[step].
Ensure the intent behind every program element is "crystal clear".
Add documentation where it makes sense to do so.
.IP \n+[step].
Ensure all project requirements are met and all results are correct.
.IP \n+[step].
Ensure your program handles error conditions.
.IP \n+[step].
Your finished project should be able to build on buffy.
.IP \n+[step].
Use the \fCturnitin\fR script to submit your project.

Turn in only source code and your saved game tree.
Do not turn in executables, etc.
.RE
.h2 Details and hints about playing
.LP
As you play one round, 
your program walks down the tree, 
choosing to go to the 'yes' child or the 'no' child 
based on whether the user answers \m[green]Yes\m[] or \m[green]No\m[] to each question. 
You will need to determine a way to determine when your function 
should make a 'guess' rather than asking another question.

If the computer does not guess the answer, 
the program needs to augment the tree with a new question. 
Consider drawing several examples on paper to see how you'll handle modifying 
your tree before you start coding. 
Figure out what nodes you need to point to, 
and how their pointers will change based on the information the user 
provides before you start trying to code this.

It's fine if the computer saves text into the question tree exactly as the user enters it. 
For example, if the user enters "A MOUSE" it's OK to simply leave the text in all caps. 
However, you are also welcome to do any text processing you like to make the text 
stored in the game tree more standard. 
A couple ideas include:
.RS
.IP \(bu
Standardizing capitalization
.IP \(bu
Adding question marks to the end of questions
.RE
.h2 Details about saving
.LP
In order to save and reload the game tree, you need to visit every tree node
.B
in the same order
.R
every time.

If your program ever loses track of tree nodes, 
entire sections of the tree could seem to disappear.

Also, remember that the 'root' node of a binary tree is at the tree mid point.

.h1 Example output
.h2 Show help
.LP
.CW
    ./20q -h
    Usage: ./20q [-h] [-f file_name]

    Options:
      -h   Show this text.
      -f   Load a game tree from a file
.R
.h2 Play a default game
.LP
Play a game using the the default question: 'Is it bigger than a breadbox?'

In these examples the computer's output is shown in black, 
while the user's responses are shown in green.

.RS
.CW
  ./20q
  Is it bigger than a breadbox?
  \m[green]no\m[]
  Is it spam?
  \m[green]no\m[]
  OK, what was it?
  \m[green]a mouse\m[]
  Give me a question that would distinguish a mouse from spam
  \m[green]Do you eat it with eggs?\m[]
  And would the answer to the question for a mouse be yes or no?
  \m[green]no\m[]
  Would you like to play again?
  \m[green]yes\m[]
  Is it bigger than a breadbox?
  \m[green]yes\m[]
  Is it a computer scientist?
  \m[green]no\m[]
  OK, what was it?
  \m[green]a bag of trash\m[]
  Give me a question that would distinguish a bag of trash from a computer scientist
  \m[green]Is it worth a lot of money?\m[]
  And would the answer to the question for a bag of trash be yes or no?
  \m[green]no\m[]
  Would you like to play again?
  \m[green]no\m[]
  Your final game tree was:
  0: Is it bigger than a breadbox?
  1:   No: Do you eat it with eggs?
  2:      No: a mouse
  3:      Yes: spam
  4:   Yes: Is it worth a lot of money?
  5:      No: a bag of trash
  6:      Yes: a computer scientist
  Would you like to save your game?
  \m[green]yes\m[]
  Please enter a filename to save your game
  \m[green]tree1.txt\m[]
  Game saved.
  Goodbye!
.R
.RE
.bp
.h2 Play a game loaded from a file
.LP
Because \*[c]20q\*[r] can can save ans load questions,
it can learn the more it is played.

.RS
.CW
  ./20q -f tree1.txt
  Is it bigger than a breadbox?
  \m[green]yes\m[]
  Is it worth a lot of money?
  \m[green]yes\m[]
  Is it a computer scientist?
  \m[green]no\m[]
  OK, what was it?
  \m[green]a house\m[]
  Give me a question that would distinguish a house from a computer scientist
  \m[green]Does it know Java?\m[]
  And would the answer to the question for a house be yes or no?
  \m[green]no\m[]
  Would you like to play again?
  \m[green]no\m[]
  Your final game tree was:
  0: Is it bigger than a breadbox?
  1:   No: Do you eat it with eggs?
  2:      No: a mouse
  3:      Yes: spam
  4:   Yes: Is it worth a lot of money?
  5:      No: a bag of trash
  6:      Yes: Does it know Java?
  7:         No: a house
  8:         Yes: a computer scientist
  Would you like to save your game?
  \m[green]yes\m[]
  Please enter a filename to save your game
  \m[green]tree2.txt\m[]
  Game saved.
  Goodbye!
.R
.RE

