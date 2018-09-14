References
==========

* [Powerpoint slides](http://stroustrup.com/Programming/lecture-slides.html)
as provided by Bjarne Stroustrup for this textbook.

Week: 
[1](#week-1) | 
[2](#week-2) | 
[3](#week-3) | 
[4](#week-4) | 
[5](#week-5) | 
[6](#week-6) | 
[7](#week-7) | 
[8](#week-8) | 
[9](#week-9) | 
[10](#week-10) | 
[11](#week-11) | 
[12](#week-12) | 
[13](#week-13) | 
[14](#week-14) | 
[15](#week-15) | 
[16](#week-16)

## Week 1
#### C/C++ review, tools and using the command line in GNU/Linux

* From: cppreference.com: 
[C++ operator precedence](http://en.cppreference.com/w/cpp/language/operator_precedence)
* [SFTP tutorial](http://www.thegeekstuff.com/2010/06/ftp-sftp-tutorial) - there are few really good, basic ad free references. I will go over this again in class.
* [Using the getopt function](https://www.gnu.org/software/libc/manual/html_node/Using-Getopt.html) - from gnu.org
* [Ryans Tutorials: Linux](http://ryanstutorials.net/linuxtutorial/) - a decent introduction to the linux command line and the vi editor.
* Text editors
  * [Notepad++](https://notepad-plus-plus.org/) (Windows only) - also available on campus
  * [Atom](https://atom.io/) (Win, OSX, or Linux)
  * Or, if you want to go 'old school', you may consider 
    [Vim](http://www.vim.org/) or [Emacs](http://www.gnu.org/software/emacs/)

### More to explore
* Jeff Atwood's blog: [Code smells](https://blog.codinghorror.com/code-smells/)
* Useful and interesting tools:
  [Compiler explorer](https://godbolt.org)
  [Code visualization](http://www.pythontutor.com/cpp.html#code=//%20Example%20C%2B%2B%20code%20for%20OPT%0Aint%20main%28%29%20%7B%0A%20%20int%20*x%20%3D%20new%20int%3B%0A%20%20int%20*x_array%20%3D%20new%20int%5B10%5D%3B%0A%0A%20%20x_array%5B1%5D%20%3D%201%3B%0A%20%20x_array%5B3%5D%20%3D%203%3B%0A%20%20x_array%5B5%5D%20%3D%205%3B%0A%0A%20%20delete%20x%3B%0A%20%20delete%5B%5D%20x_array%3B%0A%20%20return%200%3B%0A%7D&curInstr=6&mode=display&origin=opt-frontend.js&py=cpp&rawInputLstJSON=%5B%5D) for C, C++, Python, Java, Ruby and others

## Week 2
#### String and Vector


## Week 3
#### Function basics
* [Chapter 8](http://stroustrup.com/Programming/8_functions.ppt) slides from textbook.
* From: cppreference.com: 
  [function declarations](http://en.cppreference.com/w/cpp/language/function), 
  the [auto specifier](http://en.cppreference.com/w/cpp/language/auto), 
  [const qualifier](http://en.cppreference.com/w/cpp/language/cv) and 
  [constexpr](http://en.cppreference.com/w/cpp/language/constant_expression)

### More to explore
* C++ Core Guidelines for 
  [functions](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#S-functions) from GitHub
* cppreference.com tutorial on [functions](http://www.cplusplus.com/doc/tutorial/functions/)
* A very brief description of 
  "[extract method](http://refactoring.com/catalog/extractMethod.html)" from Martin Fowler's Refactoring site.
* [ExtractMethod](http://c2.com/cgi/wiki?ExtractMethod) discussion from the 
  [PortlandPatternRepository](http://c2.com/cgi/wiki?PortlandPatternRepository) - the very first wiki
* [Herb Sutter's GOTW #94](https://herbsutter.com/2013/08/12/gotw-94-solution-aaa-style-almost-always-auto/)


## Week 4
#### Function templates and overloads
* [Chapter 19](http://stroustrup.com/Programming/19_vector.ppt) slides from textbook.
* From cppreference.com
  * C++ [templates](http://en.cppreference.com/w/cpp/language/templates) overview
  * [function](http://en.cppreference.com/w/cpp/language/function_template) templates
  * Template [parameters and template arguments](http://en.cppreference.com/w/cpp/language/template_parameters) and 
    [template argument deduction](http://en.cppreference.com/w/cpp/language/template_argument_deduction)
  * [static cast](http://en.cppreference.com/w/cpp/language/static_cast) 
#### Exception handling
  * Overview of the [error handling](http://en.cppreference.com/w/cpp/error) library and 
    [exceptions](http://en.cppreference.com/w/cpp/language/exceptions)
  * [try-catch](http://en.cppreference.com/w/cpp/language/try_catch) and 
    [throw](http://en.cppreference.com/w/cpp/language/throw)

### More to explore
* Post from Eric Lippert on [vexing exceptions](https://blogs.msdn.microsoft.com/ericlippert/2008/09/10/vexing-exceptions/)

## Week 5
#### Pointers


## Week 6
#### Function pointers and lambda expressions
* From cppreference.com
  * C++ [lambda expressions](http://en.cppreference.com/w/cpp/language/lambda) and
    [std::function](http://en.cppreference.com/w/cpp/utility/functional/function)
* Descriptions of [lambda expressions](https://msdn.microsoft.com/en-us/library/dd293608.aspx)
  from Microsoft's MSDN

## Week 7
#### Containers
* [Chapter 20](http://stroustrup.com/Programming/20_containers.ppt) slides from textbook.
* From cppreference.com
  * C++ Concepts: [Container](http://en.cppreference.com/w/cpp/concept/Container) and 
    [SequenceContainer](http://en.cppreference.com/w/cpp/concept/SequenceContainer)
  * Overview of the [container](http://en.cppreference.com/w/cpp/container) library
#### Associative containers
* [Chapter 21](http://stroustrup.com/Programming/21_algorithms.ppt) slides from textbook.
* From cppreference.com
  * C++ Concepts: 
    [Compare](http://en.cppreference.com/w/cpp/concept/Compare), 
    [AssociativeContainer](http://en.cppreference.com/w/cpp/concept/AssociativeContainer) and 
    [UnorderedAssociativeContainer](http://en.cppreference.com/w/cpp/concept/UnorderedAssociativeContainer)
  * [std::set](http://en.cppreference.com/w/cpp/container/set) and 
    [std::map](http://en.cppreference.com/w/cpp/container/map)
  * [std::unordered_map](http://en.cppreference.com/w/cpp/container/unordered_map) and 
    [std::hash](http://en.cppreference.com/w/cpp/utility/hash)

## Week 8
#### Trees

#### Midterm

## Week 9
#### Iterators
* From cppreference.com
  * C++ Concepts: [Iterator](http://en.cppreference.com/w/cpp/concept/Iterator) and 
    [ForwardIterator](http://en.cppreference.com/w/cpp/concept/ForwardIterator)
  * [vector::begin()](http://en.cppreference.com/w/cpp/container/vector/begin) and 
    [vector::end](http://en.cppreference.com/w/cpp/container/vector/end)
  * [istream_iterator](http://en.cppreference.com/w/cpp/iterator/istream_iterator), 
    [ostream_iterator](http://en.cppreference.com/w/cpp/iterator/ostream_iterator) and 
    [back_inserter](http://en.cppreference.com/w/cpp/iterator/back_inserter)

## Week 10
#### STL algorithms
* [Chapter 21](http://stroustrup.com/Programming/21_algorithms.ppt) slides from textbook.
* From cppreference.com
  * Overview of the [algorithms](http://en.cppreference.com/w/cpp/algorithm) library
  * [std::find](http://en.cppreference.com/w/cpp/algorithm/find) (and find_if), 
    [std::count_if](http://en.cppreference.com/w/cpp/algorithm/count_if)
  * [for_each](http://en.cppreference.com/w/cpp/algorithm/for_each) and 
    [make_heap](http://en.cppreference.com/w/cpp/algorithm/make_heap)

### More to explore
* [The World Map of C++ STL Algorithms](http://www.fluentcpp.com/getthemap/), 
  part of a presentation on [105 STL Algorithms in an hour](https://www.youtube.com/watch?v=bXkWuUe9V2I).
* C++ Seasoning - a great presentation by Sean Parent at Going Native 2013
  [video](https://channel9.msdn.com/Events/GoingNative/2013/Cpp-Seasoning) and
  [slides](http://sean-parent.stlab.cc/presentations/2013-09-11-cpp-seasoning/cpp-seasoning.pdf)
  
* Other Algorithm libraries
  * Boost [algorithms](http://www.boost.org/doc/libs/1_62_0/libs/libraries.htm#Algorithms)

## Week 11
#### Structure and class basics
* [Chapter 9 slides](http://stroustrup.com/Programming/9_classes.ppt) from textbook.
* [Classes I](http://www.cplusplus.com/doc/tutorial/classes/) tutorial from cplusplus.com
* [Initialization](http://en.cppreference.com/w/cpp/language/initialization)
   and [Constructors and member initialization lists](http://en.cppreference.com/w/cpp/language/initializer_list)
   from cppreference.com

### More to explore
* Two perspectives on struct vs classes: 
  [cplusplus.com beginner forums](http://www.cplusplus.com/forum/beginner/5980/)
   and Colin Walls' [blog](https://blogs.mentor.com/colinwalls/blog/2014/06/02/struct-vs-class-in-c/)

## Week 12
#### Class interfaces and overloading
* [Chapter 9 slides](http://stroustrup.com/Programming/9_classes.ppt) from textbook.
* C++ Core Guidelines for 
  [enumerations](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#S-enum), 
  [interfaces](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#S-interfaces), and 
  [overloading](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#SS-overload) on GitHub
* [Classes II](http://www.cplusplus.com/doc/tutorial/templates/) tutorial from cplusplus.com
* [Operator overloading](http://stackoverflow.com/questions/4421706/operator-overloading/16615725) from StackOverflow C++ FAQ
  * Overview of [function objects](http://en.cppreference.com/w/cpp/utility/functional) from cppreference.com
* [Initialization](http://en.cppreference.com/w/cpp/language/initialization) and 
  [Constructors and member initialization lists](http://en.cppreference.com/w/cpp/language/initializer_list) from cppreference.com

## Week 13
#### Class inheritance and composition
* [Chapter 14](http://stroustrup.com/Programming/14_class_design.ppt) slides from textbook.
* [class templates](http://en.cppreference.com/w/cpp/language/class_template) cppreference 
  * Template [parameters and template arguments](http://en.cppreference.com/w/cpp/language/template_parameters) and 
    [template argument deduction](http://en.cppreference.com/w/cpp/language/template_argument_deduction)
* [Inheritance](http://www.cplusplus.com/doc/tutorial/inheritance/) and 
  [Polymorphism](http://www.cplusplus.com/doc/tutorial/polymorphism/) from cplusplus.com

### More to explore
* Several lectures from Sean Parent:
  * Why (and how) to implement polymorphism without inheritance in C++,
    otherwise known as Inheritance Is The Base Class of Evil 
    [video](https://channel9.msdn.com/Events/GoingNative/2013/Inheritance-Is-The-Base-Class-of-Evil), 
    a longer version is 
    [available](http://sean-parent.stlab.cc/papers-and-presentations#title-value-semantics-and-concept-based-polymorphism)
  * Better Code: Data Structures
    [slides](http://sean-parent.stlab.cc/presentations/2015-09-23-data-structures/data-structures.pdf)
    [video](https://www.youtube.com/watch?v=sWgDk-o-6ZE)
    
* A good article from Herb Sutter on [virtual functions](http://www.gotw.ca/publications/mill18.htm)

## Week 14
#### Memory management
* [Chapter 17](http://stroustrup.com/Programming/17_free_store.ppt) slides from textbook.
* cppreference.com desriptions of 
  * [unique_ptr](http://en.cppreference.com/w/cpp/memory/unique_ptr) and 
    [memory](http://en.cppreference.com/w/cpp/memory)
  * [static cast](http://en.cppreference.com/w/cpp/language/static_cast), 
    [const cast](http://en.cppreference.com/w/cpp/language/const_cast), 
    [reinterpret cast](http://en.cppreference.com/w/cpp/language/reinterpret_cast), and 
    [dynamic cast](http://en.cppreference.com/w/cpp/language/dynamic_cast),

#### Copying and moving memory
* [Chapter 18](http://stroustrup.com/Programming/18_arrays.ppt) slides from textbook.
* From cppreference.com: 
  * [copy constructors](http://en.cppreference.com/w/cpp/language/copy_constructor) 
  * [copy assignment](http://en.cppreference.com/w/cpp/language/copy_assignment).
  * [Rule of Five / Rule of zero](http://en.cppreference.com/w/cpp/language/rule_of_three)

### More to explore
* [Pointers vs references](http://www.cplusplus.com/articles/ENywvCM9/) from cplusplus.com
* [CppCoreGuidelines](http://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines) 
  summary of 
  [Resource management guidelines](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#S-resource) on GitHub


## Week 15
#### Serialization
* From isocpp.org [serialization FAQ](https://isocpp.org/wiki/faq/serialization)
* Boost [serialization](http://www.boost.org/doc/libs/1_62_0/libs/serialization/doc/index.html)

### More to explore
* Review of stream I/O
  * [Ch. 10](http://stroustrup.com/Programming/10_iostreams.ppt) and 
    [Ch. 11](http://stroustrup.com/Programming/11_custom_io.ppt) slides from textbook.
  * [Basic Input/Output](http://www.cplusplus.com/doc/tutorial/basic_io/) and 
    [File I/O](http://www.cplusplus.com/doc/tutorial/files/) from cplusplus.com

## Week 16
#### Final Exam

## Congratulations!
You made to the end of the semester, now what?

First, take a well-earned rest.  
When you are ready to think about programming again, consider the following for further reading. 
Some of these books have been around for a long time, 
but they are all classics and still have considerable value.

### For fun
* [Map of the C++17 Lands](http://fearlesscoder.blogspot.com/2017/02/the-c17-lands.html)

### Coding challenges and puzzles
* [exercism.io](https://exercism.io) Code practice and mentorship for everyone.  
  Level up your programming skills with 2,545 exercises across 47 languages
* [C++ Quiz](http://cppquiz.org/) a simple online quiz you can use to test your knowledge of C++
* [Project Euler](https://projecteuler.net) a series of challenging mathematical/computer 
  programming problems that will require more than just mathematical insights to solve. 
  Although mathematics will help you arrive at elegant and efficient methods, 
  the use of a computer and programming skills will be required to solve most problems.
* [Code Chef](https://www.codechef.com) CodeChef is a not-for-profit educational initiative.
  They provide this platform as a way to practice and compete in friendly competition.
* [UVa Online Judge](https://uva.onlinejudge.org) is one of the few sites that has and online
  and a published set of problems.

### Suggested reading

* First, a good, short blog post about [how to teach yourself programming](http://norvig.com/21-days.html). 
  Good advice.
* [Clean Code, A Handbook of Agile Software Craftsmanship](https://en.wikipedia.org/wiki/Special:BookSources/9780132350884)
* [Code Complete](http://cc2e.com) A true compendium. 
  Which may be a 'pro' or a 'con' for you.

  Originally written in 1993 and redone in 2004, 
  it is a collection of software best practices with essentially no competition. 
  Years later, there remains little to disagree with

* [The Pragmatic Programmer](https://pragprog.com/book/tpp/the-pragmatic-programmer).
  I really like the style of this book.

  It’s thin & you can read it in any order. 
  You can skip around or read it straight through.

  It’s primary focus is on honing the behaviors that turn OK programmers into great ones. 
  If you read this, you see may similarities between sections in Code Complete. 
  This is just less comprehensive - it’s ‘agile’!

* Chapter 16 of the [Mythical Man-Month](https://en.wikipedia.org/wiki/The_Mythical_Man-Month): 
  *No silver bullets*. 
  
  This book gets a lot of endorsements, but honestly, 
  I think most of it is not too relevant to modern computing problems, with a few exceptions. 
  The "No silver bullets” chapter complements the ‘religion’ section at the end of Code Complete.

* The Design of Everyday things, Don Norman and The Inmates are running the Asylum, Alan Cooper.

  These two books are focused on how people interact with things in general (book 1), 
  and software in particular (Book 2) - Cooper’s main point is that knowing how to design 
  a user interface is a distinct skill & you can’t just expect any old programmer 
  to be a great designer - which is a point made by Fred Brooks in No Silver bullets, 
  just in less space.
* Effective Java - yes Java.
* Effective C++ (but it's a bit dated - parts of Effective C++, More Effective C++ and Effective Modern C++)

  * You’ll find a lot of the material in Code Complete also mentioned these books as well. 
    I prefer Effective Java over Effective C++, even though Josh Bloch was inspired to write 
    Effective Java *by* Effective C++. 
    His version is less specific - that has allowed it to stay relevant even though Java has changed a lot. 
    I also like that Josh is not shy about calling out specifics where the design of the 
    Java libraries was just wrong. 
    He uses the design of Object.clone(), Object.notify() & wait(), java.util.Date, 
    java.util.Stack and others as ways to point out how not to make the same mistakes 
    the creators of Java did. 
    And he should know - he is one of them.
  * One of the interesting things about the Effective C++ series is that you can see how the 
    design of the language has evolved over the last 15 or 20 years. 
    Example: 

    Effective C++ says to prefer new & delete over malloc & free
   
    More Effective C++ says to prefer smart pointers over new & delete</li>

* http://www.open-std.org is a bare bones site with a huge amount of detailed information 
  related to open standards: C, C++, Python, Vulnerability information, and more.
