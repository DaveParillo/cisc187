.ds CH Lab #6a: Working with maps
.so headings.ms
.TL
\*[CH]
.NH
Working with the
.code 
map
.B
class: 100 points, 90 minutes \fImaximum\fR
.time_box

The goal of this lab is to compute and display the frequency of words encountered in a word list.
Both case sensitive and case insensitive frequencies will be generated.

.RS
.nr step 0 1
.IP \n+[step].
Define a 
\*[c]vector<string>\*[r] of words.  You may use this data:
.CW
    "bake", "foo", "Alice", "Bob", "darla", "MAP",
    "make", "alice", "Darla", "bat", "SET",
    "set", "FOO", "AlicE", "bob", "BAT", "map"
.R
.IP \n+[step].
Create a function \*[c]lower_case\*[r] that converts a string to all lower case characters.

Bonus:  do this without using any loops.
.IP \n+[step].
Create an overload for function \*[c]operator<<\*[r] that streams a
.br
\*[c]std::map<string, size_t>\*[r] to a provided output stream.
.IP \n+[step].
Create a function \*[c]frequencytable\*[r] with the following characteristics:
.RS
.IP a.
It should take as parameters the word list  from step 1 and
a function that performs some operation on each word in the list.
.IP b.
It should modify the words in the word list, 
add the transformed word to a 
.br
\*[c]map<string, size_t>\*[r], 
and update the count of the word in the map each time it is entered.

Recall map keys are unique. Duplicate keys or silently replaced with new values.
.IP c.
Return the map created in step b.
.RE
.IP \n+[step].
Create a lambda expression that takes a string parameter and simply returns the string.
.br
(Yes, this lambda does nothing).
.IP \n+[step].
Call the function \*[c]frequencytable\*[r] with the word list and lambda.
.IP \n+[step].
Create a second lambda expression that takes a string parameter and returns the string converted to lower case.
You should call the function \*[c]lower_case\*[r] created earlier.
.IP \n+[step].
Call the function \*[c]frequencytable\*[r] with the word list and the new lambda.
.IP \n+[step].
Finally, in the lower case frequency table, delete all the map entries where the frequency count equals 1.

.B
Note
.R

You will need to think differently about your loop in this situation.
You can't always increment your iterator as sometimes you are deleting the element it points to.
Use the return value from \*[c]erase()\*[r] to make sure you have the correct
iterator when an element is removed, 
otherwise increment the iterator.

.IP \n+[step].
Print out the lower case map again.
.IP \n+[step].
When complete, your output should resemble the following:
.CW
    word frequencies:
    AlicE	1    Alice	1    Bob    1
    Darla	1    FOO    1    alice	1
    bait    1    bake	1    bat    1
    bob	    1    darla	1    foo	1
    make    1    map    1    maps	1
    seat    1    set    1

    case insensitive frequencies:
    alice   3    bait   1    bake   1
    bat	    1    bob    2    darla  2
    foo	    2    make   1    map    1
    maps    1    seat   1    set    1

    deleted infrequently occurring words:
    alice	3
    bob	    2
    darla	2
    foo	    2
.R
.RE

