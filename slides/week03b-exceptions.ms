
.TL
.gcolor blue
Exceptions
.gcolor
.LP
.ce 1
Week 3
.SS Overview
.IT Exceptions
.i1 When to use them
.i1 When not to use them
.i1 Writing idiomatic C++
.SS Exceptions
.IT Basic anatomy of an exception
.i1s
Surround using \*[c]try\*[r] and \*[c]catch\*[r] block 
.CW
  try {
    // execute potentially dangerous statements
  } 

  // catch a specific class of exceptions
  catch (const std::exception& e)
  {  
    std::cout << "Exception occurred.\\n";
    std::cout << "Details: " << e.what() << std::endl;
  }
.R
.i1e
.i1 If you specify a \*[c]try\*[r], you must include at least 1 \*[c]catch\*[r] 
.i1 Passing catch parameters by const reference is considered a best practice
.SS Using exceptions
.IT std::exception.what()
.i1 Returns a description of what caused the error


.IT More than one \*[c]catch\*[r] block is acceptable
.i1s
The special catch
.CW
  catch (...)     // catch any exception
.R
.i1e
.SS Standard exceptions
.IT The standard exceptions in C++ are organized in a class hierarchy
.i1 \*[c]std::exception\*[r] is the base class for all exceptions
.i1 Children of \*[c]std::exception\*[r] 
.i2 \*[c]std::bad_alloc\*[r]: thrown by \*[c]new\*[r] and other memory allocation errors 
.i2 \*[c]std::bad_cast\*[r]: thrown by \*[c]dynamic_cast\*[r] and similar
.i2 \*[c]std::bad_typeid\*[r]: thrown by \*[c]typeid\*[r]  
.i2 \*[c]std::bad_exception\*[r]: runtime unexpected or pointer exceptions
.i2 \*[c]std::logic_error\*[r]: exceptions that \fIshould\fR be detected by reading the code 
.i2 \*[c]std::runtime_error\*[r]: exceptions that theoretically can't be detected by reading the code
.i2 \*[c]std::logic_error\*[r], and \*[c]std::runtime_error\*[r] are also exception bases
.i1 Children of \*[c]std::logic_error\*[r]
.i2 \*[c]std::domain_error\*[r]: invalid mathematical domain
.i2 \*[c]std::invalid_argument\*[r]: bad parameters or arguments used
.i2 \*[c]std::length_error\*[r]: Thrown when a std::string is too large
.i2 \*[c]std::out_of_range\*[r]: Used for range checked access, vector.at(x)
.i1 Children of \*[c]std::runtime_error\*[r]
.i2 \*[c]std::overflow_error\*[r]: mathematical overflow
.i2 \*[c]std::range_error\*[r]: Thrown when storing an out of range value
.i2 \*[c]std::underflow_error\*[r]: mathematical underflow
.SS Using exceptions
.IT C++ exceptions are designed to support \fIerror handling\fR
.i1 Use \*[c]throw\*[r] only to signal an error 
.i1 Use \*[c]catch\*[r] only to specify error handling actions when 
.i2 You know you can handle it 
.i3 Possibly by translating it to another type and rethrowing an exception of that type
.i3 Such as catching a bad_alloc and rethrowing a no_space_for_file_buffers
.IT \fBDo not\fR use throw to catch a coding error in usage of a function. 
.i1 Use assert or other mechanism to either send the process into a debugger 
.IT \fBDo not\fR use throw if you discover unexpected violation of an invariant of your component
.i1 Use assert or other mechanism to terminate the program 
.i1 Throwing an exception will not cure memory corruption and may lead to further corruption of important user data.
.IT Use \*[c]try\*[r] and \*[c]catch\*[r] block 
.i1 If the logic is more clear than checking a condition and \*[c]return\*[r]ing a value
.bp
.IT Use \*[c]try\*[r] and \*[c]catch\*[r] block 
.i1s
If you \fBneed\fR to propagate errors several levels up the stack
\s-8
.CW
  void f1() {
    try {
      f2();
    } catch (const some_exception& e) {
      // ... handle error
    }
  }
  void f2() { ...; f3(); ...; }
  void f3() { ...; f4(); ...; }
  void f4() { ...; f5(); ...; }
  void f5()
  {
    if ( /*...some error condition...*/ )
      throw some_exception();
  }
.R
\s+8

Only the code that detects the error, \fCf5()\fR, 
and the code that handles the error, \fCf1()\fR, have any clutter
.i1e
.IT Do not use \*[c]try\*[r] blocks to reclaim resources
.i1 This is a Java technique
.i1 Great for java, not needed in C++
.i1 In C++, use RAII
.i2 Use destructors to clean up resources
.IT Do not use \*[c]try\*[r] blocks as a proxy for error return codes
.i1 Results in too many \*[c]try\*[r] blocks cluttering up functions
.i2 Harms readability if nothing else
.SS IO Exception notes
.IT\*[c] std::basic_ios::exceptions\*[r]
.i1 Gets and sets the exception mask of the stream. 
.i1 The exception mask determines which error states, 
.i2 in the stream will throw an exception of type failure.
.i1s
Example:
.CW
  std::ifstream ifs("in.txt");
  ifs.exceptions(std::ifstream::failbit);
.R
At this point, only the \fCfailbit\fR will trigger an exception.
.i1e
.IT IO Streams throw ios_base::failure
.IT Since C++11 this class inheritance changed
.i1 Inherits from std::system_error
.i1s
Adds an \fCerror_code\fR member to the exception object
.CW
catch (const ios_base::failure& e)
  {  
    std::cout << "I/O exception occurred.\\n";
    std::cout << "Details: " << e.what() << std::endl;
    std::cout << "Code: " << e.code() << std::endl;
  }
.R
.SS Sumamry
.IT Exceptions
.IT When to use them
.IT When not to use them
.IT Writing idiomatic C++
.IT Changes related to IO stream exceptions

