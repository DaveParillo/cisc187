lab  := lab2a
srcs := lab2a.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3

step2: clean
	c++ $(srcs) ${CXXFLAGS} -o $(exe) 

step3:
	@/var2/lopt/share/cisc187/$(lab)/check $(exe)


