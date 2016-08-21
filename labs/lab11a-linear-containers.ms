.ds CH Lab #11a
.TL
Lab #11a: Linear Containers
.so cover-page.ms


.bp
.NH
Working with Data: 60 minutes \fImaximum\fR
.time_box
.RS
Given:
.CW

double* get_from_jack(int* count);    // Jack puts doubles into an array and
                                      // returns the number of elements in *count
std::vector<double>* get_from_jill(); // Jill fills the vector

void func()
{
  int jack_count    = 0;
  double* jack_data = get_from_jack(&jack_count);
  std::vector<double>* jill_data = get_from_jill();

  double* jack_high;    // will point to element with highest value
  double* jill_high;    // will point to element with highest value

  double h = -1;
  for(int i = 0; i < jack_count; ++i) {
    if (h < jack_data[i]) {
      jack_high = &jack_data[i];    // save address of largest element
      h = jack_data[i];             // update largest element
    }
  }

  h = -1;
  for (int i = 0; i < jill_data->size(); ++i) {
    if (h < (*jill_data)[i]) {
      jill_high = &(*jill_data)[i];    // save address of largest element
      h = (*jill_data)[i];             // update largest element
    }
  }

  std::cout << "Jill's max: " << *jill_high 
            << ", Jack's max: " << *jack_high;

  delete[] jack_data;
  delete   jill_data;

}

.R
Accessing Jill's data is a pain.
The function \*[c]get_from_jill()\*[r] returns a pointer a \*[c]vector\*[r].
To get the data, we have to dereference the pointer, however, 
\*[c]*jill_data[i]\*[r] is not what we want: \*[c][]\*[r] has precendence over \*[c]*\*[r]
so we need parentheses: \*[c](*jill_data)[i]\*[r].
You will encounter this kind of ugliness often in legacy code.

What changes could be made to the jill part of func that would improve it?
.RE


.bp
.NH
Container problems: 60 minutes \fImaximum\fR
.time_box
.RS
.nr step 1 1
.IP \n[step].
Explain in your own words why \*[c]vector\*[r] does not have a function \*[c]push_front()\*[r]
as part of it's API.  
Include what would be required if it existed and compare it to \*[c]push_back()\*[r].





.IP \n+[step].
Given the following:
.RS
.CW
  #include <list>

  class Business { };

  class Hotel : public Business { };

  class Inn : public Hotel { };

  class Travel : public Inn {
    public:
    std::list<Hotel>* go() {
      // LINE A
    };
  };
.R

Which statement inserted independently at "LINE A" will compile? 

What is wrong with the pairs of code that do not compile?
.IP a.
\*[c]return new std::list<Inn>;\*[r]
.IP b.
\*[c]return new std::list<Hotel>;\*[r]
.IP c.
\*[c]return new std::list<Hotel>*;\*[r]
.IP d.
\*[c]return new std::list<Business>;\*[r]
.IP e.
\*[c]return new std::list<Business>*;\*[r]
.RE
.RE

.bp
.NH
Vector vs List: 60 minutes \fImaximum\fR
.time_box
.QP


Run a small timing experiment to compare the cost of running vector and list. 
You can find an explanation of how to time a program in \*[sect]26.6.1. 
Generate \fIN\fR random \*[c]int\*[r] values in the range [0:\fIN\fR]. 
As each int insert it into a \*[c]vector<int>\*[r] (which grows by one element each time). 
Keep the vector sorted; that is a value is inserted after every previous 
value that is less than or equal to the new value and before every previous 
value that is larger than the new value. 
Now do the same experiment using a \*[c]list<int>\*[r] to hold the \*[c]int\*[r]s. 
For which \fIN\fR is the \*[c]list\*[r] faster than the \*[c]vector\*[r]?  










Explain your results in your own words.





.bp
.NH
Stacks: 60 minutes \fImaximum\fR
.time_box
.QP
	
Create a namespace "Stacks" that contains the following methods:

.CW

  /**
   * Determine if a stack contains a provided value.
   * <p>
   * The equals method of T is used to determine whether stack
   * elements are equal to value.
   * </p>
   *
   * @param val in the stack to search for and remove.
   * @param s to search for a value
   * @return true if value exists in the stack.
   */
  boolean contains (final T value, final Stack<T> s);


  /**
   * Reverse the order of elements in a stack.
   * @param s to search reverse
   *
   * @return A new stack with it's elements in reverse order.
   */
  std::stack<T> reverse(const std::stack<T> s);

.R



.bp
.so reflection.ms

