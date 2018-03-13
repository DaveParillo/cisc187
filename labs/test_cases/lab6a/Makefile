
lab      := lab6a
includes := lab6a.h
src      := lab6a.cpp
srcs     := lab6a.cpp main.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk


check: step1 step2 step3 step4 step5

step2: clean
	@echo -n "test count_if: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test is_odd: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step4: clean
	@echo -n "test greater: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)

step5: clean
	@echo -n "test greater sort: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
	@$(exe) || $(fail)



