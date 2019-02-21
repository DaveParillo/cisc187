ok       := (echo -e "\033[1;32mOK\033[0m")
fail     := (echo -e "\033[1;31mfail\033[0m"; exit 1)
srcs=   ../options.cpp \
		../game.cpp \
		../computer_player.cpp 

objs=$(srcs:%.cpp=%.o)
incl=$(srcs:%.cpp=%.hpp)
ifndef CXXFLAGS
CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif
INCLUDES+=-I../../../examples/ -I/var2/lopt/include

CXXFLAGS+= ${INCLUDES}

files    := $(incl) $(srcs)

PROGS := step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13

.PHONY: clean $(PROGS)

all: ${PROGS}

step1:
	@for f in $(files); do \
		echo -n "verify $$f exists: "; \
		test -r $$f && $(ok) || $(fail); \
	done

step2: clean
	@echo -e "\033[1;32mtest struct mesa::option\033[0m"
	c++ ${CXXFLAGS} ${@}.cpp -o $@ 
	./$@

step3: clean
	@echo -e "\033[1;32mtest usage\033[0m"
	c++ ${CXXFLAGS} ${@}.cpp ../options.cpp -o $@ 
	./$@

step4: clean
	@echo -e "\033[1;32mtest help\033[0m"
	c++ ${CXXFLAGS} ${@}.cpp ../options.cpp -o $@ 
	./$@

step5: clean
	@echo -e "\033[1;32mtest get_options\033[0m"
	c++ ${CXXFLAGS} -Wno-writable-strings ${@}.cpp ../options.cpp -o $@ 
	./$@

clean : 
	rm -rf ${PROGS} *.dSYM






