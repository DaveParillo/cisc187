
.TL
.gcolor blue
Containers and Iterators
.gcolor
.LP
.ce 1
Week 9
.SS Overview
.IT Container functions
.SS Containers and iterators
.IT Some container functions work only with iterators
.IT Common container functions
.i1 \fCinsert()\fR
.i2 \fCiterator insert( const_iterator pos, const T& value );\fR
.i1 \fCerase()\fR
.i2 erase one element: \fCiterator erase( iterator pos );\fR
.i2 erase a range: \fCiterator erase( iterator first, iterator last );\fR
.i1 \fCemplace()\fR
.IT \*[c]std::list\*[r] functions
.i1 \fCsplice()\fR
.IT \*[c]std::forward_list\*[r] functions
.i1 \fCerase_after()\fR
.i1 \fCinsert_after()\fR
.i1 \fCsplice_after()\fR
.SS Modifying containers with iterators
.IT Important note about using \fCinsert()\fR and \fCerase()\fR
.IT When iterating through a container
.i1 Both \fCinsert()\fR and \fCerase()\fR can invalidate the current iterator!
.i1 True for vector and deque
.i1 Not a problem for lists
.IT This is why \fCinsert()\fR and \fCerase()\fR return an iterator
.i1 The new value now points to the next valid iterator
.i2 No need to manually increment if you receive the returned iterator
.SS Summary
.IT Careful modifying containers with iterators

