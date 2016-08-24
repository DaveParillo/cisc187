.ds CH Lab #1b
.TL
Lab #1b: C/C++ review
.so cover-page.ms

.bp
.NH
Making change:  15 minutes \fImaximum\fR
.time_box
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
     ++items;
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
.time_box
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

    std::cout << y << " and " << z << ".\n";
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
     if (i < 3) ++f;
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
              << size << " elements:\\n";

    for (int i = 0; i < size; ++i)
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
a.  double x = 5 + 1/2;


b.  int y = 5 + 1/2; 


c.  double x = 5 + 1/2.0;


d.  int y = 5 + 1/2.0;


e.  double x = 5 + (float)1/2;


f.  double x = 5 + (float)2/3.0;


g.  double x = 5 + 2^3;


h.  double x = 5 & 2^3;


i.  double x = 5 | 2^3;


j.  double x = (int) 5.0 << 1;


k.  double x = (int) 10.0 >> 3;


l.  bool z = true | false;  


m.  bool z = false; 
    double x = 4 | (int)(!z);
.R
.RE

.bp
.NH
Programming pool: 20 minutes \fImaximum\fR 
.LP
.time_box
Pull the following code snippets from the pool and place them in the Triangle program where there are underscores in the code.

You may use a snippet more than once.

You won't need all the snippets.

The goal is to make a working program that generates the following output:
.RS
.CW
  # ./triangle
  Triangle 0: area = 3
  Triangle 1: area = 8
  Triangle 2: area = 15
  Triangle 3: area = 24
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
 x < 5               ++x;         
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
                << ____.____ << std::endl;
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

.bp
.so reflection.ms


