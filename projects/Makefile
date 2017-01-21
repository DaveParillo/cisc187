format=pdf
ifeq ($(format),ascii)
	page = -pet -T $(format) -P-c 
else
	page = -pet -T $(format)
endif

all:  projects


help:
	@echo Document generating makefile:
	@echo
	@echo "     'make'              will generate all documents in PDF format"
	@echo "     'make format=ascii' will generate all documents as formatted text"
	@echo

.PHONY: clean

projects:
	for i in `/bin/ls *.ms`; do \
	groff $(page) -ms ../macros.ms -d the_date=`date "+%Y-%m-%d"` $$i > $$i.$(format); \
	done


clean:
	rm -f *.ascii
	rm -f *.pdf

