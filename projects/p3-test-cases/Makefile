ok       := (echo -e "\033[1;32mOK\033[0m")
fail     := (echo -e "\033[1;31mfail\033[0m"; exit 1)
srcs=   ../Add.cpp \
		../BigInt.cpp \
		../Calc.cpp \
		../Multiply.cpp \
		../OperandPusher.cpp \
		../Power.cpp

objs=$(srcs:%.cpp=%.o)
incl=$(srcs:%.cpp=%.h)
ifndef CXXFLAGS
CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif
INCLUDES+=-I../../../examples/ -I/var2/lopt/include

CXXFLAGS+= ${INCLUDES}

files    := $(incl) $(srcs)

.PHONY: clean step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12

PROGS := step1 step2 step3 step4

all: ${PROGS}

step1:
	@for f in $(files); do \
		echo -n "verify $$f exists: "; \
		test -r $$f && $(ok) || $(fail); \
	done



step2: clean
	c++ ${CXXFLAGS} ${@}.cpp ../BigInt.cpp -o $@ 
	./$@

step3: clean
	c++ ${CXXFLAGS} ${@}.cpp ../BigInt.cpp -o $@ 
	./$@

step4: clean
	c++ ${CXXFLAGS} ${@}.cpp ../BigInt.cpp -o $@ 
	./$@

clean : 
	rm -f ${PROGS}






