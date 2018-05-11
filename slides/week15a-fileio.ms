
.TL
.gcolor blue
I/O streams
.gcolor
.LP
.ce 1
Week 15
.SS Overview
.IT Review chapters 10 and 11
.i1 For basic File I/O and formatting I/O
.i1 The textbook does not have much to say about object serialization
.i2 Other than it's a byte stream, which is true
.IT Fundamental I/O concepts
.IT Files
.i1 Opening
.i1 Reading and writing streams 
.IT Serialization
.SS The stream model
.IT We have been using these all semester
.i1 \*[c]std::cin\*[r] and \*[c]std::cout\*[r] 
.i1 Overloading \*[c]operator<<\*[r] and \*[c]operator>>\*[r]
.PS 6
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
.SS Text vs Binary
.IT Text files are traditionally encoded using ASCII
.i1 Assigns a symbol to each byte in the range 0 - 127
.i2 On buffy, type \fCman ascii\fR
.i1 Other encodings exist (EBDIC, Unicode)
.IT Binary data has no 'universal standard'
.i1 aka 'unformatted file I/O'
.i1 Bytes are bytes
.i1 How you choose to interpret them is up to the designer
.IT The number 123 can be stored any number of ways
.i1s
Writing the \fC\m[blue]int\m[] 123\fR in binary mode
is literally:
.CW
  0111 1011
.R
.i1e
.i1 which are the bits associated with the number
.i1s
The bits can be printed using the \fChexdump\fR program
.CW
  $ xxd -b test.bin 
    0000000: 01111011 00000000
.R
.i1e
.bp
.i1s
The value \m[blue]123\m[], ASCII encoded 
.CW
  \m[green]using 'octal dump'\m[]
  $ echo 123| od -X       \m[green]// hex\m[]
    0000000          0a333231
  $ echo 123| od -b       \m[green]// octal bytes\m[]
    0000000   061 062 063 012

  \m[green]using 'hexdump dump'\m[]
  $ echo 123| xxd         \m[green]// hex\m[]
    0000000: 3132 330a
  $ echo 123| xxd -b      \m[green]// binary\m[]
    0000000: 00110001 00110010 00110011 00001010 
.R
.i1e
.bp
.IT Use text when you can
.i1 Size considerations aren't what they were 40 years ago
.i1 Easy to 'bench test' (you can read it)
.i1 A portable encoding already exists
.i1 Anything can be converted to text
.i2 \fCxxd\fR
.i2 \fCuuencode\fR, \fCuudecode\fR
.IT Use binary when you must
.i1 image files, audio, video
.SS Reading from ASCII files
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
.SS I/O modes
.IT Files are manipulated in one or more \fBmodes\fR
.i1s
\*[c]ifstream\*[r] is open for reading by default
.CW
  std::ifstream ifs1(fname);  \m[green]// same as next line\m[]
  std::ifstream ifs2(fname, ios_base::in);
.R
.i1e
.i1s
\*[c]ofstream\*[r] is open for writing by default
.CW
  std::ofstream ofs1(fname);  \m[green]// same as next line\m[]
  std::ofstream ofs2(fname, ios_base::out);
.R
.i1e
.IT With a \*[c]fstream\*[r], you must specify \fC::in\fR, \fC::out\fR, or both
.bp
.IT \fCios_base::app    \m[green]// append output to end of file\m[]\fR
.IT \fCios_base::ate    \m[green]// at end: open file and seek to end\m[]\fR
.IT \fCios_base::binary \m[green]// binary mode: filesystem dependent\m[]\fR
.IT \fCios_base::in     \m[green]// open file for read at byte 1\m[]\fR
.IT \fCios_base::out    \m[green]// open file for write at byte 1\m[]\fR
.IT \fCios_base::trunc  \m[green]// set file length = 0\m[]\fR
.SS Mode examples
.IT Modes can be combined to form compound behaviors
.i1s
This \*[c]ifstream\*[r] is open for reading and writing
.CW
  \m[green]// use the 'bitwise or' operator to combine modes\m[]\fR
  std::ifstream fs("file.txt", ios_base::in|ios_base::out);
.R
.i1e
.i1s
Write to the end of a binary data file
.CW
  std::fstream fs(fname, ios::out|ios::binary|ios::ate);
.R
.i1e
.SS Binary File I/O
.IT Functions to read and write a single int
.i1s
About the simplest thing that will work
\s-4
.CW
  void write_binary(int& x, const std::string& fname) {
    using std::ios;
    std::ofstream fileout(fname, ios::binary);

    fileout.write(reinterpret_cast<char *>(&x), sizeof(int));
    fileout.close();
  }

  void read_binary(int& x, const std::string& fname) {
    using std::ios;
    std::ifstream filein(fname, ios::binary);

    filein.read(reinterpret_cast<char *>(&x) ,sizeof(int));
    filein.close();
  }
.R
.i1e
.SS Summary
.IT Fundamental I/O concepts
.i1 Stream model
.IT Files
.i1 Opening
.i1 Reading and writing streams 
.IT I/O errors & modes
.IT Binary file I/O

.IT Wednesday
.i1 Object Serialization
