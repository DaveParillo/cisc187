ifndef CXX
CXX = g++
endif
ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif



zoo :  clean
	${CXX} ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f zoo *.o
