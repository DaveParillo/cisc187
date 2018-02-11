.ds CH Lab #1b C/C++ review
.so headings.ms
.TL
\*[CH]
.LP
This lab reviews the core programming concepts you learned in your first semester of C++.
.so cover-page.ms
.bp
.NH
Making change: 60 points, 30 minutes \fImaximum\fR
.time_box
.RS
Given:
.CW
 #include <iostream> 
 
 int main () 
 {
   double funds = 1.00;
   int items = 0;
 
   for (double price = 0.10; funds >= price; price += 0.10) 
   {
     funds -= price;
     ++items;
   }
   std::cout << "bought " << items << " items.\\n";
   std::cout << "change " << funds << " cents.\\n";
   return 0;
 }
.R
.nr step 0 1
.IP \n+[step].
In your own words, without simply rewriting the code as plain text, 
describe what is this code attempting to do:




.IP \n+[step].
Work through the logic manually (without compiling) and write down the expected output.




.IP \n+[step].
Copy this program into a file 'change.cpp'. Compile and run the program on buffy.
Record the output.




.IP \n+[step].
Did the actual output match your expectations?
.br
What is the key programming 'lesson learned' here?






.IP \n+[step].
What changes should be made to make the results match expectations?
.RE
.bp
.NH
Code quiz: 40 points, 30 minutes \fImaximum\fR 
.time_box
.RS
The quizzes conducted each Wednesday are primarily in this format.
Consider this a dry run for the rest of the semester.

For each of the problems that follow, describe the intended program output, if any, and
whether the program compiles or not.

If it doesn't compile or produces unintended output, what changes could be made to fix it?

.nr step 0 1
.IP \n+[step].
.RS
.CW
  #include <iostream>
  #include <string>

  int main () {
   const std::string dudes[4] = 
                {"paco", "fred", "connor", "shoney"};
   for (int i = 0; i <= 4; ++i) {
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

  int main () {
    double x;
    double y = x;
    double z = 2.0 + x;

    std::cout << y << " and " << z << ".\\n";
    return 0;
  }
.R
.RE

.IP \n+[step].
.RS
.CW
  #include <iostream>
  #include <string>

  int main () {
   for (int i = 0; i < 9; ++i) {
     int x = 5;
     std::string pet = "Dog - ";
     if (i < 3) ++x;
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
   int sa[4][3] = {{1,2,3,4}, {5,6,7}};

   std::cout << "first: " << sa[0][0] << std::endl;
   std::cout << "last:  " << sa[4][3] << std::endl; 
  }
.R
.RE

.IP \n+[step].
For each expression below, indicate if it compiles.  
If yes, what is the result?
If no, what's wrong?
.RS

.CW
a.  double x = 5 + 1/2;


b.  double x = 5 + 1/2.0;


c.  int y = 5 + 1/2.0;


d.  double x = 5 + (float)2/3.0;


e.  double x = 5 + 2^3;


f.  double x = (int) 5.0 << 1;


g.  bool z = false; 
    double x = 4 | (int)(!z);
.R
.RE
.RE

.bp
.NH
Extra Credit: Programming pool: about 30 minutes
.LP
.time_box
.RS
Pull the following code snippets from the pool and place them in the Triangle program where there are underscores in the code.

You may use a snippet more than once.

You won't need all the snippets.

The goal is to make a working program that generates the following output:
.RS
.CW
  # ./triangle
  Triangle 0: area = 7.5
  Triangle 1: area = 20
  Triangle 2: area = 37.5
  Triangle 3: area = 60
  Triangle 4: area = 87.5
  Y is: 5, t5 area 37.5
  t[2] area is now 27.5

.R

.RE
Choose from the following code snippets:
.CW
 x                   int x = 0;          t[x]          
 y                   int y = 0;          t(x)   
 x < 5               int x = 1;          t.x     
 x <= 5              int y = x;   
 x < 6               ++x;         
 x += 2;             x -= 1;       
 area                int                 double         
 base                height          
 2.0                 2    
 return 0;
 triangle t[5];
 triangle[] t[5];
 triangle t = new [] triangle[5];
 t.set_area();
 t.x.set_area();
 t[x].set_area();
.R
.RE
.bp
.RS
.CW
  #include <iostream>

  struct triangle {
    double area;
    int height;
    int base;
    void set_area() {
      ____ = ______ (____ * ____) / ____;
    }
  };

  ____ main () {
  
    ____
    ____

    while (____) {
      ____.height = (x+1) * 5;
      ____.base = x + 3;
      ____
      std::cout << "Triangle " << x << ": area = " 
                << ____.____ << std::endl;
      ____
    }
    ____
    x = 11;
    triangle t5 = t[2];
    std::cout << "Y is: " << y << ", t5 area " 
              << t5.area << std::endl;
    t[2].____ = y;
    t[2].____ = x;
    t[2].set_area();
    std::cout << "t[2] area is now " << t[2].area << std::endl;

    ____
  }
.R
.RE

Create a file \fCtriangle.cpp\fR on the Mesa server and
use the snippets from the pool to make a working program.

Check your progress using the command: \*[c]check187 lab1b-extra\*[r].

Turn in your completed work using the command: \*[c]submit187 lab1b-extra\*[r].

