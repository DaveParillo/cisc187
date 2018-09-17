ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif

CXXFLAGS+= -g


.PHONY: clean test

grades: clean
	c++ ${CXXFLAGS} -o grades main.cpp average.cpp student.cpp

clean: 
	rm -f grades 

test: 
	./grades < class.txt

