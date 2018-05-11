
.TL
.gcolor blue
I/O streams

and

Serialization
.gcolor
.LP
.ce 1
Week 15
.SS Overview
.IT Definitions
.IT Saving state
.i1 Object graph
.IT Serialization
.i1 Techniques
.i1 Third-party libraries
.IT Security issues
.SS Serialization: What is it?
.IT Convert an object into a byte stream
.i1 Byte sequence
.IT Destinations
.i1 Write to file
.i1 Transmit across network
.i1 Store in database
.IT Recall from Monday
.i1 All the way down, it's just bytes
.IT Some language have a serialization library built in
.i1 Java is a notable example
.i1 C++ does not
.SS Saving State
.IT What is the 'state' of an object?
.i1 Primitives
.i1 What if an object 'HAS-A' \*[c]class\*[r] as a member
.i2 And that class has one, and so on ...
.IT How to ensure the objects reconstituted
.i1 Are faithful replicas of the originals?
.IT This is a 'simple' variation of our 'deep copy' problem
.i1 Except the copies are much father away from the originals
.i2 Might be on a different computer
.i2 Or on the same computer at a much later time
.i3 In a different instance of the application
.i1s
Given any class with non-trivial members
.CW
  class Car {
    Engine mopar;
    array<unique_ptr<Tire>, 4> wheels;
  };
.R
.i1e
.SS Object Graph
.IT The 'object graph' is not an actual picture
.i1 The relationships between objects form a 'graph-like data structure'
.i2 Each object instance is a node on the graph
.i2 Each relationship is an edge on the graph
.i3 Inheritance, Composition, Association, or Dependency
.PSPIC images/object-graph.eps 9.0
.bp
.IT All objects referenced by a serialized object must be serialized
.i1 i.e. Serialization saves the entire object graph
.i1 How do we know this must be true?
.SS Serialization 
.IT Ultimately data currently in memory needs to be transformed
.i1 Into a byte sequence.

.IT When data is written, we use the term \fBserialize\fR
.i1 One or more objects are transformed to bytes

.IT When data is read, we use the term \fBdeserialize\fR
.i1 Bytes are transformed to one or more objects

.SS Techniques
.IT This is C++.  As always, you have options
.IT Manual
.i1 Write your own functions
.i1 Can (de)serialize as either text or binary data
.i2 There are pros and cons to each approach
.IT Use a library
.i1 Boost::Serialization
.i1 Google Protocol Buffers
.SS Manual Serialization
.IT Obviously there as many options here as there are ways to write bytes in C++
.i1s
Using standard C one could literally use \*[c]memcpy\*[r]
.CW
  \m[green]// dest is a pointer\m[]
  \m[green]// "Serialize"\m[]
  memcpy(dest, &my_struct, sizeof(MyStruct)));
 
  \m[green]// "Deserialize"\m[]
  memcpy(&my_struct, dest, sizeof(MyStruct)));
.R
.i1e
.IT The primary weakness here is that \*[c]memcpy\*[r] is always
.i1 A \fBshallow\fR copy
.IT You can pick your data apart and send it piece by piece
.i1 Multiple \*[c]memcpy\*[r] calls
.IT Or convert everything to a string
.i1 Define a \*[c]char\*[r] separator
.i2 Need a way to determine when strings end
.SS Basic serialization
.IT C++ provides more tools than \*[c]memcpy\*[r]
.IT Simple case
.i1 Objects not part of an inheritance hierarchy
.i1 Add \fCserialize() / deserialize()\fR functions to each class
.i1 Serialize should accept, modify, and return an \*[c]ostream\*[r]
.i2 Same basic pattern as \*[c]operator<<\*[r]
.i1 Consider adding a version number parameter
.i2 Provides an ability to handle future changes to your class
.i2 The version number needs to be a serialized class member
.IT Remember to create a way from keeping members from 'running together'
.i1 Serializing two \*[c]int\*[r]s, '3' and '5', vs. '35'
.i2 Use a separator, \fC'3:5'\fR, \fC'35'\fR, etc.
.i2 A length property is more general approach that works with strings too
.i3s
But is a bit more complicated
.br
\0read in pairs of data, where each pair is <int, char*>
.br
\0int is the number of characters to read in
\0char* is the sequence of characters to read
.CW
  \m[red]1\m[]:3:\m[red]1\m[]:5:\m[red]2\m[]:35:\m[red]13\m[]:hello, world!
.R
.i3e
.SS Serializing an inheritance hierarchy
.IT What if our \fCCar\fR class was abstract?
.i1 Or if it was derived from a \fCVehicle\fR class with \fCTruck\fR, etc. as potential siblings?

.IT You need to write out the class type
.i1 So you can create the correct class when deserialized
.IT Basic recipe
.i1s
Add a pure virtual function in your base class to create an instance from an \*[c]istream\*[r]
and a constructor to go along with it:
.CW
  Vehicle::create(std::istream& istr) = 0;

  \m[green]// and in Car \m[]
  create(istream& istr) { return new Car(istr); }
  Car(istream& istr) { 
    \m[green]// fill Car members from stream \m[]
  }
.R
.i1e
.i1 Create a \*[c]map<string, Vehicle*>\*[r]
.i2s
This allows you to associate a string read in during deserialization 
.br
\0with the correct \fCcreate()\fR
.i2e
.SS Serialization and pointers
.IT This problem is very similar to the 'deep copy' pointer lab
.i1 Key is to copy the object pointed to
.i2 The pointer is meaningless after serialization
.IT For simple cases, order doesn't matter
.i1 Ensure serialize and deserialize work on the object graph in the same order
.i1 Remember children might == \*[c]nullptr\*[r]
.IT What is a 'simple case?'
.i1 If your object graph contains cycles or joins
.i2 \m[red]cycle\m[]: a path from an object leads back to itself
.i2 \m[red]join\m[]: more than 1 path to the same object
.i1 Then yours is not a simple case

.IT Consider using a third-party serialization library
.SS Third-party libraries
.IT They exist, because we don't want to manually serialize our own data all the time
.i1 Typically well-tested for complex (non-simple) cases
.i1 Tedious to roll our own
.i2 And error prone
.IT There are \fBmany\fR to choose from
.i1 I'm listing just a couple of samples that I have used
.SS Boost
.IT Mature, portable, flexible 
.IT Prefer if already using boost elsewhere
.IT Basic usage
.i1s
Add the following to a class
.CW
  #include <iostream>
  #include <vector>
  #include <fstream>
  #include <boost/serialization/access.hpp>
  \m[green]// required if serializing unique_ptr members\m[]
  #include <boost/serialization/unique_ptr.hpp>

  \m[green]// required if serializing vector/array members\m[]
  #include <boost/serialization/vector.hpp>

  \m[green]// or binary_oarchive and iarchive \m[]
  #include <boost/archive/text_oarchive.hpp>
  #include <boost/archive/text_iarchive.hpp>
.bp
  class Car {
    public:
      Car() = default;
      \m[green]// more public functions\m[]
    private:
      \m[green]// Allow boost to access non-public members\m[]
      friend class boost::serialization::access;
      \m[green]// from boost::archive \m[]
      template<class Archive>
      void serialize(Archive & ar, 
                     const unsigned int version) {
        \m[green]// list members to serialize\m[]
        \m[green]// assumes mopar & wheels are serializable\m[]
        ar & mopar;    
        ar & wheels;
      }
      Engine mopar;
      array<unique_ptr<Tire>, 4> wheels;
  };
.R
.i1e
.bp
.IT And use it like this
.i1s
If serializing to / from text
.CW
   Car myCars;
 
  \m[green]// Serialize to a file\m[]
  std::ofstream ofs("car.ser");
  boost::archive::text_oarchive oa(ofs);
  oa << myCars;
   
  \m[green]// Deserialize from file\m[]
  {
    std::ifstream ifs("car.ser");
    boost::archive::text_iarchive ia(ifs);
    ia >> myCars;
  }
.R
.SS Google Protocol buffers
.IT Simple API allows simple definitions distinct from class
.i1 Compact and efficient
.IT Uses an \fCIDL\fR (interface design language)
.i1s
To specify serialization interface in a language independent way
.CW
  message Car {
    required uint32 year = 1;
    required string vin = 2;
    required Engine mopar = 3;

    message Tire {
      required string brand = 1;
      required double cost = 2;
    }
    repeated Tire tires = 4;
  }
.R
.i1e
.i1 Requires a custom compiler
.SS Security issues
.IT You potentially expose all private data
.i1 Your private data is no longer private
.i1 Private data is now potentially part of your public API
.IT Data altered in transit
.i1 Which could violate your class invariants

.SS Other concerns
.IT Most other concerns are simply new ways to write bugs
.i1 New types of bugs introduced
.i2 Type errors 
.i2 New buffer overflows

.IT Maintenance issues
.i1 Need to support serializing old versions of a class
.i2 class serialization version ID's
.i1 Increased test burden
.SS Summary
.IT Object graph
.IT Serialization
.i1 Techniques
.i1 Third-party libraries
.i2 Lastly, I would really like to get around to using Cereal one day
.i3 It's on my todo list
.i3 http://uscilab.github.io/cereal/
.IT Security issues
.i1 Violating class invariants
.i1 Buffer overflow / type problems

.IT Next steps
.i1 Project #3
.i1 Final Exam

