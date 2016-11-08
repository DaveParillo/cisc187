
.TL
.gcolor blue
Associative Containers
.gcolor
.LP
.ce 1
Week 12
.SS Overview
.IT Motivation
.IT Maps, sets, and trees
.IT the \*[c]map\*[r] API
.SS Search and Sort (briefly)
.mk
.PSPIC -R images/closet-messy.eps
.rt 
.IT Problem
.i1 We have lots (millions) of elements
.i1 Want to find specific data, 
.i2 or ranges of data 
.i1 quickly
.IT We could use a vector
.i1 Inserts are fast - use push_back()
.i2 We always know exactly where the end is.
.i1 Find is slow
.bp
.mk
.PSPIC -R images/closet-neat.eps
.rt 
.IT We could sort the vector
.i1 Speeds up search
.i2 Can 'half-split' vector
.i1 But now add is slow
.IT How slow?
.i1 push_back() is 'off-limits'
.i1 \fIEvery\fR insert is a search
.i1 On average \fIn / 2\fR comparisons

.bp
.IT How to make a sorted ADT
.i1 That doesn't get stupid slow
.i1 As the number of elements (\fIN\fR) in the ADT grows large?
.IT We need a new idea
.i1 The \fItree ADT\fR
.SS The Tree ADT
.IT A tree is a \fIhierarchical\fR ADT
.IT A Tree is a set of elements (nodes) defined by a parent relation
.i1 One node is the \fIroot\fR
.i2 The root node is the \fBonly\fR node with no parent
.i1 All other nodes have exactly 1 parent node
.IT The children of a node are commonly referred to as
.i1 The \fIright node\fR, and
.i1 The \fIleft node\fR
.SS Visualizing trees
.IT Programmers draw trees upside down
.i1 Root at the top
.i1 Branches extending downwards
.PSPIC images/tree1.eps
.IT The \fIheight\fR of a tree
.i1 Longest path length from the root to a leaf
.SS Binary Trees
.IT A tree in which no node has more than 2 children
.i1 0, 1, or 2 children are valid
.IT Examples:
.PSPIC images/tree-binary-examples.eps
.SS Advantages
.EQ
delim $$
.EN
.IT Insert is at most $log sub 2 (n)$
.IT Search is at most $log sub 2 (n)$
.IT \fIIf\fR the tree is 'balanced'
.IT Unbalanced trees are essentially fancy linked lists
.IT Balanced trees are useful and the basis for this weeks ADT's
.i1 Maps
.i1 Sets
.SS The Map ADT
.IT All the ADT's discussed so far focused on storing 1 thing
.i1 Single values of a type <E>: the Element
.IT Maps add a new wrinkle
.IT Maps focus on a \fBpair\fR of things
.i1 Traditionally called the \fIKey\fR and \fIValue\fR
.i1 Sometimes 'KVP', for key-value-pair
.i2 In cppreference.com, often just \fIP\fR
.i1 \fIValues\fR are retrieved from the map using the \fIKey\fR
.i1 The key & value are not normally the same type
.IT Keys must be unique
.i1 Adding a node with the same key will replace the old value
.bp
.IT Also Known As
.i1 Associative array, Dictionary List
.IT Examples
.i1 Dictionary: <word, definition>
.i1 Symbol table: <identifier, object>
.i1s
Index: <reference, resource>
.CW
  map<string, int> name_counts {
    {"Alice", 27}, {"Bob", 3}, {"Clara", 1}};

  for (const auto& pair : name_counts) {
    std::cout << pair.first << ": " 
              << pair.second << '\\n';
  }
  name_counts["Bob"] = 42;   // update existing value
  name_counts["Darla"] = 9;  // insert a new value
.R
.i1e
.SS Selected map functions
.IT Access and assignment
.i1 operator=, at(), and []
.IT Iterators
.i1 begin(), end(), rbegin(), and rend()
.IT Capacity
.i1 empty(), size(), and max_size()
.IT Modifiers
.i1 clear(), emplace(), insert(), erase(), swap()
.IT Lookup
.i1 count(), find(), equal_range(), 
.i1 upper_bound() and lower_bound()
.IT Note 
.i1 No push_back() 
.i2 The \*[c]map\*[r] decides where elements go, not you.
.i1 All access requires either knowing the key or having an iterator
.SS Map structure
.IT Internally, a \*[c]map\*[r] is a sorted \fIcomplete\fR tree
.PSPIC -L images/tree-complete.eps
.IT Nodes are sorted by their key
.i1 Sorted based on \*[c]operator<\*[r] by default
.i1 Can supply a custom \fIcompare class\fR
.IT Searching for elements is faster than vector for large maps.
.i1 Linear ADT's force a linear search
.i1 Map search is a function of tree height
.SS Custom Compare for map
.IT First
.i1s
Create a class with 1 override
.CW
  struct compare_size {
    bool operator()(const std::string& lhs, 
                    const std::string& rhs) const {
      return lhs.size() < rhs.size();
    }
  };
.R
.i1e
.IT Then
.i1s
Pass this class in as the third template argument of a map
.CW
  std::map<std::string, 
           std::string, compare_size> size_map;
.R
.i1e
.IT Note that in this example we are saying it's the \fIlength\fR of a string that defines it's uniqueness
.i1 Only 1 string of size = \fIn\fR can be stored in size_map
.SS Sets
.IT Think '\*[c]map\*[r]', but with no values
.IT A \*[c]set\*[r] is an ordered collection of things
.i1 Unlike a  map, it's not a pair, a single element is in the set.
.IT The \*[c]set\*[r] API has the same functions \*[c]map\*[r]
.i1 Elements instead of pairs
.IT Set ordering
.i1 By default uses \*[c]operator<\*[r]
.i1 You can provide a custom Compare object
.SS Multiset (and multimap)
.IT Multiset
.i1 A set that allows duplicate keys
.i2 Sounds like a contradiction
.i1 No overwrite, but
.i1 You can retrieve multiple values for a single key
.IT \*[c]multiset\*[r] functions
.i1 Same API as set, but adds lookup function \*[c]equal_range\*[r] 
.i2 Returns a  \*[c]std::pair\*[r] of iterators
.i2 If no match, then pair.first ==  \*[c]end\*[r] 
.SS Summary
.IT Searching and sorting goals
.IT Maps, sets, and trees
.i1 map and multimap
.i1 set and multiset
.IT The \*[c]map\*[r] API

