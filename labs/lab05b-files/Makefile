ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif

CXXFLAGS+= -g


.PHONY clean test

pointers: clean
	c++ ${CXXFLAGS} -o grades main.cpp math.cpp student.cpp

clean: 
	rm -f grades 

test: 
	./grades < grades.txt

