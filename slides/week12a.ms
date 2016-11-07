
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
.IT Unordered maps
.IT Hash functions
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
.i1 Sometimes 'KVP' and in cppreference.com, just \fBP\fR
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
    {"Alice", 27}, {"Bob", 3}, {"Alice", 1}};

  for (const auto &pair : name_counts) {
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
.IT Note: no push_back() 
.i1 The \*[c]map\*[r] decides where elements go, not you.
.SS Map structure
.IT Internally, a \*[c]map\*[r] is a sorted \fIcomplete\fR tree
.PSPIC -L images/tree-complete.eps
.IT Nodes are sorted by their key
.i1 Sorted based on \*[c]operator<\*[r] by default
.i1 Can supply a custom \fIcompare class\fR
.IT Searching for elements is faster than vector for large maps.
.i1 Linear ADT's force a linear search
.i1 Map search is a function of tree height
.SS Unordered map
.IT We said that 'maps are trees'
.i1 Is this the only way to make a map?
.IT Trees have $log sub 2 (n)$ access
.i1 But unsorted vectors have constant-time access
.i1 Is it possible to make a map with constant-time access?
.i1 Yes.
.IT Problem
.i1 We want to store a map like a vector
.i2 As a linear ADT
.i2 So it has an index we can access in 1 step.
.i1 But a map has a 'key', not an 'index'
.IT \fIhash code\fR to the rescue
.i1 We \fIcompute\fR an index into an array using the map key
.SS Hashtable
.IT The default map implementation in most other languages uses a \fIhash table\fR
.i1 The C++ equivalent is an \*[c]unordered_map\*[r]
.IT A hashtable is an indexed collection
.i1 Backing store is commonly an array
.IT Each indexed location is called a \fBbucket\fR
.IT Holds one (or more) map entries (<K,V>)
.IT A \fIhash function\fR takes a key
.i1 Returns an index
.i1 The index identifies the bucket
.i1 Which can the be used to get values
.IT Only \fIhashable object\fR can be used as keys in an unordered map
.i1 Override \*[c]std::hash\*[r] to make you own hashable keys
.SS Unordered map buckets
.mk
.PSPIC -R images/chained-hashing.eps
.rt
.IT unordered maps typically have
.i1 \fIFar\fR fewer buckets than values
.i2 That might conceivably be stored
.i1 Consider keys of
.i2 \*[c]long\*[r] 
.i3 $2 sup 63 - 1$ possible keys
.i2 16 character strings
.i3 $26 sup 16$ possible keys 
.i3 assuming basic Latin alphabet
.IT Main idea
.i1 Create 'just enough' buckets
.i1 Somewhat more than actual keys used
.i1s
Far less than potential 
.br
 max number of keys
.i1e
.i1 Much more space efficient
.i1 Some keys will likely need to be stored in the same bucket
.i1 Each bucket either contains an element
.i2 or a linked list of elements
.SS Overriding std::hash
.IT Consider a \fCstruct Point\fR
\s-8
.CW
  struct Point {
    int x;
    int y;
  }
  namespace std {
    // hashable Point
    template <>
      struct hash<Point>
      {
        std::size_t operator()(const Point& p) const
        {
          return ((std::hash<int>()(7919)
                ^ (std::hash<int>()(p.x) << 1)) >> 1)
                ^ (std::hash<int>()(p.y) << 1);
        }
      };
  }
.R
\s+8
.SS A general hash algorithm
.IT The previous algorithm works, but hard to remember
.i1 This general approach is serviceable for many applications
.IT Store a constant non-zero prime in a variable result.
.i1 Examples: 17, 7919, 131
.IT For each significant field used in \*[c]operatpr=\*[r]
.i1 Compute an int hash code (c) for the member, \fCf\fR
.i1 If a built-in type \fCT\fR, call \fCstd::hash<T>()(f)
.i1 If the field is an object reference, either
.i2 Recursively invoke hash on f, or
.i2 Create a 'canonical representation' of the field & compute the hash on that
.i1 If the field is an array, then treat each element as a separate value
.i1s
Combine the field as follows
.CW
 result = 31 * result + c
.R
.i1e
.IT Return result

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
.i1 A set that allows duplicate keys
.i1 No overwrite, but
.i1 You can retrieve multiple values for a single key
.IT \*[c]multiset\*[r] functions
.i1 Same API as set, but adds lookup function \*[c]equal_range\*[r] 
.i2 Returns a  \*[c]std::pair\*[r] of iterators
.i2 If no match, then pair.first ==  \*[c]end\*[r] 
.SS Summary
.IT Maps, sets, and trees
.i1 map vs unordered_map and multimap
.i1 set vs unordered_set and multiset
.IT Unordered maps
.IT Hash functions
