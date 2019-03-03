
lab      := lab10a
includes := $(lab).h
srcs     := $(lab).cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

files     := $(files) main.cpp

check: step1 step2 step3 

step2: clean
	@echo -n "test make_vector: "
	@${CXX} ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step3: clean
	@echo -n "test expunge: "
	@${CXX} ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)



