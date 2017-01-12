.ds CH Lab #9b: Templates
.so headings.ms
.TL
\*[CH]
.NH
Defining and using
\*[c] std::make_unique<T>()\*[r]
.B
: 30 minutes \fImaximum\fR
.R
.RS
Although \*[c]std::unique_ptr<T>()\*[r] and \*[c]std::make_shared<T>()\*[r] were introduced in C++11, 
the \*[c]std::make_unique<T>()\*[r] template was not introduced until C++14. 
But if you find yourself using a compiler that doesn't know about \*[c]std::make_unique<T>()\*[r], 
you can make it yourself pretty easily.
.CW
  template<typename T, typename... Args>
  std::unique_ptr<T> make_unique(Args&&... args)
  {
    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
  }

  // exmaple usage in C++14

  int main() {
      // Use the default constructor.
      std::unique_ptr<Foo> v1 = std::make_unique<Foo>();

      // Use the constructor that matches these arguments
      std::unique_ptr<Foo> v2 = std::make_unique<Foo>(0, 1, 2);

      // Create a unique_ptr to an array of 5 elements
      std::unique_ptr<Foo[]> v3 = std::make_unique<Foo[]>(5);

      std::cout << "make_unique<Foo>():      " << *v1 << '\\n'
                << "make_unique<Foo>(0,1,2): " << *v2 << '\\n'
                << "make_unique<Foo[]>(5):   " << '\\n';

      for (int i = 0; i < 5; i++) {
        std::cout << "     " << v3[i] << '\\n';
      } 
  }
.R

.IP 1.
Create a program that defines \fCmake_unique()\fR using the above template. 
.IP 2. 
In main, use \fCmake_unique()\fR to add a \*[c]vector<string>\*[r] on the heap. 
.IP 3.
Add a few strings to the vector and print them using a range-for loop.
.RE

