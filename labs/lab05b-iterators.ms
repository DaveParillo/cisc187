.ds CH Lab #5b: Iterators
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
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
Run a small timing experiment to compare the cost of running vector and list. 
You can find an explanation of how to time a program in \*[sect]26.6.1. 
Generate \fIN\fR random \*[c]int\*[r] values in the range [0:\fIN\fR]. 
As each int insert it into a \*[c]vector<int>\*[r] (which grows by one element each time). 
Keep the vector sorted; that is a value is inserted after every previous 
value that is less than or equal to the new value and before every previous 
value that is larger than the new value. 
Now do the same experiment using a \*[c]list<int>\*[r] to hold the \*[c]int\*[r]s. 

You could use \*[c]rand\*[r], but the STL includes a random libraryr.
Refer to the example source file \fCexamples/week01/random.cpp\fR.

You may also find these parts of the STL useful:
.CW
  std::chrono::system_clock::now();
  std::chrono::duration_cast<std::chrono::microseconds>()
.R

See http://en.cppreference.com/w/cpp/chrono/time_point, 
for example:
.CW
  using sys_time = std::chrono::system_clock;
  auto start = sys_time::now();

  \m[green]// run test\m[]

  auto end = sys_time::now();
  std::cout << std::setw(10) << std::right 
            << std::chrono::duration_cast
                <std::chrono::microseconds>
                 (end - start).count();
.R

.IP \n+[step].
For which \fIN\fR is the \*[c]list\*[r] faster than the \*[c]vector\*[r]?  
Explain your results in your own words.

.IP \n+[step].
Compile your program with omtimization (g++ argument is "-O2")
Explain the change in the results.
.RE


