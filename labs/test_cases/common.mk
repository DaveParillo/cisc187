ok       := (echo -e "\033[1;32mOK\033[0m")
fail     := (echo -e "\033[1;31mfail\033[0m"; exit 1)

files    := $(includes) $(srcs)
exe      := $(CURDIR)/test_$(lab).exe

CHECK_HOME:=/var2/lopt/share/cisc187
CXXFLAGS = -std=c++11 -Wall -Wextra -pedantic 
CXXFLAGS+= -I/var2/lopt/include -I$(CURDIR)

all: check

.PHONY: clean check step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 tbd

clean:
	@rm -f $(exe)

tbd:
	@echo "A check for this lab is coming soon"

submit: step1
	turnitin-lab $(lab) $(files)


step1:
	@for f in $(files); do \
		echo -n "verify $$f exists: "; \
		test -r $$f && $(ok) || $(fail); \
	done


