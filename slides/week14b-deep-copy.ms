
.TL
.gcolor blue
Copying Memory
.gcolor
.LP
.ce 1
Week 14
.SS Overview
.IT Chapter 18 of the text
.IT Copying memory
.IT Rule of 3 / 5 / 0 
.SS Constructors
.IT \fBEvery\fR C++ class defines or deletes
.i1 A default constructor
.i1 A copy constructor
.i1 A copy assignment constructor
.i1 A move constructor
.i1 A move assignment constructor
.i1 A default destructor
.IT If you do not define them
.i1 The compiler will do it for you
.i1 Unless it can't
.i2 See 01-default.cpp in examples
.SS Copy constructors
.IT Create a new class from an existing instance
.IT Called during
.i1 Initialization: \fC T a = b; or T a {b};\fR
.i2 where b is of type T
.i1 Argument passing: \fCfunction argument passing: f(a)\fR
.i2 where \fCa\fR is of type \fCT\fR 
.i1 Function return: return a 
.i2 Inside a function such as \fCT f()\fR, 
.i2 where \fCa\fR is of type \fCT\fR, and \fCT\fR has no move constructor.
.i1s
Copy constructor syntax
.CW
  class_name ( const class_name & )
.R
.i1e
.i1s
Copy assignment operator
.CW
  class_name& class_name :: operator= ( class_name )
.R
.i1e
.SS Move constructors
.IT Create a new class from an existing instance
.i1 And delete the old one
.i1 \fIMove semantics\fR are a C++11 addition
.IT We are moving memory from class a to class b
.IT Called during
.i1 Initialization: \fC T a = std::move(b); or T a(std::move(b));\fR
.i2 where b is of type T
.i1 Argument passing: \fCfunction argument passing: f(std::move(a));\fR
.i2 where \fCa\fR is of type \fCT\fR 
.i1 Function return: return a 
.i2 Inside a function such as \fCT f()\fR, 
.i2 where \fCa\fR is of type \fCT\fR, and \fCT\fR has a move constructor.
.i1s
Move constructor syntax
.CW
  class_name ( class_name && )
.R
.i1e
.i1s
Move assignment operator
.CW
  class_name& class_name :: operator= (class_name &&)
.R
.i1e
.IT Note the parameters aer not \*[c]const\*[r]
.i1 They can't be!
.SS More reading
.IT http://en.cppreference.com/w/cpp/language/copy_constructor
.IT http://en.cppreference.com/w/cpp/language/copy_assignment
.IT http://en.cppreference.com/w/cpp/language/move_constructor
.IT http://en.cppreference.com/w/cpp/language/move_assignment
.SS Copying and moving resources
.IT If you define a class that manages resources
.i1 Pointers, file handles, etc.
.IT Then the implicitly defined functions are probably not what you want
.i1 "Shallow" vs "Deep" copy
.SS Rule of 3 / 5 / 0 
.IT In C++, the basic \fIRule of 3\fR says
.i1s
If a class requires a user-defined destructor, 
.br 
a user-defined copy constructor, 
.br 
or a user-defined copy assignment operator, 
.br 
it almost certainly requires all three.
.i1e
.bp
.IT Rule of 5
.i1 Since C++11: adds \fImove semantics\fR to the language
.IT A user defined constructor, etc. 
.i1 Prevents the creation of implicitly defined move constructors or move assignment operators
.i1 So we need to add two more functions to our \fIRule of 3\fR
.i1 Now we have a rule of 5!
.i2 Failure to implicitly add move semantics are a missed optimization opportunity
.i2 Not a potential error like the rule of 3 mitigates
.bp
.IT Rule of zero
.i1 Limit memory management to as few classes as possible
.i1 Most of your classes should be able to use the compiler defaults
.i2 And you won't have to write any of these functions
.IT Exception: Abstract Base classes
.i1 A base class with a public virtual destructor
.i2 Prevents the declaration of implicitly defined moves and copies
.IT Best practice: Declare them as default explicitly
.CW
  class Base
  {
   public:
      virtual void apply() = 0;

      virtual ~Base()              = default;        
      Base(const Base&)            = default;
      Base(Base&&)                 = default;
      Base& operator=(const Base&) = default;
      Base& operator=(Base&&)      = default;
  };
.R
.SS Summary
.IT Every class defines default constructors and destructors
.i1 Know when they are created (and not)
.i1 And when they are called
.IT Rule of 3 / 5 / 0

