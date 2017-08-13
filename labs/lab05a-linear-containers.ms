.ds CH Lab #5a: Linear Containers
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Stacks: 100 points, 60 minutes \fImaximum\fR
.time_box
.QP
	
Create a program that implements the following functions:
.CW
  \m[green\m[]/**
   * Determine if a stack contains a provided value.
   * <p>
   * Use simple equality (==) to determine 
   * whether stack elements are equal to 'value'.
   * </p>
   *
   * @param val in the stack to search for.
   * @param s to search for a value
   * @return true if value exists in the stack.
   */\m[]
  template <class T>
  bool contains (const T& value, const stack<T>& s);

  \m[green]/**
   * Reverse the order of elements in a stack.
   * @param s the stack to reverse
   *
   * @return A new stack with its elements in reverse order.
   */\m[]
  template <class T>
  std::stack<T> reverse(const std::stack<T>& s);
.R
.h2 Restrictions
.RS
.IP 1.
Do not use any STL algorithms.
.IP 2.
In your reverse function, 
.IP 3.
use 1 or more linear containers to perform the reverse operation.
.RE
.h3 Things to notice
.RS
.IP 1.
Each of the function signatures provide \*[c]const\*[r] references
to a stack, so your implementation must copy the provided parameter.
.IP 2. 
A \*[c]std::stack\*[r] is not \fIiterable\fR.
You can't use a range for loop or define an iterator.
.IP 3.
Make a temporary local copy of the provided stack and operate on that
You will end up destroying the temp copy in each function.
.RE
.bp
.NH
Working with Data: about 30 minutes
.RS
This section is extra credit.
To receive the credit, your answers need to be complete.

Given the code from textbook \*[sect] 20.1:
.CW
  \m[green]// Jack puts doubles into an array and\m[]
  \m[green]// returns the number of elements in *count\m[]
  double* get_from_jack(int* count);

  \m[green]// Jill fills vector\m[]
  std::vector<double>* get_from_jill(); 

  void func() {
    int jack_count    = 0;
    double* jack_data = get_from_jack(&jack_count);
    std::vector<double>* jill_data = get_from_jill();

    double* jack_high;    \m[green]// element with highest value\m[]
    double* jill_high;    \m[green]// element with highest value\m[]

    double h = -1;
    for(int i = 0; i < jack_count; ++i) {
      if (h < jack_data[i]) {
        jack_high = &jack_data[i];
        h = jack_data[i];
      }
    }

    h = -1;
    for (int i = 0; i < jill_data->size(); ++i) {
      if (h < (*jill_data)[i]) {
        jill_high = &(*jill_data)[i];
        h = (*jill_data)[i];
      }
    }

    std::cout << "Jill's max: " << *jill_high 
              << ", Jack's max: " << *jack_high;

    delete[] jack_data;
    delete   jill_data;
  }
.R
.bp
Although the code for \*[c]get_from_jill()\*[r] is not included (we don't need to see it), 
it is clear that accessing Jill's data is a pain.
The function \*[c]get_from_jill()\*[r] returns a pointer to a \*[c]vector\*[r].
To get the data, we have to dereference the pointer, however, 
\*[c]*jill_data[i]\*[r] is not what we want: \*[c][]\*[r] has precendence over \*[c]*\*[r]
so we need parentheses: \*[c](*jill_data)[i]\*[r].
You will encounter this kind of ugliness often in legacy code.

What changes could be made to \fCfunc()\fR that would improve it?

Feel free to change anything in func, but you \fBcan't\fR change the function signature of 
\*[c]get_from_jack\*[r]  and \*[c]get_from_jill\*[r].
.h2 Things to consider
.RS
.IP 1.
Can we simplify access to \fCjill_data\fR?
.IP 2.
Can the duplication in this function be eliminated?
.RE

