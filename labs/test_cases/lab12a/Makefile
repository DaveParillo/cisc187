lab      := lab12a
includes := Rational.h
srcs     := Rational.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3 step4 step5 step6 step7 step8 step9

step2: clean
	@echo -n "test gcd: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test default construction: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step4: clean
	@echo -n "test 2 argument constructor: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step5: clean
	@echo -n "test to_double: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step6: clean
	@echo -n "test string conversion: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step7: clean
	@echo -n "test ostream overload: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)



