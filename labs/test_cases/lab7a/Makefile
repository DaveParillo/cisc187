
lab      := lab7a
includes := lab7a.h
srcs     := 

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3 step4

step2: clean
	@echo -n "test contains: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test reverse: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step4: clean
	@echo -n "test equal_to: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)


