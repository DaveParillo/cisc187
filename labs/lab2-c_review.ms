.ds LH Data Structures in C++
.ds CH Lab #2
.ds RH \*[the_date]
.ds CF %
.ds crn CRN 40299
.P1
.if '\*[.T]'ascii' \{\
.nr LL 8.5i
.nr LT 8.5i
\}
.
.TL
Lab #2: C/C++ review
.QI 2i
.QP
.B1
Start date and time: 

.B2
.LP
Before you start, complete the form below and assign a role to each member in your group.
If your group has 3 people, combine the Speaker and Reflector roles.

Everyone should perform all of these steps individually in order to familiarize yourself with the basics, 
but you are free to help eachother as you go.

.TS
center box tab (!);
cb|cb
l|l
l|l
l|l
l|lw(2.5i).
Team Roles!Team Member
 ! 
 ! 
_
\fBRecorder\fP: records all answers & questions !
and provides to instructor. !
_
\fBSpeaker\fP: talks to instructor. !
 ! 
_
\fBManager\fP: keeps track of time and ensures
everyone contributes appropriately. !
_
\fBReflector\fP: considers how the team could work !
and learn more effectively. !
.TE
.LP
Reminders:
.RS
.nr step 1 1
.IP \n[step].
Note the time whenever your team starts a new section or question.
.IP \n+[step].
Write legibly & neatly so that everyone can read & understand your responses.
.RE


.bp
.NH
Making change:  15 minutes \fImaximum\fR
.B1
.QP
Start time: 

.B2
.LP
Given:
.RS
.CW
#include <iostream> 

int main () 
{
  double funds = 1.00;
  int items = 0;

  for (double price = 0.10; funds >= price; price += 0.10) 
  {
    funds -= price;
    items++;
  }

  std::cout << "bought " << items << " items.\\n";
  std::cout << "change " << funds << " cents.\\n";
  return 0;

}

.R
.RE

.nr step 1 1
.IP \n[step].
In your own words, without simply rewriting the code as plain text, 
describe what is this code attempting to do:











.IP \n+[step].
Work through the logic manually (without compiling) and write down the expected output.










.IP \n+[step].
Copy this program into a file 'change.cpp'. Compile and run the program.
Record the output.









.IP \n+[step].
Did the actual output match you expectations?  Explain.












.IP \n+[step].
What changes should be made to make the results match expectations?






.bp
.NH
Code puzzles:  5 minutes each \fImaximum\fR 
.B1
.QP
Start time: 

.B2
.LP
For each of the problems that follow, describe the intended program output, if any, and
whether the program compiles or not.

If it doesn't compile or produces unintended output, what changes could be made to fix it?


.nr step 1 1
.IP \n[step].
.RS
.CW
  #include <iostream>
  #include <string>

  int main () {
   const std::string dudes[4] = 
                {"paco", "fred", "connor", "shoney"};
   for (int i = 0; i <= 4; i++) {
     std::cout << dudes[i] << std::endl;
   }
   return 0;

  }
.R
.RE


.IP \n+[step].
.RS
.CW
  #include <iostream>

  int main () 
  {
    double x;
    double y = x;
    double z = 2.0 + x;

    std::cout << y << " and " << z << ".\n";
    return 0;
  }
.RE


.IP \n+[step].
.RS
.CW
  #include <iostream>
  #include <string>

  int main () {

   for (int i = 0; i < 9; i++) {
     int x = 5;
     std::string pet = "Dog - ";
     if (i < 3) f++;
     else x += 2;
   }
   std::cout << pet << x << std::endl;
  }
.R
.RE
.bp
.IP \n+[step].

.RS
.CW
  #include <iostream>
  #include <string>

  int main () {
   int sa[4][3] = {{1,2,3,4}, {1,2,3}};

   std::cout << "first: " << sa[0][0] << std::endl;
   std::cout << "last:  " << sa[4][3] << std::endl; 
  }



.R
.RE


.IP \n+[step].

.RS
.CW
  #include <iostream>
  #include <string>

  std::string a[] = { "one", "two", "three" };
  std::string b[] = {};

  int main() {
    int size_of_a = sizeof(a) / sizeof(a[0]);
    int size_of_b = sizeof(b) / sizeof(std::string);

    void print(const std::string&, const std::string*, int);

    print("a[]", a, size_of_a);
    print("b[]", b, size_of_b);
  }

  void print(const std::string& name, 
             const std::string a[], int size) {
    std::cout << "The array " << name << " contains " 
              << size << " elements:\n";

    for (int i = 0; i < size; i++)
      std::cout << i << ": " << a[i] << std::endl;
    std::cout << std::endl;
  }
.R
.RE

.bp
.IP \n+[step].
For each expression below, indicate if it compiles.  
If yes, what is the result?
If no, what's wrong?

.RS
.CW

1.  double x = 5 + 1/2;


2.  int y = 5 + 1/2;


3.  double x = 5 + 1/2.0;


4.  int y = 5 + 1/2.0;


5.  double x = 5 + (float)1/2;


6.  double x = 5 + (float)2/3.0;


7.  double x = 5 + 2^3;


8.  double x = 5 & 2^3;


9.  double x = 5 | 2^3;


10.  double x = (int) 5.0 << 1;


11.  double x = (int) 10.0 >> 3;


12.  bool z = true | false;


13.  bool z = false; 
     double x = 4 | (int)(!z); 
.R
.RE

.bp
.NH
Programming pool: 20 minutes \fImaximum\fR 
.LP
.B1
.QP
Start time: 

.B2
.LP
Pull the following code snippets from the pool and place them in the Triangle program where there are underscores in the code.

You may use a snippet more than once.

You won't need all the snippets.

The goal is to make a working program that generates the following output:
.RS
.CW
  $ ./trangle
  Triangle 0: area = 3.0
  Triangle 1: area = 8.0
  Triangle 2: area = 15.0
  Triangle 3: area = 24.0
  Y is: 4, t5 area 15
  t[2] area is now 343
.R

.RE
Choose from the following code snippets:
.CW
 x                   int x = 0;          t[x]          
 y                   int y = 0;          t(x)   
 x < 4               int x = 1;          t.x     
 x <= 4              int y = x;   
 x < 5               x++;         
 x += 2;             x -= 1;       
 area                int          
 base                height          
 2.0                 2    
 return 0;
 Triangle t[4];
 Triangle[] t[4];
 Triangle t = new [] Triangle[4];
 t.set_area();
 t.x.set_area();
 t[x].set_area();
.R

.bp
.RS
.CW
  #include <iostream>

  struct Triangle {
    double area;
    int height;
    int base;
    void set_area() {
      ____ = (____ * ____) / ____;
    }
  };

  ____ main () {
  
    ____
    ____

    while (____) {
      ____.height = (x+1) * 2;
      ____.base = x + 3;
      ____
      std::cout << "Triangle " << x << ": area = " 
                << t[x].area << std::endl;
      ____
    }
    ____
    x = 27;
    Triangle t5 = t[2];
    t[2].area = 343;
    std::cout << "Y is: " << y << ", t5 area " 
              << t5.area << std::endl;
    std::cout << "t[2] area is now " << t[2].area << std::endl;

    ____
  }
.R
.RE











