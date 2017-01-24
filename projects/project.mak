# This file is simplistic enough to be used for all 3 projects
# It's not very efficient, but is simple
CXX=c++
CXXFLAGS+=-Wall -Wextra -pedantic -std=c++11 
CXXFLAGS+= -I/opt/local/include

calc : clean
	${CXX} ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f calc *.o
