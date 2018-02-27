
lab      := lab5a
includes := lab5a.h
srcs     := lab5a.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

files     := $(files) main.cpp

check: step1 step2 step3 step4 step5

step2: clean
	@echo -n "test to_lower: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step3: clean
	@echo -n "test copy: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step4: clean
	@echo -n "test count: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step5: clean
	@echo -n "test find: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)



