part1_includes := abs.h
part2_includes := square.h simple-parameter.h
part1_srcs := abs.cpp
part2_srcs := square.cpp simple-parameter.cpp
lab      := lab4a
includes := $(part1_includes) $(part2_includes)
srcs     := $(part1_srcs) $(part2_srcs)
filesp1     := $(part1_srcs) $(part1_includes)
filesp2     := $(part2_srcs) $(part2_includes)

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: part1 part2

#part1: step1p1 step2p1
part1: step1p1

part2: step1p2 step2p2 step3p2


step1p1:
	@for f in $(filesp1); do \
		echo -n "verify $$f exists: "; \
		test -r $$f && $(ok) || $(fail); \
	done

step1p2:
	@for f in $(filesp2); do \
		echo -n "verify $$f exists: "; \
		test -r $$f && $(ok) || $(fail); \
	done

step2p1: clean
	@echo -n "test abs overloads: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(CURDIR)/$(part1_srcs) -o $(exe)
	@$(exe) || $(fail)


step2p2: clean
	@echo -n "test printFavorite: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp -o $(exe)
	@$(exe) || $(fail)


step3p2: clean
	@echo -n "test square: "
	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp -o $(exe)
	@$(exe) || $(fail)


