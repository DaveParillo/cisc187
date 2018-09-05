#
# A slightly more complicated makefile
# This makefile has the added benefit of compiling more quickly
# than the project.mak makefile
# It tracks dependencies better
#

# change this to be the name of your program
TARGET := project

# list all your cpp files here (not .h)
src    := main.cpp

### should not need to edit anything below this line ###

obj    := $(src:.cpp=.o)
dep    := $(obj:.o=.d)
CXX    := g++
HEADERS:= $(wildcard *.o)

ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif
ifndef CFLAGS
	CFLAGS = -Wall -Wextra -pedantic -std=c11
endif

INCLUDES += -I/var2/lopt/include
LDFLAGS  += -lm

.PHONY: clean cleandep

all: $(TARGET)

-include $(dep)   # include all dep files in the makefile

$(TARGET): $(obj)
	${CXX} ${CXXFLAGS} ${INCLUDES}  -o $@ $^ ${LDFLAGS}

%.o: %.cpp
	${CXX} ${CXXFLAGS} ${INCLUDES}  -c $< -o $@

%.d: %.cpp
	${CXX} ${CXXFLAGS} ${INCLUDES} $< -MM -MT $(@:.d=.o) >$@

cleanall: clean cleandep

clean:
	rm -f $(TARGET) $(obj)

cleandep:
	rm -f $(dep)

