
lab      := lab5b
includes := average.h student.h
srcs     := average.cpp student.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

files := $(files) class.txt Makefile main.cpp

check: step1 step2 step3 step4 step5 step6

step2: clean
	@echo -n "test average: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test print student: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	-@$(exe)

step4: clean
	@echo -n "test print classroom: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	-@$(exe)

step5: clean
	@echo -n "test add student: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step6: clean
	@echo -n "test load classroom: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)




