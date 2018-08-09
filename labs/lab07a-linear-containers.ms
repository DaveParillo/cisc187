.ds CH Lab #7a: Sequential Containers
.so headings.ms
.TL
\*[CH]
.LP
The goal of this lab is to gain familiaraity with the
\*[c]std::stack\*[r] class and
to understand some limitations of a stack.

.so cover-page.ms

.h2 Restrictions
.RS
.IP \(bu
Do not use any STL algorithms in this lab!
.IP \(bu
In \*[c]reverse()\*[r],
use 1 or more sequential containers to perform the reverse operation.
.RE
.h2 Things to notice
.RS
.nr step 0 1
.IP \n+[step].
Each of the function signatures provide \*[c]const\*[r] references
to a stack, so your implementation must copy the provided parameter.
.IP \n+[step].
A \*[c]std::stack\*[r] is not \fIiterable\fR.
You can't use a range for loop or define an iterator.
.IP \n+[step].
Make a temporary local copy of the provided stack and operate on that
you will end up destroying the temp copy in each function.
.RE
.bp
.NH
Stacks: 4 points, 60 minutes \fImaximum\fR
.QP
.RS
.nr step 0 1
.IP \n+[step].
Create the file \fClab7a.h\fR.

In the steps that follow, place all code in the \*[c]mesa\*[r] namespace.
.IP \n+[step].
Write a function template that determines if a \*[c]std::stack\*[r]
contains a user provided value:
.CW
  \m[green]/**
   * Determine if a stack contains a provided value.
   *
   * @param val in the stack to search for.
   * @param s stack being searched
   * @return true if value exists in the stack.
   */\m[]
  template <class T>
  bool contains (const T& value, const stack<T>& s);
.R
.IP \n+[step].
Write a function template that reverses a \*[c]std::stack\*[r]:
.CW
  \m[green]/**
   * Reverse the order of elements in a stack.
   * @return A new stack with its elements in reverse order.
   */\m[]
  template <class T>
  std::stack<T> reverse(const std::stack<T>& s);
.R
.IP \n+[step].
Write a function template that compares two \*[c]std::stack\*[r]s:
.CW
  \m[green]/**
   * Compare two stacks.
   * @return true if each element of both stacks 
   *              passes the operator== test.
   * @return false otherwise
   */\m[]
  template <class T>
  bool equal_to(const std::stack<T>& a, 
                const std::stack<T>& b);
.R
.RE

.LP
Check your progress using the \*[c]check187\*[r] script:
.CW
    check187 lab7a
.R

Turn in your completed lab using the \*[c]submit187\*[r] script:
.CW
    submit187 lab7a
.R


