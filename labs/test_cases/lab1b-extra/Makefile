lab  := lab1b-extra
srcs := triangle.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2

step2: clean
	c++ $(srcs) ${CXXFLAGS} -o $(exe) 
	$(exe)


