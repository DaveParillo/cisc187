#ifndef WEEK02_OVERLOAD_H
#define WEEK02_OVERLOAD_H

// C++ allows function names to be 'overloaded'
// that is, used more than once
//
// The one requirement is that the parameter lists must be different
int    square(int x);
double square(double x);
//float  square(float x);  // bad declaration: conflicts with double square()
//float  square(double x); // bad declaration: redundant, only return type is different

#endif
