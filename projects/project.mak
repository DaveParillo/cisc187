# This file is simplistic enough to be used for all 3 projects
# It's not very efficient, but is simple
CXX=c++
ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif

CXXFLAGS+= -I/opt/local/include
CXXFLAGS+= -I/var2/lopt/include

PROG := project

$(PROG) : clean
	${CXX} ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f $(PROG) *.o
