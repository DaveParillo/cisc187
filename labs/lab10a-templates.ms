.ds CH Lab #10a
.TL
Lab #10a: Templates
.so cover-page.ms

.bp
.NH
Defining a template: 60 minutes \fImaximum\fR
.time_box
.QP
.nr step 1 1
.IP \n[step].
Define \fCtemplate<typename T> struct S { T val; };\fR.
.IP \n+[step].
Add a constructor, so that you can initialize with a \fCT\fR.
.IP \n+[step].
Define variables of types 
 \fCS<int>\fR, 
 \fCS<char>\fR, 
 \fCS<double>\fR, 
 \fCS<string>\fR, and \fCS<vector<int>>\fR; initialize them with values of your choice.
.IP \n+[step].
Read those values and print them.
.IP \n+[step].
Add a function template \fCget()\fR that returns a reference to \fCval\fR.
.IP \n+[step].
Put the definition of \fCget()\fR outside the class.
.IP \n+[step].
Make \fCval\fR private.
.IP \n+[step].
Do 4 again using \fCget()\fR.
.IP \n+[step].
Add a \fCset()\fR function template so that you can change \fCval\fR.
.IP \n+[step].
Replace \fCset()\fR with an \fCS<T>::operator=(const T&)\fR. Hint: Much simpler than §19.2.5.
.IP \n+[step].
Provide \fCconst\fR and non-\fCconst\fR versions of \fCget()\fR.
.IP \n+[step].
Define a function \fCtemplate<typename T> read_val(T& v)\fR that reads from \fCcin\fR into \fCv\fR.
.IP \n+[step].
Use \fCread_val()\fR to read into each of the variables from 3 except the \fCS<vector<int>>\fR variable.

.bp
.NH
Defining and using \fCstd::make_unique<T>()\fB: 60 minutes \fImaximum\fR
.time_box
.QP
Although std::unique_ptr<T>() and std::make_shared<T>() were introduced in C++11,
The  \fCstd::make_unique<T>()\fR tempalte was not introduced until C++14.
But if you find yourself using a compiler that doesn't know about 
\fCstd::make_unique<T>()\fR, you can make it yourself pretty easily.

.CW
  template<typename T, typename... Args>
  std::unique_ptr<T> make_unique(Args&&... args)
  {
      return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
  }

int main()
{
    // Use the default constructor.
    std::unique_ptr<Vec3> v1 = std::make_unique<Vec3>();
    // Use the constructor that matches these arguments
    std::unique_ptr<Vec3> v2 = std::make_unique<Vec3>(0, 1, 2);
    // Create a unique_ptr to an array of 5 elements
    std::unique_ptr<Vec3[]> v3 = std::make_unique<Vec3[]>(5);
 
    std::cout << "make_unique<Vec3>():      " << *v1 << '\n'
              << "make_unique<Vec3>(0,1,2): " << *v2 << '\n'
              << "make_unique<Vec3[]>(5):   " << '\n';
    for (int i = 0; i < 5; i++) {
        std::cout << "     " << v3[i] << '\n';
    }
}
.R

.bp
.so reflection.ms

