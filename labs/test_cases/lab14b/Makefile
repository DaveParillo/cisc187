
lab      := lab14b
includes := Person.h
srcs     := Person.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

files := $(files) main.cpp Makefile
logfile := $(CURDIR)/step4.txt

check: step1 step4

step4: clean
	@echo -n "test copies: "
	@make copies
	@rm -f $(logfile)
	@valgrind --log-file=$(logfile) $(CURDIR)/copies
	@if [ `grep -wc 'Invalid read' $(logfile)` -eq 0 ]; then $(ok) else $(fail) ; echo "  memory error detected"; fi


