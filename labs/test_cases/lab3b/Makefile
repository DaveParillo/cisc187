
lab      := lab3b
includes := lab3b.h
srcs     := lab3b.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3 step4 step5 step6

step2: clean
	@echo -n "test make_triple: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(srcs) -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test scale trigon: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(srcs) -o $(exe)
	@$(exe) || $(fail)

step4: clean
	@echo -n "test trigon area: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(srcs) -o $(exe)
	@$(exe) || $(fail)

step5: clean
	@echo -n "test find smallest trigon: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(srcs) -o $(exe)
	@$(exe) || $(fail)

step6: clean
	@echo -n "test find first word: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(srcs) -o $(exe)
	@$(exe) || $(fail)




