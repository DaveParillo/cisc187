ifndef CXXFLAGS
CXXFLAGS=-Wall -Wextra -pedantic -std=c++11
endif

copies :  clean
	c++ ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f copies *.o
