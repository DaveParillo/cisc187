.ds LH Take away game
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
\*[LH]
.LP
The goal of this project is to create a two player game called \*[c]take away\*[r].
The games consists on one or more piles.
Typically, each pile contains stones or sticks.
In your program, you may refer to them how you like.
I will use stones.

A player may remove any number of stones from \fBa single pile\fR
when it is their turn.
The player who removes the last stone(s) wins.

.h1 Basic Gameplay
.LP
Ask each player for their name.
The game should initialize the game with a random number of piles and a random number of coins in each pile.
The first player starts.
When the game is over the program should display the name of the winning player and prompt to play another.

The game must only allow legal moves:
.RS
.nr step 0 1
.IP \n+[step].
When it is a players turn they must remove at least 1 coin
.IP \n+[step].
A player cannot remove more coins than are in a single pile
.IP \n+[step].
A player may remove coins only from 1 pile per turn

After each player turn the game should redraw the current state of all remaining piles.
Do not display piles with 0 coins.
.RE
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
Globals created as side effects of using library functions are OK (getopt, etc.).
.IP \n+[step].
Ensure the intent behind every program element is "crystal clear".
Add documentation where it makes sense to do so.
.IP \n+[step].
Ensure all project requirements are met and all results are correct.
.IP \n+[step].
The program must enforce the rules of the game.
This includes handling error conditions.

Don't allow users to break your game by entering invalid inputs.
.IP \n+[step].
Your finished project should be able to build using \fCmake\fR executed on buffy.
.IP \n+[step].
Use the \fCturnitin\fR script to submit your project.
Remember to "clean" your project before submitting it - it will be much smaller.
.RE
.bp
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
 \*[c]-c\*[r] to play against the \*[c]c\*[r]omputer
 \*[c]-p\*[r] to set an exact number of \*[c]p\*[r]iles
 \*[c]-s\*[r] to set an exact number of \*[c]s\*[r]tones in each pile
.RE
.IP \n+[step].
Prompt for the names of two players.
If the \*[c]-c\*[r] switch is set, 
then player two is automatically the computer.
Do not prompt for the name of the computer - provide a default name.

The computer player should always be player two.
.IP \n+[step].
If the \*[c]-p\*[r] or \*[c]-s\*[r] switches are set, 
do not allow either parameter to be set < 1.
You may choose to define a larger minimum value.

You may also set a maximum value.

If these switches are not set, then their values should be determined randomly.
The same constraints used for manual entry apply to randomly generated values.
.IP \n+[step].
While the program executes, it should be clear:
.RS
.IP a.
Whose turn it is
.IP b.
What piles can be selected
.IP c.
How many stones are in each pile
.RE
.IP \n+[step].
Program definitions and declarations must be kept in separate source files.
.IP \n+[step].
Program functions should be small and each function should perform
exactly one task.
.IP \n+[step].
Project rubric requirements for correctness, clarity, design, and coding are met or exceeded.
.RE

.h1 Example output
.h2 Show help
.CW
    ./take-away -h
    Usage: ./take-away [-h] [-c] [-p # piles] [-s # stones] 

    Options:
      -h   Show this text.
      -c   Make player two the computer.  Default = false.
      -p   Manually set the starting number of piles in the game.
      -s   Manually set the starting number of stones in each pile.
.R
.h2 Default behavior
.br
Play a random two player game.
.CW
    ./take-away
    First player name: Alice
    Second player name: Bob
    Player 1: Alice
    Player 2: Bob
    Heap 1 [ 5]: *****
    Heap 2 [14]: **************
    Heap 3 [ 8]: ********

    Alice's turn
    Which heap? 1
    How many coins? 5
    Player 1: Alice
    Player 2: Bob
    Heap 1 [14]: **************
    Heap 2 [ 8]: ********

    Bob's turn
    Which heap? 2
    How many coins? 9
       There aren't that many coins in this heap.
    How many coins? 7
    Player 1: Alice
    Player 2: Bob
    Heap 1 [14]: **************
    Heap 2 [ 1]: *

    Alice's turn
    Which heap? 1
    How many coins? 13
    Player 1: Alice
    Player 2: Bob
    Heap 1 [ 1]: *
    Heap 2 [ 1]: *

    Bob's turn
    Which heap? 1
    How many coins? 1
    Player 1: Alice
    Player 2: Bob
    Heap 1 [ 1]: *

    Alice's turn
    How many coins? 1
    Alice wins!!
    Play another game? [Y/n] n
.R

.h2 Play against the computer
.CW
    ./take-away -c 7
    Human player name: Darla

    Player 1: Darla
    Player 2: HAL 9000
    Heap 0 [ 3]: ***
    Heap 1 [ 7]: *******
    Heap 2 [ 1]: *

    Darla's turn
    Which heap? 

.R

