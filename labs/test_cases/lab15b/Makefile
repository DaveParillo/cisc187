
lab      := lab15a
includes := lab15a.h \
						Animal.h Canine.h Cat.h Dog.h Fish.h Owl.h Pet.h RoboDog.h Robot.h Wolf.h zoo.h
srcs     := lab15a.cpp \
						Fish.cpp Cat.cpp Dog.cpp Owl.cpp RoboDog.cpp Wolf.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

files := $(files) main.cpp

check: step1 step2 step3 step4 step5

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


