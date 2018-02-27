lab  := lab1a-extra
srcs := hello.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

LDLIBS  +=-lboost_program_options-mt
# macports paths
LDFLAGS +=-L/opt/local/lib
INCLUDES+=-L/opt/local/includes

check: check_env step1 step2 step3

check_env:
	@echo -n "verify path set: "
	@(echo ${PATH} | grep -c '/var2/lopt/bin') && $(ok)  || $(fail)
	@echo -n "verify CXXFLAGS set: "
	@(echo ${CXXFLAGS} | grep -c 'std=c++11') && $(ok) || $(fail)


step2:
	c++ $(srcs) ${CXXFLAGS} ${LDLIBS} ${LDFLAGS} ${INCLUDES}  -o $(exe) 

step3:
	@/var2/lopt/share/cisc187/$(lab)/check $(exe)


