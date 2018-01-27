.ds CH Lab #3a: Templates
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Defining a template: 100 points, 90 minutes \fImaximum\fR
.time_box
.QP
.RS
.nr step 0 1
.IP \n+[step].
Define \*[c]template<typename T> struct S { T val; };\*[r].
.IP \n+[step].
Add a constructor, so that you can initialize with a \*[c]T\*[r].
.IP \n+[step].
Define variables of types 
 \*[c]S<int>\*[r], 
 \*[c]S<char>\*[r], 
 \*[c]S<double>\*[r], 
 \*[c]S<string>\*[r], and 
 \*[c]S<vector<int>>\*[r]; 
 initialize them with values of your choice.
.IP \n+[step].
Read those values and print them.
.IP \n+[step].
Add a function template \*[c]get()\*[r] that returns a reference to \*[c]val\*[r].
.IP \n+[step].
Put the definition of \*[c]get()\*[r] outside the class.
.IP \n+[step].
Make \*[c]val\*[r] private.
.IP \n+[step].
Do 4 again using \*[c]get()\*[r].
.IP \n+[step].
Add a \*[c]set()\*[r] function template so that you can change \*[c]val\*[r].
.IP \n+[step].
Replace \*[c]set()\*[r] with an \*[c]S<T>::operator=(const T&)\*[r]. Hint: Much simpler than \*[sect]19.2.5.
.IP \n+[step].
Provide \*[c]const\*[r] and non-\*[c]const\*[r] versions of \*[c]get()\*[r].
.IP \n+[step].
Define a function \*[c]template<typename T> read_val(T& v)\*[r] that reads from \*[c]cin\*[r] into \*[c]v\*[r].
.IP \n+[step].
Use \*[c]read_val()\*[r] to read into each of the variables from step #3 except the \*[c]S<vector<int>>\*[r] variable.

Extra credit:
Define input and output operators (>> and <<) for \*[c]vector<T>\*[r]s. 
For both input and output use a \fC[ val, val, val ]\fR format. 
That will allow \fCread_val()\fR to also handle the \fCS<vector<int>>\fR variable.
.RE


