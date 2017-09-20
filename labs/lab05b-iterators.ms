.ds CH Lab #5b: Iterators
.so headings.ms
.TL
\*[CH]
.so cover-page.ms


The goal of today's lab is compare inserting and erasing elements in 
\*[c]std::vector\*[r] and \*[c]std::list\*[r]
and to practice working with iterators.


Don't forget to answer the questions in the lab!

You may include your answers to these questions in a text file uploaded with your lab source code.
.bp
.NH
Vector vs List: 100 points, 90 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Explain in your own words why \*[c]vector\*[r] does not have a function \*[c]push_front()\*[r]
as part of it's API.  
Include what would be required if it existed and compare it to \*[c]push_back()\*[r].

.IP \n+[step].
Implement the unfinished functions in a timing experiment to compare the cost of running vector and list. 

All of the unfinished functions are marked with \*[c]// Your code here:\*[r]
and contain some details to explain what is expected for each unfinished function.

Only the file \fClab5b.h\fR requires changes.
The file \fClab5b.cpp\fR is provided to help evaluate your results.

There are 6 function bodies to complete:
.RS
.IP a.
\*[c]sorted_insert\*[r]

This function is a helper for the two test_insert overloads.
It ensures each insert maintains a sort order.
Do \fBNOT\fR simply \*[c]push_back\*[r] a value and call \*[c]std::sort\*[r].
.IP b.
\*[c]test_insert(C& container, const int max)\*[r] 

Insert \fCmax\fR random numbers into the container.
The random number functions have been provided.
.IP c.
\*[c]test_insert(C& container, const vector<int>& rand_values)\*[r] 

Insert each rand_value one at a time into the container.
.IP d.
\*[c]test_insert_begin\*[r] 

Test inserting value only at the beginning of a container.
.IP e.
\*[c]test_insert_end\*[r] 

Test inserting value only at the end of a container.
.IP f.
\*[c]test_remove\*[r] 

Test removing values randomly withing a container.  
One of these two function has been written for you.

.RE
.IP \n+[step].
For which conditions is the \*[c]list\*[r] faster than the \*[c]vector\*[r]?  
.br
Explain your results in your own words.

.IP \n+[step].
Compile your program with optimization. 
.br
In \fCg++\fR, the command-line argument is \fC-O3\fR.
.br
Explain the change in the results.
.RE


