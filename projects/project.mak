# This file is simplistic enough to be used for all 3 projects
# It's not very efficient, but is simple

# change to be the name of your program
TARGET := project

### No need to change anything below this line ###

CXX=c++
ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif

CXXFLAGS+= -I/opt/local/include
CXXFLAGS+= -I/var2/lopt/include

$(TARGET) : clean
	${CXX} ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f $(TARGET) *.o
