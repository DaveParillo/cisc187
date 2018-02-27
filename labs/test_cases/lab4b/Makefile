
lab      := lab4b
includes :=
srcs     := lab4b.h

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3 step4 step5

step2: clean
	@echo -n "test circle area: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test perimeter: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp -o $(exe)
	@$(exe) || $(fail)

step4: clean
	@echo -n "test apothem: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp -o $(exe)
	@$(exe) || $(fail)

step5: clean
	@echo -n "test polygon area: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp -o $(exe)
	@$(exe) || $(fail)

