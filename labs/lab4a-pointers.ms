.ds CH Lab #4a: Pointers
.so headings.ms
.TL
\*[CH]
.NH
Pointers and arrays: 60 minutes \fImaximum\fR
.time_box
.RS
This exercise is intended to build your understanding of pointers and their relation to arrays. 

.nr step 0 1
.IP \n+[step].
Write a function \*[c]print_array(ostream& os, int* a , int n)\*[r] that writes 
the addresses and values of \*[c]a\*[r] (assumed to have n elements) to \*[c]os\*[r].
.IP \n+[step].
Allocate an \*[c]int\*[r], initialize it to 7, and assign its address to a variable \fBp1\fR.
.IP \n+[step].
Print out the value of \fBp1\fR and of the \*[c]int\*[r] it points to.
.IP \n+[step].
Allocate an array of seven \*[c]int\*[r]s; initialize it to 1, 2, 4, 8, etc.; on the heap
and assign its address to a variable \fBp2\fR.
.IP \n+[step].
Print out the value of \fBp2\fR and of the \*[c]int\*[r] it points to.
.IP \n+[step].
Declare an int* called \fBp3\fR and initialize it with \fBp2\fR.
.IP \n+[step].
Assign \fBp1\fR to \fBp2\fR.
.IP \n+[step].
Assign \fBp3\fR to \fBp2\fR.
.IP \n+[step].
Use \*[c]print_array\*[r] to display all the values of \fBp1\fR, \fBp2\fR, and \fBp3\fR.
.IP \n+[step].
Declare an int* called \fBp4\fR of size 7.
.IP \n+[step].
Copy the values from the array pointed to by p3 into the array pointed to by \fBp4\fR.
.IP \n+[step].
Assign the value stored in \fBp1\fR to the third element of \fBp2\fR.
.IP \n+[step].
Use \*[c]print_array\*[r] to display all the values of \fBp1\fR, \fBp2\fR, \fBp3\fR, and \fBp4\fR.
.IP \n+[step].
Deallocate all the memory you allocated from the heap.
.RE


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
  std::unique_ptr<T> make_unique(Args&&... args)
  {
    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
  }

  int main()
  {
    // Use the default constructor.
    std::unique_ptr<Foo> v1 = std::make_unique<Foo>();
    // Use the constructor that matches these arguments
    std::unique_ptr<Foo> v2 = std::make_unique<Foo>(0, 1, 2);
    // Create a unique_ptr to an array of 5 elements
    std::unique_ptr<Foo[]> v3 = std::make_unique<Foo[]>(5);
   
    std::cout << "make_unique<Foo>():      " << *v1 << '\n'
              << "make_unique<Foo>(0,1,2): " << *v2 << '\n'
              << "make_unique<Foo[]>(5):   " << '\n';
    for (int i = 0; i < 5; i++) {
      std::cout << "     " << v3[i] << '\n';
    }
  }
.R

Create a program that defines \fCmake_unique()\fR and
in main, use \fCmake_unique()\fR to add a \*[c]vector<string>\*[r]
on the heap.  
Add a few strings to the vector and print them using a \fCrange-for\fR loop.


.RE

