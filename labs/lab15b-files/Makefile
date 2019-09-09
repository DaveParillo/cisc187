ifndef CXX
CXX = g++
endif
ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif
LDLIBS+=-lboost_serialization-mt

zoo :  clean
	${CXX} ${CXXFLAGS} ${LDLIBS} -o $@ *.cpp

clean : 
	rm -f zoo *.o
