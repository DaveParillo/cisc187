format=pdf
o=lab
ifeq ($(format),ascii)
	page = -pet -T $(format) -P-c 
else
	page = -pet -T $(format)
endif

all:  roles labs


help:
	@echo Document generating makefile:
	@echo
	@echo "     'make'              will generate all documents in PDF format"
	@echo "     'make format=ascii' will generate all documents as formatted text"
	@echo

.PHONY: clean

roles: roles.ms
	tbl roles.ms > roles.tbl

labs:
	for i in `/bin/ls $(o)*.ms`; do \
	groff $(page) -ms ../macros.ms -d the_date=`date "+%Y-%m-%d"` $$i > $$i.$(format); \
	done


zip:
	for i in `find . -type d -name "lab*"`; do \
	zip -r $$i.zip $$i -x "*.DS_Store*"; \
	done


clean:
	rm -f roles.tbl
	rm -f *.ascii
	rm -f *.pdf

