.ds CH Lab #10b
.TL
Lab #10b: Exceptions
.so cover-page.ms

.bp
.NH
Exceptions: 60 minutes \fImaximum\fR
.time_box
.QP
.RS
.nr step 1 1
.IP \n[step].
Add an appropriate try block to catch errors associated 
with the allocations in the loop.
.CW
  #include <iostream>
  #include <new>
   
  int main()
  {
    while (true) {
      new int[99999999999ul];  // the bigger this is, the faster it fails
    }
  }
.R


.IP \n+[step].
Add an appropriate try block to catch errors associated with file IO operations.
Display both the exception text and error code.
.CW
  #include <fstream>
  #include <iostream>

  using std::ifstream;

  int main () {
    ifstream file;
    file.open ("not a file.txt");
    while (!file.eof()) {
      file.get();
    }
    file.close();

    return 0;
  }
.R

.IP \n+[step].
Add try blocks to the following code to ensure 
all resources are properly released in all cases 
where an exception might be thrown.
.CW
  void suspicious(vector<char>& v, int s)
  {
    char* p;
    p = new char[s];
    // do something with v and p

    char* q;
    q = new char[s];
    // do something with v and q

    delete[] p;
    delete[] q;
  }
.R

Run all the examples and upload your source when complete.
.RE

.bp
.so reflection.ms

