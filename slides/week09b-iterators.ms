
.TL
.gcolor blue
Containers and Iterators
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
     
    int main() {
        std::vector<int> nums;
        std::back_insert_iterator< std::vector<int> > it(nums);
     
        for (int i=0; i<10; ++i) {
            it = i; // calls nums.push_back(i)
        }
    }
.R
.i1e
.i1 \*[c]operator*\*[r] and \*[c]operator++\*[r] do nothing!
.i1s
It's more convenient to use the \*[c]back_inserter\*[r] convenience function
.CW
    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    \m[green]//func takes an iterator and a value\m[]
    func(std::back_inserter(v), -1);

.R
.i1e
.SS Stream iterators
.IT Read or write objects from a stream using \*[c]operator<<\*[r] or \*[c]operator>>\*[r]
.i1s
This code will print the contents of the vector
.CW
    std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    std::ostream_iterator<int> it (std::cout," ");
    std::copy(v.begin(), v.end(), it);
.R
.i1e
.IT The default constructed stream iterator is the \*[c]end of stream\*[r] iterator
.i1 It serves the same function as \*[c]end\*[r]
.i2 which is 'one past the end' of the iterator sequence 
.i1s
Used to define a range just like any other iterator using \*[c]begin()\*[r] and \*[c]end()\*[r]
.CW
  int main() {
    ifstream data("data.txt");
    ofstream sorted("sorted.txt");
    if (!data || !sorted) {
      cout << \m[green]"Problem opening files\\n"\m[];
      return -1;
    }
    istream_iterator<string> is(data);
    istream_iterator<string> eof;

    vector<string> words;
    copy(is, eof, back_inserter(words));
    sort(words.begin(), words.end());

    ostream_iterator<string> os(sorted, " ");
    copy(words.begin(), words.end(), os );
  }
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

