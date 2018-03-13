
lab      := lab6b
includes := 
srcs     := lab6b.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk


check: step1 step2 step3


step2:
	@echo -n "remove 'using' alias: "
	@if [ `grep -wc '^using transform' $(srcs)` -eq 0 ]; then $(ok) else $(fail) fi

#step3: clean
#	@echo -n "test render_text: "
#	@c++ ${CXXFLAGS} $(CHECK_HOME)/$(lab)/$@.cpp $(src) -o $(exe)
#	@$(exe) || $(fail)


