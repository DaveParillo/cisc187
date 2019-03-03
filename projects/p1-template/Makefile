CXX=g++
CXXFLAGS=-Wall -Wextra -pedantic -std=c++11 
CXXFLAGS+= -I/opt/local/include
CXXFLAGS+= -g


take-away : clean
	${CXX} ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f take-away
