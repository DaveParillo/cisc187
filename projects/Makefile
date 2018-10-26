format=ps
ifeq ($(format),ascii)
	page = -pet -T $(format) -P-c 
else
	page = -pet -T $(format)
endif
uname_s := $(shell uname -s)


define make_pdf
	if [ $(uname_s) = "Darwin" ]; then \
		groff $(page) -ms ../macros.ms -d the_date=`date "+%Y-%m-%d"` $(1) | pstopdf -i -o $(1).pdf; \
	else \
		groff $(page) -ms ../macros.ms -d the_date=`date "+%Y-%m-%d"` $(1) | ps2pdf - $(1).pdf; \
	fi
endef

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
	$(call make_pdf,$$i) \
	done


clean:
	rm -f *.ascii
	rm -f *.pdf

