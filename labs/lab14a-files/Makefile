
CXXFLAGS+= -std=c++11 

all: clean point

point : point.o main.o
	c++ ${CXXFLAGS} -o $@ $^

point.o : 
	c++ ${CXXFLAGS} -o $@ -c point.cpp

main.o : 
	c++ ${CXXFLAGS} -o $@ -c main.cpp

clean : 
	rm -f point *.o mydata.txt
