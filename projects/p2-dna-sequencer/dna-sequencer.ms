.ds LH DNA Sequencer Project
.ds RH CISC-187
.ds CF -%-
.ds CH 
.TL
\*[LH]
.LP
A key element in many bioinformatics problems is the biological sequence. 
A biological sequence is just a list of characters chosen from some alphabet. 
Two of the common biological sequences are DNA 
(composed of the four characters A, C, G, and T) and RNA 
(composed of the four characters A, C, G, and U). 
In this project, you will implement some basic functionality for 
manipulating DNA and RNA sequence fragments.

.h1 Implementation
.LP
Implement class to store a single DNA or RNA sequence fragment.
The class should store the character sequence and the sequence type.

In addition to the sequences, define a second class containing a \*[c]vector\*[r], 
of DNA sequences.
This "fragment list" stores the various sequences and must be fixed size. 
Commands that manipulate sequences will refer directly to entries in the fragment list. 

The sequence type field should use an enumerated type, 
and you should also include an enumeration value to recognize that a given 
position in the fragment list is unused.

The primary design consideration for this project will be the interface between 
the sequence class and its client.  
It is mandatory that the sequence and fragment list classes remains application independent. 

.h1 Input and output
.LP
The program must be named \fIsequencer\fR and support the following command-line arguments:
.CW
  Usage: sequencer [-h|?] [-m #] [-l log_level] -f <file name>
  Options:
    -h|? Show this text

    -m   Optional. Max amount of space allocated for dna sequence fragments.
         The default is 8

    -l   Optional. Set the log detail level.
         The default is 'info'

    -f   Required. File name containing commands for the sequencer
         The file should be plain text, 1 command per line
       If no file is specified, the program will exit.
.R

The input for this project will consist of a series of commands 
(some with associated parameters, separated by spaces), one command for each line in the file. 
A blank line may appear anywhere in the command file, and any number of spaces may separate parameters. 
A line beginning with \fC#\fR is considered a comment and should be printed 'as-is' to standard output.
You need not worry about checking for syntax errors in the file, but
commands must be case insensitive. 
That is, only the specified commands will appear in the file, and 
the specified parameters will always appear. 
However, you must range-check all input parameters. 
As part of the grading process, 
I will provide input files that will attempt to get your program to generate errors.  
Your code must protect against these types of errors.

The commands will be read from an input file, and 
the output from the commands will be written to standard output. 
The program should terminate after reading the last line of the file (EOF mark). 

.bp
.h1 Sequence Types
.LP
Sequences come in 2 flavors:
.nr step 1 1
.RS
.IP \n[step].
DNA \*[-] the DNA strand
.IP \n+[step].
RNA \*[-] the RNA strand
.RE

Each sequence contains at most 4 unique letters:
.RS
.TS
box tab(:);
cb cb
c c.
\m[blue]DNA:RNA\m[]
_
A:A
C:C
G:G
T:U
.TE
.RE
.h1 Command API
.LP
The commands used in the input file are described in the following subsections.
.SH
insert \fRpos type sequence\fP
.LP
Insert the sequence at position \fIpos\fR in the fragment list. 
The type will be either \fBDNA\fR or \fBRNA\fR. 
You must check that sequence contains only appropriate letters for its type, 
if not the insert operation is in error and no change should be made to the sequence list. 

If there is already a sequence at \fIpos\fR and if sequence is syntactically correct, 
then the new sequence replaces the old one at that position. 
It is acceptable that sequence be null (contain no characters) in which case an empty sequence 
will be stored at \fIpos\fR. 

\fBNote:\fR an empty \fIsequence\fR in a position is different from a position with no sequence stored.
.SH
remove \fRpos\fP
.LP
Remove the sequence at position \fIpos\fR in the fragment list.
Be sure to set the sequence type to indicate that this position is now empty. 
If there is no sequence at \fIpos\fR, output a suitable message.
.SH
print
.LP
Print out all sequences in the fragment list. 
Indicate for each sequence its position within the fragment list and 
the type of that sequence (RNA or DNA). 
Don't print anything for slots in the fragment list that are empty. 
.SH
print \fRpos\fP
.LP
Print the sequence and type at position \fIpos\fR in the fragment list.
If there is no sequence in that position, print a suitable message.
.SH
clip \fRpos start\fP
.LP
Replace the sequence at position \fIpos\fR with a clipped version of the sequence. 
The clipped version is that part of the sequence beginning at character \fIstart\fR and 
continuing to the end of the original sequence. 
It is an error if start is less than zero or beyond the end of the sequence.
A clip command with an error should make \fBno change\fR to the sequence
and display a suitable message. 
If there is no sequence at this slot, output a suitable message.
.SH
copy \fRpos1 pos2\fP
.LP
Copy a sequence from position \fIpos1\fR to \fIpos2\fR.
If there is no sequence at \fIpos1\fR, 
output a suitable message and do not modify the sequence at \fIpos2\fR.
.SH
swap \fRpos1 start1 pos2 start2\fP
.LP
Swap the tails of the sequences at fragment positions \fIpos1\fR and \fIpos2\fR.
The tail for \fIpos1\fR begins at character \fIstart1\fR and 
the tail for \fIpos2\fR begins at character \fIstart2\fR.
It is an error if the value of the start position is greater than the 
length of the sequence or less than zero. 
If the length of a sequence is \fIn\fR, the start position may be \fIn\fR, 
meaning that the tail of the other sequence is appended 
(i.e., a tail of null length is being swapped). 
The swap operation should be reported as an error if the two sequences are not of the same type, 
or if one of the slots does not contain a sequence. 
In either case, no change should be made to the sequences.
.SH
transcribe \fRpos\fP
.LP
Transcription converts a \fBDNA\fR sequence into an \fBRNA\fR sequence.

To transcribe a sequence from \fBDNA\fR to \fBRNA\fR:
.nr step 1 1
.RS
.IP \n[step].
Change its type field to \fBRNA\fR, 
.IP \n+[step].
Convert any occurrences of \fBT\fR to \fBU\fR, 
.IP \n+[step].
Complement all the letters in the sequence using the table below, and 
.IP \n+[step].
Reverse the sequence. 
.TS
box tab(:);
cb s s
c c c.
\m[blue]DNA to RNA Complements\m[]
=
DNA::RNA
A:<\*[-]\*[-]>:U
C:<\*[-]\*[-]>:G
.TE
.RE
If an attempt is made to transcribe RNA to DNA, then print a suitable message
and do not change the sequence.
.h1 Doxygen documentation provided
.LP
A complete set of \fIdoxygen\fR documentation is also provided in the \fChtml\fR directory.
Those documents are generated from the example solution source code and may
provide more insight into a working solution.

Those documents are provided as a source of additional information and are a \fIsuggestion\fR.
Unlike the information contained in this document, the additional \fIdoxygen\fR information
is intended to be a helpful addendum only. 
Feel free to use them if you need them, but they should \fBnot\fR be confused with this document, which
define the
.BI project\0requirements.
.h1 Additional Turn in Requirements
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
.RE


