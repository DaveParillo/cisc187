
lab      := lab9b
includes := lab9b.h
srcs     := main.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3 step4 step5

step2: clean
	@echo -n "test fill_n: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test append_n: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step4: clean
	@echo -n "test copy_if: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step5: clean
	@echo -n "test print_if: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)


