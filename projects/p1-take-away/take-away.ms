.ds LH Take-away game project
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
Take-away game project
.LP
The goal is to create a two-player game of \fItake away\fR  
The game consists of one or more piles of coins.  
A player may remove any number of coins from a single pile when it is their turn.  
The player to remove the last coin wins.

.NH
Gameplay
.LP
Ask each player for their name.  
The game should initialize the game with a random number of piles and a random number of coins in each pile.  
Player one moves first.  
When the game is over the program should display the name of the winning player and prompt to play another round.

The game must only allow legal moves:
.RS
.nr step 1 1
.IP \n[step].
When it is a players turn they must remove at least 1 coin
.IP \n+[step].
A player cannot remove more coins than are in a single pile
.IP \n+[step].
A player may remove coins only from 1 pile per turn
.RE

After each player turn the game should redraw the current state of all remaining piles.  

Do not display piles with zero coins.
.NH
Implementation
.LP
You are expected to create a main function that takes command line arguments and
at most 2 classes:
.RS
.nr step 1 1
.IP \n[step].
Options
.IP \n+[step].
Controller
.RE

The computer player class is provided and you don't need to modify it.
The \fCtest\fR directory contains \fCboost\fR tests for the \fCComputerPlayer\fR class.

Your main method should accept the following command line arguments and should produce
a usage statement similar to the following:
.RS
.CW

  Usage: take-away [-h|?] [-ar] [-p #] [-c #]
  Options:
    -a   Use 'AI'.  Set player #2 to the computer.
         The default is to play a regular two-player game.

    -h|? Show this text

    -r   Use random values for # of piles and coins per pile.
         Optionally set 'p' or 'c' to define upper bounds
         on generated values for # of piles and coins per pile.
         The default is to play a non-random game

    -p   Set the starting number of piles.  Default = 3

    -c   Set the starting number of coins per pile.  Default = 5
.R
.RE
.NH 2
Options class
.LP
The Options class processes the command line and stores it for later use by the Controller.

.NH 2
Controller class
.LP
The game play controller is the 'brains' of the program.
It manages players, accepts user input, keeps track of whose turn it is, and declares winners.
The Controller requires 1 field to store piles of coins:

.CW
    /**
     * The piles (heaps) that are the focus of this game.
     * Each item in the vector represents an individual 'pile' of coins.
     * The value stored at each element represents the size of a pile,
     * i.e. the number of coins in that pile.
     */
    std::vector<size_t> piles;

.R
The Controller class has its own private data:
.RS
.nr step 1 1
.IP \n[step].
Strings to hold the name of each player
.IP \n+[step].
A boolean to keep track of whose turn it is
.IP \n+[step].
The Options object
.RE

A complete set of \fIdoxygen\fR documentation is also provided in the \fChtml\fR directory.
These documents are generated from the example solution source code and
provide more details about the design.
.NH
Additional Turn in Requirements
.LP
All projects will be graded according to the project rubric in BlackBoard.

Before uploading your project, make sure it meets all of the rubric criteria in order to get full credit.
.RS
.nr step 1 1
.IP \n[step].
Ensure the top of each source file includes your name and student ID.
.IP \n+[step].
Include unit tests for all significant public classes.
.IP \n+[step].
Include an appropriate level of documentation.  Doxygen should run with no warnings.
.IP \n+[step].
The template for this project includes a working \fCMakefile\fR.  
Your finished project should be able to build using \fCmake\fR executed on buffy.
.IP \n+[step].
Create a zip file of all of your project files and upload to BlackBoard.


