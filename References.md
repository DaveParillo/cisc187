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

## Week 2
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


## Week 3
#### Function templates and exception handling
* [Chapter 19](http://stroustrup.com/Programming/19_vector.ppt) slides from textbook.
* From cppreference.com
  * C++ [templates](http://en.cppreference.com/w/cpp/language/templates) overview
  * [function](http://en.cppreference.com/w/cpp/language/function_template) templates
  * Template [parameters and template arguments](http://en.cppreference.com/w/cpp/language/template_parameters) and 
    [template argument deduction](http://en.cppreference.com/w/cpp/language/template_argument_deduction)
  * [static cast](http://en.cppreference.com/w/cpp/language/static_cast) 
  * Overview of the [error handling](http://en.cppreference.com/w/cpp/error) library and 
    [exceptions](http://en.cppreference.com/w/cpp/language/exceptions)
  * [try-catch](http://en.cppreference.com/w/cpp/language/try_catch) and 
    [throw](http://en.cppreference.com/w/cpp/language/throw)

### More to explore
* Post from Eric Lippert on [vexing exceptions](https://blogs.msdn.microsoft.com/ericlippert/2008/09/10/vexing-exceptions/)

## Week 4
#### Function pointers and lambda expressions
* Descriptions of [lambda expressions](https://msdn.microsoft.com/en-us/library/dd293608.aspx)
  from Microsoft's MSDN
* From cppreference.com
  * [Lambda functions](http://en.cppreference.com/w/cpp/language/lambda)

## Week 5
#### Linear containers and iterators
* [Chapter 20](http://stroustrup.com/Programming/20_containers.ppt) slides from textbook.
* From cppreference.com
  * C++ Concepts: [Container](http://en.cppreference.com/w/cpp/concept/Container) and 
    [SequenceContainer](http://en.cppreference.com/w/cpp/concept/SequenceContainer)
  * C++ Concepts: [Iterator](http://en.cppreference.com/w/cpp/concept/Iterator) and 
    [ForwardIterator](http://en.cppreference.com/w/cpp/concept/ForwardIterator)
  * [vector::begin()](http://en.cppreference.com/w/cpp/container/vector/begin) and 
    [vector::end](http://en.cppreference.com/w/cpp/container/vector/end)
  * Overview of the [container](http://en.cppreference.com/w/cpp/container) library

## Week 6
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

## Week 7
#### STL algorithms
* [Chapter 21](http://stroustrup.com/Programming/21_algorithms.ppt) slides from textbook.
* From cppreference.com
  * Overview of the [algorithms](http://en.cppreference.com/w/cpp/algorithm) library
  * [std::find](http://en.cppreference.com/w/cpp/algorithm/find) (and find_if), 
    [std::count_if](http://en.cppreference.com/w/cpp/algorithm/count_if)
  * [for_each](http://en.cppreference.com/w/cpp/algorithm/for_each) and 
    [make_heap](http://en.cppreference.com/w/cpp/algorithm/make_heap)
  * [istream_iterator](http://en.cppreference.com/w/cpp/iterator/istream_iterator), 
    [ostream_iterator](http://en.cppreference.com/w/cpp/iterator/ostream_iterator) and 
    [back_inserter](http://en.cppreference.com/w/cpp/iterator/back_inserter)

### More to explore
* Other Algorithm libraries
  * [SGI's STL](http://www.sgi.com/tech/stl/)
  * Boost [algorithms](http://www.boost.org/doc/libs/1_62_0/libs/libraries.htm#Algorithms)

## Week 8
#### Midterm

## Week 9
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

## Week 10
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

## Week 11
#### Class inheritance and polymorphism
* [Chapter 14](http://stroustrup.com/Programming/14_class_design.ppt) slides from textbook.
* [class templates](http://en.cppreference.com/w/cpp/language/class_template) cppreference 
  * Template [parameters and template arguments](http://en.cppreference.com/w/cpp/language/template_parameters) and 
    [template argument deduction](http://en.cppreference.com/w/cpp/language/template_argument_deduction)
* [Inheritance](http://www.cplusplus.com/doc/tutorial/inheritance/) and 
  [Polymorphism](http://www.cplusplus.com/doc/tutorial/polymorphism/) from cplusplus.com

### More to explore
* A good article from Herb Sutter on [virtual functions](http://www.gotw.ca/publications/mill18.htm)

## Week 12
#### Memory management
* [Chapter 17](http://stroustrup.com/Programming/17_free_store.ppt) slides from textbook.
* cppreference.com desriptions of 
  * [unique_ptr](http://en.cppreference.com/w/cpp/memory/unique_ptr) and 
    [memory](http://en.cppreference.com/w/cpp/memory)
  * [static cast](http://en.cppreference.com/w/cpp/language/static_cast), 
    [const cast](http://en.cppreference.com/w/cpp/language/const_cast), 
    [reinterpret cast](http://en.cppreference.com/w/cpp/language/reinterpret_cast), and 
    [dynamic cast](http://en.cppreference.com/w/cpp/language/dynamic_cast),

### More to explore
* [Pointers vs references](http://www.cplusplus.com/articles/ENywvCM9/) from cplusplus.com

## Week 13
#### Copying and moving memory
* [Chapter 18](http://stroustrup.com/Programming/18_arrays.ppt) slides from textbook.
* From cppreference.com: [copy constructors](http://en.cppreference.com/w/cpp/language/copy_constructor) 
  and [copy assignment](http://en.cppreference.com/w/cpp/language/copy_assignment).
* [CppCoreGuidelines](http://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines) 
  summary of 
  [Resource management guidelines](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#S-resource) on GitHub
* [Rule of Five / three / zero](http://en.cppreference.com/w/cpp/language/rule_of_three)

## Week 14
#### Serialization
* From isocpp.org [serialization FAQ](https://isocpp.org/wiki/faq/serialization)
* Boost [serialization](http://www.boost.org/doc/libs/1_62_0/libs/serialization/doc/index.html)

### More to explore
* Review of stream I/O
  * [Ch. 10](http://stroustrup.com/Programming/10_iostreams.ppt) and 
    [Ch. 11](http://stroustrup.com/Programming/11_custom_io.ppt) slides from textbook.
  * [Basic Input/Output](http://www.cplusplus.com/doc/tutorial/basic_io/) and 
    [File I/O](http://www.cplusplus.com/doc/tutorial/files/) from cplusplus.com

## Week 15

## Week 16
#### Final Exam


