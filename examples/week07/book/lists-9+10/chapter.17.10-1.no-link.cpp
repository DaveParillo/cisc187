
//
// This is example code from Chapter 17.10 "The this pointer" of
// "Programming -- Principles and Practice Using C++" by Bjarne Stroustrup
//


#include <string>
using std::string;


//------------------------------------------------------------------------------

class Link {
public:
    string value; 

    Link(const string& v, Link* p = 0, Link* s = 0)
        : value(v), prev(p), succ(s) { }

    Link* insert(Link* n) ;   // insert n before this object
    Link* add(Link* n) ;      // insert n after this object
    Link* erase() ;           // remove this object from list
    Link* find(const string& s);    // find s in list
    const Link* find(const string& s) const; // find s in list

    Link* advance(int n) const;     // move n positions in list

    Link* next() const { return succ; }
    Link* previous() const { return prev; }
private:
    Link* prev;
    Link* succ;
};

//------------------------------------------------------------------------------

Link* Link::insert(Link* n)   // insert n before p; return n
{
    Link* p = this;           // pointer to this object
    if (n==0) return p;       // nothing to insert
    if (p==0) return n;       // nothing to insert into
    n->succ = p;              // p comes after n
    if (p->prev) p->prev->succ = n;
    n->prev = p->prev;        // p's predecessor becomes n's predecessor
    p->prev = n;              // n becomes p's predecessor
    return n;
}

//------------------------------------------------------------------------------
