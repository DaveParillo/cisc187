
lab      := lab7b
includes := lab7b.h
srcs     := lab7b.cpp main.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3 step4 step5

step2: clean
	@echo -n "test to_lower: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(lab).cpp -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test operator<<: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(lab).cpp -o $(exe)
	@$(exe) || $(fail)

step4: clean
	@echo -n "test frequency_table: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(lab).cpp -o $(exe)
	@$(exe) || $(fail)

step5: clean
	@echo -n "test print_common: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(lab).cpp -o $(exe)
	@$(exe) || $(fail)


