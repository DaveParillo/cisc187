.ds CH Lab #5b: Iterators
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Vector vs List: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Explain in your own words why \*[c]vector\*[r] does not have a function \*[c]push_front()\*[r]
as part of it's API.  
Include what would be required if it existed and compare it to \*[c]push_back()\*[r].










.IP \n+[step].
Run a small timing experiment to compare the cost of running vector and list. 
You can find an explanation of how to time a program in \*[sect]26.6.1. 
Generate \fIN\fR random \*[c]int\*[r] values in the range [0:\fIN\fR]. 
As each int insert it into a \*[c]vector<int>\*[r] (which grows by one element each time). 
Keep the vector sorted; that is a value is inserted after every previous 
value that is less than or equal to the new value and before every previous 
value that is larger than the new value. 
Now do the same experiment using a \*[c]list<int>\*[r] to hold the \*[c]int\*[r]s. 
For which \fIN\fR is the \*[c]list\*[r] faster than the \*[c]vector\*[r]?  

You could use \*[c]rand\*[r], but the STL includes a random libraryr.
Refer to the example source file \fCexamples/week01/random.cpp\fR.



















.IP \n+[step].
Explain your results in your own words.
.RE


