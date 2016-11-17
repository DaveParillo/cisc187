.ds CH Lab #13b
.TL
Lab #13b: Lambda expressions
.so cover-page.ms

.bp
.NH
Lambda names: 60 minutes \fImaximum\fR
.time_box
.QP
The goal of this lab is to explore lambda expressions in more detail.

.RS
.nr step 0 1
.IP \n+[step].
Write a program that defines two lambdas and assigns them to local variables.
For example, one might be:
.RS
.CW
 auto foo = [] { cout << "Hello, lambda!"; };
.R
.RE
.IP \n+[step].
Add a \*[c]cout\*[r] at the end of \fCmain\fR to print the names of the lambdas:
.RS
.CW
 cout << typeid(foo).name() << endl;
.R
.RE
Note that \fCtypeid\fR requires \fC#include <typeinfo>\fR.
.IP \n+[step].
Run the program and observe the output.
.IP \n+[step].
Compile and run the program again if you are not already on buffy.
This time, pipe the output through \fCc++filt\fR to print the names of the lambdas:
.RS
.CW
 ./prog_name | c++filt -t
.R
.RE
.IP \n+[step].
Run the program and observe the output.
.IP \n+[step].
What are the implications of your observations?

.RE


.NH
Captures: 30 minutes \fImaximum\fR
.time_box
.RS
.nr step 0 1
.IP \n+[step].
Write a program that defines a simple \*[c]struct\*[r] that indicates which
constructors, etc. are called:
.RS
.CW
  struct Data {
    Data()
      { std::cout << "default constructor" << std::endl; }
    Data(const Data&)
      { std::cout << "copy constructor" << std::endl; }
    Data(Data&&)
      { std::cout << "move constructor" << std::endl; }
    ~Data()
      { std::cout << "destructor" << std::endl; }
  };
.R
.RE
.IP \n+[step].
Write a program that creates an instance of data and passes it in the capture of a lambda.
.IP \n+[step].
Compile and run the program.  
How many objects are created and destroyed?
What constructors are called?



.IP \n+[step].
Create a simple closure.
Pass an instance of the \*[c]struct\*[r] to the lambda.
.IP \n+[step].
Create a loop that executes 10 times and
call the closure from the body of the loop.
How many objects are created and destroyed?


.IP \n+[step].
Put the definition of the lambda in the loop body.
How many objects are created and destroyed?

.RE
.bp
.so reflection2.ms

