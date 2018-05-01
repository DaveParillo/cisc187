SRCS=   ../Add.cpp \
		../BigInt.cpp \
		../Calc.cpp \
		../Multiply.cpp \
		../OperandPusher.cpp \
		../Power.cpp

OBJS=$(SRCS:%.cpp=%.o)
ifndef CXXFLAGS
CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif
INCLUDES+=-I../../../examples/ -I/var2/lopt/include

CXXFLAGS+= ${INCLUDES}

PROGS := step1 step2 step3

all: ${PROGS}

step1: clean
	c++ ${CXXFLAGS} ${@}.cpp ../BigInt.cpp -o $@ 

step2: clean
	c++ ${CXXFLAGS} ${@}.cpp ../BigInt.cpp -o $@ 

step3: clean
	c++ ${CXXFLAGS} ${@}.cpp ../BigInt.cpp -o $@ 

clean : 
	rm -f ${PROGS}

