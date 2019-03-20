.ds CH Lab #7b: Working with maps
.so headings.ms
.TL
\*[CH]
.NH
Working with the
.code 
map
.B
class: 4 points, 90 minutes \fImaximum\fR
.LP

The goal of this lab is to compute and display the frequency of words encountered in a word list.
Both case sensitive and case insensitive frequencies will be generated.

In the steps that follow,
unless otherwise noted, place all code in the \*[c]mesa\*[r] namespace.

.RS
.nr step 0 1
.IP \n+[step].
Create the files \fClab7b.h\fR, \fClab7b.cpp\fR, and \fCmain.cpp\fR.
.IP \n+[step].
Create a function \*[c]to_lower\*[r] that converts a string to all lower case characters.
.CW
  string to_lower(const string&);
.R

Bonus:  do this without using any raw loops.
.IP \n+[step].
Create an overload for function \*[c]operator<<\*[r] that streams a word list
to a provided output stream.
.CW
  std::ostream& 
    operator<<(std::ostream&, const map<string, size_t>&);
.R

Do not put the \*[c]operator<<\*[r] function in the  \*[c]mesa\*[r] namespace.

.IP \n+[step].
Create a function \*[c]frequency_table\*[r] with the following characteristics:
.RS
.IP a.
It should take as parameters a word list: a \*[c]vector<string>\*[r] of words and
a function that performs some operation on each word in the list.
.CW
  map<string, size_t>
    frequency_table(const std::vector<string>&, 
                    std::function<string (const string&)>);
.R

.IP b.
Create a new empty frequency table: a \*[c]map<string, size_t>\*[r].
.IP c.
Loop on each word in the \*[c]vector\*[r] and use the function to make a
frequency table entry.
.IP c.
Each time a value is added or modified in the frequency table,
update the word count in the map.

Recall map keys are unique. Duplicate keys are silently replaced with new values.
.IP d.
Return the new map.
.RE
.RE

The remaining steps are optional extra practice.

.RS
.IP \n+[step].
\fBOptional step\fR

Create a function \*[c]print_common\*[r] that takes two parameters: 
a \*[c]map<string, size_t>\*[r] and a minimum frequency.
It should print all elements in the map where 
the word frequency is greater than or equal to the frequency provided.
.bp
.IP \n+[step].
\fBOptional step\fR

In \*[c]main.cpp\*[r] create a program that uses your functions from the previous steps.
.RS
.IP a.
Define a
\*[c]vector<string>\*[r] of words.  You may use this data:
.CW
    "bake", "foo", "Alice", "Bob", "darla", "MAP",
    "make", "alice", "Darla", "bat", "SET",
    "set", "FOO", "AlicE", "bob", "BAT", "map"
.R
.IP b.
Make a word list map from the vector and print it.

Call the function \*[c]frequencytable\*[r] with the word list and a function that simply returns whatever string is provided.
.br
(Yes, this function does nothing).
.IP c.
Make a lowercase version of the word list map and print it.

Call the function \*[c]frequencytable\*[r] with the word list and a function that converts a string to lower case.
.IP d.
Print all the 'common' lowercase words.
Call \*[c]print_common\*[r] with the lower case map and a minimum frequency of 2. 


When complete, your output should resemble the following:
.CW
    word frequencies:
    AlicE   1    Alice  1    Bob    1
    Darla   1    FOO    1    alice  1
    bait    1    bake   1    bat    1
    bob     1    darla  1    foo    1
    make    1    map    1    maps   1
    seat    1    set    1

    case insensitive frequencies:
    alice   3    bait   1    bake   1
    bat     1    bob    2    darla  2
    foo     2    make   1    map    1
    maps    1    seat   1    set    1

    common words:
    alice   3
    bob     2
    darla   2
    foo     2
.R
.RE
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab7b
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab7b
.R

