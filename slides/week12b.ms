
.TL
.gcolor blue
Unordered maps
.gcolor
.LP
.ce 1
Week 12
.EQ
delim $$
.EN
.SS Overview
.IT Unordered maps
.IT Hashing concepts
.i1 Hash tables
.IT Hash functions
.i1 \*[c]std::hash<T>\*[r]
.SS Unordered map
.IT We said that 'maps are trees'
.i1 Is this the only way to make a map?
.i2 No.
.IT Trees have $log sub 2 (n)$ access
.i1 But unsorted vectors have constant-time access
.i1 Is it possible to make a map with constant-time access?
.i2 Yes.
.IT Problem
.i1 We want to store a map like a vector
.i2 As a linear ADT
.i2 So it has an index we can access in 1 step.
.i1 But a map has a 'key', not an 'index'
.IT \fIhash code\fR to the rescue
.i1 We \fIcompute\fR an index into an array using the map key
.SS Hashtable
.IT The default map implementation in most other languages 
.i1 Is not a tree
.i1 It's a different ADT called a \fIhash table\fR
.i1 The C++ equivalent is an \*[c]unordered_map\*[r]
.IT A hash table is an indexed collection
.i1 Backing store is commonly an array
.IT Each indexed location is called a \fBbucket\fR
.IT Holds one (or more) map entries (<K,V>)
.IT A \fIhash function\fR takes a key
.i1 Returns an index
.i1 The index identifies the bucket
.i1 Which can the be used to get values
.IT Only \fIhashable object\fR can be used as keys in an unordered map
.i1 \fBMust\fR override \*[c]std::hash\*[r] and
.i1 \*[c]operator=\*[r] before an unordered_map will compile.
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
.IT For each significant field used in \*[c]operator=\*[r]
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
.SS Summary
.IT Unordered maps
.IT Hashing concepts
.i1 Hash tables
.IT Hash functions
.i1 \*[c]std::hash<T>\*[r]
