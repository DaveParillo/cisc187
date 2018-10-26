format=ps
o=lab
ifeq ($(format),ascii)
	page = -pet -T $(format) -P-c 
else
	page = -pet -T $(format) -mspdf
endif
uname_s := $(shell uname -s)

all:  roles labs


help:
	@echo Document generating makefile:
	@echo
	@echo "     'make'              will generate all documents in PDF format"
	@echo "     'make format=ascii' will generate all documents as formatted text"
	@echo

.PHONY: clean

define make_pdf
	if [ $(uname_s) = "Darwin" ]; then \
		groff $(page) ../macros.ms -d the_date=`date "+%Y-%m-%d"` $(1) | pstopdf -i -o $(1).pdf; \
	else \
		groff $(page) ../macros.ms -d the_date=`date "+%Y-%m-%d"` $(1) | ps2pdf - $(1).pdf; \
	fi
endef


roles: roles.ms
	tbl roles.ms > roles.tbl

labs: roles
	for i in `/bin/ls $(o)*.ms`; do \
	$(call make_pdf,$$i) \
	done


zip:
	for i in `find . -type d -name "lab*"`; do \
	zip -r $$i.zip $$i -x "*.DS_Store*"; \
	done


clean:
	rm -f roles.tbl
	rm -f *.ascii
	rm -f *.pdf

