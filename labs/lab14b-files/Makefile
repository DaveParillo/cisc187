ifndef CXX
	CXX=clang++
endif
ifndef CXXFLAGS
CXXFLAGS=-Wall -Wextra -pedantic -std=c++11
endif

copies :  clean
	${CXX} ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f copies *.o
