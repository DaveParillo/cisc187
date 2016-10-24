
.TL
.gcolor blue
Copying Memory
.gcolor
.LP
.ce 1
Week 9
.SS Overview
.IT Midterm results
.IT Copying memory
.IT Rule of 3 / 5 / 0 
.IT Recursion (briefly)
.SS Constructors
.IT \fBEvery\fR C++ class defines
.i1 A default constructor
.i1 A copy constructor
.i1 A copy assignment constructor
.i1 A default destructor
.IT If you do not define them
.i1 The compiler will do it for you
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
.IT Expception: Abstract Base classes
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
.SS Recursion
.IT My expectation is this is a 'reminder'
.i1 Consider reviewing your first semester text

.IT A text definition
.i1 A statement defined in terms of itself
.i1 For example,
.i2 An \fBIinteger literal constant\fR is either
.i3 A digit (one of 0,1,2,3,4,5,6,7,8,9), or
.i3 A digit followed by a \fBinteger literal constant\fR
.IT A math definition
.i1s
The N\*{th\*} Fibonacci number
.EQ
F sub n = F sub {n-1} + F sub {n-2} roman {", with "} F sub 1 = 1, F sub 2 = 1
.EN
.i1e
.IT A software definition
.i1 Any method that calls itself
.SS Definitions
.IT Recursive functions are not infinite loops
.i1 Base case
.i2 Provides final conditions
.i2 Values for which no recursion required
.i2 Prevents the definition from being completely circular
.i3 \fCF1 = 1, F2 = 1\fR
.i1 Recursive case
.i2 Implements the definition of the recursion
.i2 Typically a simple algorithm
.i2 Calls itself as part of the algorithm
.SS Recursive functions
.IT Two flavors
.IT Directly recursive
.i1 Function A calls A
.CW 
  long factorial(int n) {
    if (n == 1) return 1;
    return n * factorial (n-1);
  }
.R
.IT Indirectly recursive
.i1 Function A calls B (which calls C), which  calls A
.i2 Use sparingly!
.SS Usefulness
.IT Recursion is useful because it is often the simplest solution to a problem
.IT Aids in analysis
.IT It is often neither the most time or space efficient solution!
.IT But some compilers can create an iterative function form the recursive source
.i1 Typically the function needs to be \fItail recursive\fR
.i1 That is, the recursive call is the last line of the function

.SS When to use recursion
.IT Given some problem, \fIP\fR
.IT If there is a smallest problem of type \fIP\fR
.i1 Can solve directly and trivially
.i1 This is your base case
.IT For problems larger than the smallest type
.i1 Can the problem be broken into a smaller version of the same type of problem as \fIP\fR?
.i1 It \fBmust\fR approach the base case
.i1 This is your recursive case

.SS Recursion and iteration
.IT Recursion and iteration are equivalent
.i1 Any while loop 
.IT can be rewritten as a recursive function
.IT Any recursive function
.i1 Can be rewritten as a while loop
.IT Trade-offs
.i1 Recursive functions can be easier to write and understand
.i1 Fibonacci sequence, Towers of Hanoi, Grammar / Syntax checking
.IT Recursive solutions are (almost) guaranteed to use more memory and run more slowly
.i1 Some recursive solutions are impossible due to stack space limits
.i1 This 'rule' is language dependent (i.e. Scala, Smalltalk, LISP)
.IT Rule of thumb
.i1 If the recursive function is easy to write, use it
.i1 If time and space costs are important
.i2 Take the extra time to write an iterative equivalent
.SS Summary
.IT Every class defines default constructors and destructors
.i1 Know when they are created (and not)
.i1 And when they are called
.IT Rule of 3 / 5 / 0
.IT Recursion
.i1 May be required in a copy constructor
.i1 Base and recursive case
.i1 Recursion vs iteration

