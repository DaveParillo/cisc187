.ds LH Take away game
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
\*[LH]
.LP
The goal of this project is to create a two player game called \*[c]take away\*[r].
The games consists of one or more piles.
Typically, each pile contains stones or sticks.
In your program, you may refer to them how you like.
I will use stones.

A player may remove any number of stones from \fBa single pile\fR
when it is their turn.
The player who removes the last stone(s) wins.

.h1 Basic Gameplay
.LP
Ask each player for their name.
The game should initialize the game with a random number of piles and a random number of stones in each pile.
The first player starts.
When the game is over the program should display the name of the winning player and prompt to play another.

The game must only allow legal moves:
.RS
.nr step 0 1
.IP \n+[step].
When it is a players turn they must remove at least 1 stone
.IP \n+[step].
A player cannot remove more stones than are in a single pile
.IP \n+[step].
A player may remove stones only from 1 pile per turn

After each player turn the game should redraw the current state of all remaining piles.
Do not display piles with 0 stones.
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

.h1 Implementing the computer player

Don't make this more complex than needed!
.LP
You need a minimum of 3 functions:
.RS
.nr step 0 1
.IP \n+[step].
A function capable of evaluating the current state of the game.  How many stones in each pile, etc. This function needs to determine what pile the computer should play and how many stones to take.
.IP \n+[step].
A function to return the 'which pile' determination from step 1.
.IP \n+[step].
A function to return the 'how many' determination from step 1.
.RE
How you code this is up to you, however, there is a simple winning strategy for this game
that can be easily implemented on a computer.

The trick is to work with the numbers of stones as \fBbinary\fR instead of decimal.

The key to the strategy is to try to make a move that results in the 
\*[c]exclusive or\*[r] of the stones in all piles is equal to zero.
For example, given a game with 3 piles with 2, 3, and 4 stones in the piles.
In binary, the game looks like:

.CW
    0 1 0 
    0 1 1
  ^ 1 0 0
    -----
    1 0 1
.R

This result is called the \fInim sum\fR, because this strategy was first completely described in 1901
by a mathematician, Charles Bouton, who named the game 'nim'.
The origins of this game are much more ancient, but the exact history has been lost.

Since the nim sum is greater than 0, a winning move is possible.
That is, a move that changes the nim sum of all heaps to 0 is possible.
If 3 stones are removed from the pile containing 4:

.CW
    0 1 0 
    0 1 1
  ^ 0 0 1
    -----
    0 0 0
.R

That leaves \fC1 ^ 2 ^ 3\fR, which = 0.

This is a "winning position", because there is no move the next player can make
which will leave the piles in a state where the nim sum of all piles is zero.

If when it is your turn, the nim sum is already zero, 
then there is no move you can make to guarantee a win.
The only winning strategy is to drag the game out and hope your opponent makes a mistake.

This is a rational strategy for a computer, because the longer a game lasts,
the more likely a human opponent will make a mistake the computer can take advantage of.

For more information, see:
.RS
.nr step 0 1
.IP \n+[step].
https://plus.maths.org/content/play-win-nim
.IP \n+[step].
https://en.wikipedia.org/wiki/Nim
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
.LP
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
    How many stones? 5
    Player 1: Alice
    Player 2: Bob
    Heap 1 [14]: **************
    Heap 2 [ 8]: ********

    Bob's turn
    Which heap? 2
    How many stones? 9
       There aren't that many stones in this heap.
    How many stones? 7
    Player 1: Alice
    Player 2: Bob
    Heap 1 [14]: **************
    Heap 2 [ 1]: *

    Alice's turn
    Which heap? 1
    How many stones? 13
    Player 1: Alice
    Player 2: Bob
    Heap 1 [ 1]: *
    Heap 2 [ 1]: *

    Bob's turn
    Which heap? 1
    How many stones? 1
    Player 1: Alice
    Player 2: Bob
    Heap 1 [ 1]: *

    Alice's turn
    How many stones? 1
    Alice wins!!
    Play another game? [Y/n] n
.R
.bp
.h2 Play against the computer
.CW
    ./take-away -c 
    Human player name: Darla

    Heap 0 [15]: ***************
    Heap 1 [13]: *************
    Heap 2 [ 7]: *******
    Heap 3 [12]: ************
    Heap 4 [11]: ***********
    Heap 5 [ 9]: *********
    Darla's turn
    Which heap? 1
    How many stones? 13

    Heap 0 [15]: ***************
    Heap 1 [ 7]: *******
    Heap 2 [12]: ************
    Heap 3 [11]: ***********
    Heap 4 [ 9]: *********
    HAL 9000's turn
    HAL 9000 removed 6 stones from heap 0.

    Heap 0 [ 9]: *********
    Heap 1 [ 7]: *******
    Heap 2 [12]: ************
    Heap 3 [11]: ***********
    Heap 4 [ 9]: *********
    Darla's turn
    Which heap? 

    (rest of the game ommitted)
    .R

