CXX = c++
CXXFLAGS=-Wall -Wextra -pedantic -std=c++11
INCLUDES+=-I/var2/lopt/include
INCLUDES+=-I../../examples

PROGS = assert-lab9a doctest-lab9a
SRCS  = Dog.cpp Clock.cpp Truck.cpp Complex.cpp


all: $(PROGS)

assert-lab9a: $(SRCS)
	${CXX} ${CXXFLAGS} $(SRCS) lab9a-assert.cpp -o $@

doctest-lab9a: $(SRCS)
	${CXX} ${CXXFLAGS} $(INCLUDES) $(SRCS) lab9a-doctest.cpp -o $@

.PHONY: clean test
clean:
	rm -f $(PROGS) 

test: clean doctest-lab9a
	./doctest-lab9a

