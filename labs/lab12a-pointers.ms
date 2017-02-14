.ds CH Lab #12a: Pointers
.so headings.ms
.TL
\*[CH]
.NH
Free-store allocated arrays vs 
.code vector
.B
: 60 minutes \fImaximum\fR
.time_box
.QP
This exercise is intended to build your understanding of free-store allocated arrays 

.RS
.nr step 1 1
.IP \n[step].
Write the function \*[c]print_array10(ostream& os, int* a)\*[r] that prints out the values of array \fCa\fR (assumed to have ten elements) to \*[c]os\*[r].
.IP \n+[step].
Allocate an array of ten \*[c]int\*[r]s on the heap (using \*[c]new\*[r]), initialize it with the values of
 100, 101, 102, etc., and print out its values using \fCprint_array10\fR.
.IP \n+[step].
Write a function \*[c]print_array(ostream& os, int* a , int n)\*[r] that prints out 
the values of \*[c]a\*[r] (assumed to have n elements) to \*[c]os\*[r].
.IP \n+[step].
Allocate an array of 20 \*[c]int\*[r]s on the heap, 
initialize it with the values of 200, 201, 202, etc., and print out its values.
.IP \n+[step].
Did you remember to delete the arrays? (If not, do it.)
.RE 

Compare this to code you have written in the past to work with and print the eleements of a \*[c]vector\*[r].
What advantages does a \*[c]vector\*[r] have over an array?
What advantages does an array have over a \*[c]vector\*[r]?

.bp
.NH
Defining and using 
.code std::make_unique<T>()
.B
: 30 minutes \fImaximum\fR
.time_box
.RS
Although std::unique_ptr<T>() and std::make_shared<T>() were introduced in C++11,
The  \*[c]std::make_unique<T>()\*[r] template was not introduced until C++14.
But if you find yourself using a compiler that doesn't know about 
\*[c]std::make_unique<T>()\*[r], you can make it yourself pretty easily.

.CW
  template<typename T, typename... Args>
  std::unique_ptr<T> make_unique(Args&&... args) {
    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
  }

  int main() {
    \m[green]// Use the default constructor.\m[]
    std::unique_ptr<Foo> v1 = std::make_unique<Foo>();
    \m[green]// Use the constructor that matches these arguments\m[]
    std::unique_ptr<Foo> v2 = std::make_unique<Foo>(0, 1, 2);
    \m[green]// Create a unique_ptr to an array of 5 elements\m[]
    std::unique_ptr<Foo[]> v3 = std::make_unique<Foo[]>(5);
   
    std::cout << "make_unique<Foo>():      " << *v1 << '\\n'
              << "make_unique<Foo>(0,1,2): " << *v2 << '\\n'
              << "make_unique<Foo[]>(5):   " << '\\n';
    for (int i = 0; i < 5; i++) {
      std::cout << "     " << v3[i] << '\\n';
    }
  }
.R

Create a program that defines \fCmake_unique()\fR and
in main, use \fCmake_unique()\fR to add a \*[c]vector<string>\*[r]
on the heap.  
Add a few strings to the vector and print them using a \fCrange-for\fR loop.


.RE

.bp
.so reflection.ms

