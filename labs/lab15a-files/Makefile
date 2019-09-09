ifndef CXX
	CXX=g++
endif
ifndef CXXFLAGS
CXXFLAGS= -std=c++11 
endif

all: clean points

points : point.o main.o
	${CXX} ${CXXFLAGS} -o $@ $^

point.o : 
	${CXX} ${CXXFLAGS} -o $@ -c point.cpp

main.o : 
	${CXX} ${CXXFLAGS} -o $@ -c main.cpp

clean : 
	rm -f points *.o mydata.txt
