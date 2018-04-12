
lab      := lab10b
includes := $(lab).h
srcs     := $(lab).cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2

step2: clean
	@echo -n "test add: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


