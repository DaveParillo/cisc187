
lab      := lab11a
includes := $(lab).h
srcs     := $(lab).cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk


step2: clean
	@echo -n "test clock: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step3: clean
	@echo -n "test complex: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step4: clean
	@echo -n "test truck: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step5: clean
	@echo -n "test dog: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)




