.ds CH Lab #5a: Linear Containers
.so headings.ms
.TL
\*[CH]
.so cover-page.ms
.bp
.NH
Stacks: 60 minutes \fImaximum\fR
.time_box
.QP
	
Create a program that contains the following methods:

.CW

  /**
   * Determine if a stack contains a provided value.
   * <p>
   * Use the operator= function of T is used to determine 
   * whether stack elements are equal to 'value'.
   * </p>
   *
   * @param val in the stack to search for and remove.
   * @param s to search for a value
   * @return true if value exists in the stack.
   */
  template <class T>
  bool contains (const T& value, const stack<T>& s);


  /**
   * Reverse the order of elements in a stack.
   * @param s the stack to reverse
   *
   * @return A new stack with it's elements in reverse order.
   */
  template <class T>
  std::stack<T> reverse(const std::stack<T>& s);

.R

Do not use any STL algorithms.
In your reverse function, 
use 1 or more linear containers to perform the reverse operation.
.bp
.NH
Working with Data: 30 minutes \fImaximum\fR
.time_box
.RS
This section is extra credit.
To receive the credit, your answers need to be complete.

Given the code from textbook \*[sect] 20.1:
.CW
  // Jack puts doubles into an array and 
  // returns the number of elements in *count
  double* get_from_jack(int* count);

  // Jill fills vector
  std::vector<double>* get_from_jill(); 

  void func()
  {
    int jack_count    = 0;
    double* jack_data = get_from_jack(&jack_count);
    std::vector<double>* jill_data = get_from_jill();

    double* jack_high;    // element with highest value
    double* jill_high;    // element with highest value

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
Although the code for \*[c]get_from_jill()\*[r] is not included (we don't need to see it), 
it is clear that accessing Jill's data is a pain.
The function \*[c]get_from_jill()\*[r] returns a pointer to a \*[c]vector\*[r].
To get the data, we have to dereference the pointer, however, 
\*[c]*jill_data[i]\*[r] is not what we want: \*[c][]\*[r] has precendence over \*[c]*\*[r]
so we need parentheses: \*[c](*jill_data)[i]\*[r].
You will encounter this kind of ugliness often in legacy code.

What changes could be made to the jill part of func that would improve it?
.RE
