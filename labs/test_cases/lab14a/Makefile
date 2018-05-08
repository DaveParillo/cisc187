
lab      := lab14a
includes := lab14a.h \
						Animal.h Canine.h Cat.h Dog.h Fish.h Owl.h Pet.h RoboDog.h Robot.h Wolf.h
srcs     := lab14a.cpp \
						Fish.cpp Cat.cpp Dog.cpp Owl.cpp RoboDog.cpp Wolf.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

files := $(files) main.cpp
logfile := $(CURDIR)/step6.txt

check: step1 step2 step3 step4 step5 step6

step2: clean
	@echo -n "test make_pets: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)

step3: clean
	@echo -n "test play_with_pets: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step4: clean
	@echo -n "test make_animals: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step5: clean
	@echo -n "test treat_animals: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(srcs) -o $(exe)
	@$(exe) || $(fail)


step6: clean
	@echo -n "test main: "
	@make zoo
	@rm -f $(logfile)
	@valgrind --log-file=$(logfile) $(CURDIR)/zoo
	@if [ `grep -wc 'LEAK' $(logfile)` -eq 0 ]; then $(ok) else $(fail) ; echo "  memory leaks detected"; fi


