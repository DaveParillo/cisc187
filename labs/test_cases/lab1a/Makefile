lab  := lab1a
srcs := hello.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: check_env step1 step2 step3

.PHONY: clean check_env check step1 step2 step3

check_env:
	@echo -n "verify path set: "
	@(echo ${PATH} | grep -c '/var2/lopt/bin') && $(ok)  || $(fail)
	@echo -n "verify CXXFLAGS set: "
	@(echo ${CXXFLAGS} | grep -c 'std=c++11') && $(ok) || $(fail)

step2: clean
	c++ $(srcs) ${CXXFLAGS} -o $(exe) 
	@echo -n "verify $(srcs) compiled: "
	@test -x $(exe) && $(ok) || $(fail)

step3: 
	@echo -n "verify $(srcs) says 'hello, world!' (case insensitive): "
	@($(exe) | grep -iw -c 'hello, world!') && $(ok) || $(fail)
	@echo -n "verify $(srcs) says 'Hello, world!' (correct case and whitespace): "
	@($(exe) | grep -c 'Hello, world!') && $(ok) || $(fail)



