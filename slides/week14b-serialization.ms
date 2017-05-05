
.TL
.gcolor blue
I/O streams

and

Serialization
.gcolor
.LP
.ce 1
Week 14
.SS Overview
.IT Review chapters 10 and 11
.i1 For basic File I/O and formatting I/O
.i1 The textbook does not have much to say about object serialization
.i2 Other than it's a byte stream, which is true
.IT Fundamental I/O concepts
.IT Files
.i1 Opening
.i1 Reading and writing streams 
.IT I/O errors
.IT Reading a single integer
.IT Serialization


.SS Input and Output
.IT Input
.PS
boxwid = 2
boxht = .75

A: box "input" "device"
arrow
B: box "device" "driver"
arrow
C: box "input" "library"
arrow
D: box "your" "program"
.PE

.IT Output
.PS
boxwid = 2
boxht = .75

A: box "your" "program"
arrow
B: box "output" "library"
arrow
C: box "device" "driver"
arrow
D: box "output" "device"
.PE



.SS The stream model
.PS
boxwid = 2
boxht = .7

A: box "'hello'"
B: box "-1234" with .n at A.s + (0, -1.0)
C: box "Foo" wid .7  with .n at B.s + (0, -1.0)
D: box fill 0.4 ht 1.2 "ostream" with .w at B.e + (1.0, 0)
E: box "buffer" with .n at D.s + (0.5, -1.0)
F: box "'output'" with .s at E.n + (2.5, 0.5)

arrow from A.e to D.w
arrow from B.e to D.w
arrow from C.e to D.w

arrow from D.s to E.n
arrow from E.e to F.s

.PE
.IT An ostream
.i1 turns values of various types into character sequences
.i1 sends those characters somewhere
.i2 Examples: console, file, main memory, another computer

.PS
boxwid = 2
boxht = .7

A: box "'hello'"
B: box "-1234" with .n at A.s + (0, -1.0)
C: box "Foo" wid .7  with .n at B.s + (0, -1.0)
D: box fill 0.4 ht 1.2 "istream" with .w at B.e + (1.0, 0)
E: box "buffer" with .n at D.s + (0.5, -1.0)
F: box "'input'" with .s at E.n + (2.5, 0.5)

arrow to A.e from D.w
arrow to B.e from D.w
arrow to C.e from D.w

arrow to D.s from E.n
arrow to E.e from F.s

.PE
.IT An istream
.i1 turns character sequences into values of various types
.i1 gets those characters from somewhere
.i2 Examples: console, file, main memory, another computer
.IT Reading and writing
.i1 Of typed entities
.i2 << (output) and >> (input) plus other operations
.i2  Type safe
.i2 Formatted
.i1 Typically stored (entered, printed, etc.) as text
.i2 But not necessarily (see binary streams in chapter 11)
.i1 Extensible
.i2 You can define your own I/O operations for your own types
.i1 A stream can be attached to any I/O or storage device
.SS Files
.IT We turn our computers on and off
.i1 The contents of our main memory is transient
.IT We like to keep our data
.i1 So we keep what we want to preserve on disks and similar permanent storage
.IT A file is a sequence of bytes stored in permanent storage
.i1 A file has a name
.i1 The data on a file has a format
.IT We can read/write a file if we know its name and format
.SS File structure
.IT Fundamentally, a file is a byte sequence
.i1 Numbered from 0 

.SS File structure
.IT Fundamentally, a file is a \fBbyte sequence\fR
.i1 Numbered from 0 increasing until to the end of file marker is reached
.PS
boxht = 0.5
boxwid = 0.5
A: box
B: box
C: box
D: box wid 3 dashed
E: box
F: box
G: box
H: box
"0:" with .s at A.n + (0,0.3)
"1:" with .s at B.n + (0,0.3)
"2:" with .s at C.n + (0,0.3)
"EOF" with .s at H.n + (0,0.3)
.PE
.IT Note that even simple numbers are multi-byte things
.i1 Bytes are interpreted by some program
.i1 Using shared understanding of a \fIfile format\fR
.i1 This is often established by convention for 'plain text'
.i2 ASCII text
.i1 Binary data files (non-text bytes) are usually custom file formats
.SS Files
.IT To read a file
.i1 Must know its name
.i1 Must be able to open the file for reading
.i1 Read file contents
.i1 Close file
.IT To write a file
.i1 Must provide a name (if writing to a disk file system)
.i1 Must be able to open the file for writing
.i2 Or create a new file
.i1 Write file contents
.i1 Close file
.SS Reading a file
.RS
\s-8
.CW
  #include <fstream>
  #include <iostream>
  #include <string>

  int main()
  {
    std::cout << "Please enter input file name: ";
    std::string iname;
    std::cin >> iname;
    std::ifstream ist {iname}; \m[green]// declare 'input stream from a file'\m[]
                               \m[green]// ifstream has a name string\m[]
                               \m[green]// opens the named file for reading\m[]
    if (!ist) {
      std::cerr << "can't open input file " << iname;
    }
    return 0;
  }
.R
.RE
.SS Writing a file
.RS
\s-8
.CW
  #include <fstream>
  #include <iostream>
  #include <string>

  int main()
  {
    std::cout << "Please enter output file name: ";
    std::string oname;
    std::cin >> oname;
    std::ofstream ofs {oname}; \m[green]// declare 'output stream to a file'\m[]
                               \m[green]// ofstream has a name string\m[]
                               \m[green]// opens the named file for writing\m[]
    if (!ofs) {
      std::cerr << "can't open output file " << iname;
    }
    return 0;
  }
.R
.RE
.SS Reading from a file
.IT Suppose a file contains a sequence of pairs representing hours and temperature readings
.RS
.CW
  0 60.7
  1 60.6
  2 60.3
  3 59.22
.R
.RE
.IT The hours are numbered 0..23
.IT No further format is assumed
.i1 Maybe we can do better than that (but not just now)
.IT Termination
.i1 Reaching the end of file terminates the read
.i1 Anything unexpected in the file terminates the read
.i2 E.g., q
.bp
.RS
\s-8
.CW
  struct Reading {	\m[green]// a temperature reading\m[]
    int hour;	\m[green]// hour after midnight [0:23]\m[]
    double temperature;
  };

  vector<Reading> temps;	\m[green]// to store the readings\m[]

  int hour;
  double temperature;
  while (ist >> hour >> temperature) {            \m[green]// read\m[]
    if (hour < 0 || 23 <hour) {                   \m[green]// check\m[]
      std::cerr << "hour out of range";
    }
    temps.push_back( Reading{hour,temperature} );	\m[green]// store\m[]
  }
.R
.RE
.SS Handling I/O errors
.IT Sources of errors
.i1 Human mistakes 
.i1 Files that fail to meet specifications
.i1 Specifications that fail to match reality
.i1 Programmer errors
.i1 Something else

.IT \*[c]iostream\*[r] reduces all errors to one of four states
.i1 \*[c]good()	\m[black]// the operation succeeded\*[r]
.i1 \*[c]eof()	\m[black]// we hit the end of input ("end of file")\*[r]
.i1 \*[c]fail()	\m[black]// something unexpected happened\*[r]
.i1 \*[c]bad()	\m[black]// something unexpected and serious happened\*[r] \m[]
.SS Integer read failures
.IT Bad character
.i1 1 2 3 4 5 x
.i1 Character 'x' is not valid
.i1 State is \*[c]fail()\*[r]
.IT Format error
.i1 1 2 3 4 5.6
.i1 Double '5.6' is not an int
.i1 State is \*[c]fail()\*[r]
.IT Reached the end of file
.i1 1 2 3 4 5 EOF
.i1 1 2 3 4 5 (CTRL-Z character in Windows)
.i1 1 2 3 4 5 (CTRL-D character in Linux/Mac)
.i1 State is \*[c]eof()\*[r]
.IT Something even worse than failure
.i1 Disk format error
.i1 State is \*[c]bad()\*[r]
.IT See example code

