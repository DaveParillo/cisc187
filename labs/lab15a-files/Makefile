
CXXFLAGS+= -std=c++11 

all: clean points

points : point.o main.o
	c++ ${CXXFLAGS} -o $@ $^

point.o : 
	c++ ${CXXFLAGS} -o $@ -c point.cpp

main.o : 
	c++ ${CXXFLAGS} -o $@ -c main.cpp

clean : 
	rm -f points *.o mydata.txt
