
.TL
.gcolor blue
Iterator adapters and friends
.gcolor
.LP
.ce 1
Week 9
.SS Overview
.IT Iterator adaptors
.IT Stream iterators
.IT Iterator operations
.IT Non-member functions
.SS Iterator adaptors
.IT Alter the behavior of an iterator
.IT reverse iterator
.i1 adaptor that reverses the direction of a given iterator
.i1 The standard containers provide \*[c]rbegin\*[r] and \*[c]rend\*[r] member functions
.IT back-insert iterator
.i1 \*[c]std::back_insert_iterator\*[r] is an OutputIterator 
.i1s
appends to a container for which it was constructed
.CW
  #include <iterator>
  #include <vector>
  using std::vector;
     
  int main() {
    \m[red]vector<int>\m[] \m[green]nums\m[];
    \m[blue]std::back_insert_iterator\m[]<\m[red]vector<int>\m[]> it(\m[green]nums\m[]);
     
    for (int i=0; i<10; ++i) {
      it = i; // calls nums.push_back(i)
    }
  }
.R
.i1e
.bp
.IT back-insert iterator
.i1 Note that \*[c]operator*\*[r] and \*[c]operator++\*[r] do nothing!

.IT While using back-insert iterator directly works
.i1s
It's more convenient to use the \*[c]back_inserter\*[r] function
.CW
    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    \m[green]//func takes an iterator and a value\m[]
    func(std::back_inserter(v), -1);

.R
.i1e
.SS Stream iterators
.IT Recall an iterator is an abstraction of a pointer
.i1 And anything can be pointed to
.i2 So why not a stream?
.i2 Think of a stream as a sequence of bytes
.IT An output iterator lets you point to an output stream
.i1s
Create an ostream_iterator using a template
.CW
  ostream_iterator<int>(cout, ", ");
.R

The optional second argument defines a delimiter
.i1e
.i2 The delimiter is written after each output operation
.IT Using iterators 'the hard way'
.i1s
Manually write, increment, write...
.CW
  ostream_iterator<string> it(cout);

  *it = "Hello, ";  \m[green]// aka cout << "Hello, "\m[]
  ++it;             \m[green]// increment output pointer\m[]
  *it = "world!\\n"; \m[green]// aka cout << "world!\\n"\m[]
.R
.i1e
.bp
.IT The 'hard way' works
.i1 But it's not the most typical use of these iterators
.IT Input and output interators are frequently used with algorithms
.i1s
Write a vector to standard output
.CW
  vector<int> v {3, 1, 4, 1, 5, 9}
  ostream_iterator<int> it( cout, ", " );
  copy( v.begin(), v.end(), it );
.R
.i1e
.bp
.IT The default constructed stream iterator 
.i1 Is the \*[c]end of stream\*[r] iterator
.i1 It serves the same function as \*[c]end\*[r]
.i2 which is 'one past the end' of the iterator sequence 
.i1s
Used to define a range just like any other iterator using \*[c]begin()\*[r] and \*[c]end()\*[r]
.CW
  int main() {
    \m[green]// open 2 file streams\m[]
    ifstream data("data.txt");
    ofstream sorted("sorted.txt");
    if (!data || !sorted) {
      cout << \m[green]"Problem opening files\\n"\m[];
      return -1;
    }
.bp
    \m[green]// define our 'begin' and 'end' iterators\m[]
    \m[green]// on the input stream\m[]
    istream_iterator<string> is_itr(data);
    istream_iterator<string> eof;

    vector<string> words;
    copy(is_itr, eof, back_inserter(words));
    sort(words.begin(), words.end());

    ostream_iterator<string> os_itr(sorted, "\\n");
    copy(words.begin(), words.end(), os_itr );
  }
.R
.i1e

.i1s
Or fill a vector from standard input
.CW
  copy( istream_iterator<int>( cin ),
        istream_iterator<int>(),   \m[green]// <-- note "()"\m[]
        back_inserter( v ) );
.R
.i1e

.SS Iterator operations
.IT Allow operations other than \*[c]operator--\*[r] or \*[c]operator++\*[r], for example
.IT \*[c]std::advance\*[r]
.i1s
Move an iterator forward
.CW
  std::vector<int> v {3,1,4,1,5,9,2,6,5,3 };
  auto it = v.begin();
  std::advance(it, 7); \m[green]//move it forward 7 places\m[]
.R
.i1e
.i1 \*[c]std::next\*[r] think of it as a wrapper around \*[c]std::advance\*[r]
.i2 Returns the iterator position
.IT \*[c]std::distance\*[r]
.i1 Return the distance between two iterators
.SS Non-member functions
.IT Provide a consistent interface for containers, plain arrays, and std::initializer_list.
.IT \*[c]std::begin\*[r] and \*[c]std::cbegin\*[r]
.IT \*[c]std::end\*[r] and \*[c]std::cend\*[r]
.i1s
Use a raw array or a vector both in an iterator like way
.CW
#include <iostream>
#include <vector>
#include <iterator>
 
int main() {
    std::vector<int> v = { 3, 1, 4 };
    auto vi = std::begin(v);
    std::cout << *vi << '\\n'; 
 
    int a[] = { -5, 10, 15 };
    auto ai = std::begin(a);
    std::cout << *ai << '\\n';
}
.R
.i1e
.SS Summary
.IT Iterator adaptors
.IT Stream iterators
.IT Iterator operations
.IT Non-member functions

