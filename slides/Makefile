format=ps
o=week
uname_s := $(shell uname -s)

ifeq ($(format),ascii)
	PAGE = -pet -T $(format) -P-c -ms slides.ms 
else
#	Currently using 4x3 output.
#	Change page to  -P-p13.33i,7.5i to produce 16x9 output
	#PAGE = -pet -T $(format) -P-l -P-p9,7.5i -ms slides.ms 
	PAGE = -pet -T $(format) -P-l -P-p11.5i,8.5i -mspdf slides.ms 
endif

all: welcome slides final-prep

.PHONY: clean


grades:
	tbl ../grading-criteria.ms > ../grading-criteria.tbl

define make_pdf
	if [ $(uname_s) = "Darwin" ]; then \
		groff $(PAGE) $(1) | pstopdf -i -o $(1).pdf; \
	else \
		groff $(PAGE) $(1) | ps2pdf - $(1).pdf; \
	fi
endef

welcome: grades
	$(call make_pdf,$@.ms)

final-prep:
	$(call make_pdf,$@.ms)

slides:
	for i in `/bin/ls $(o)*.ms`; do \
		if [ $(format) = "ascii" ]; then \
			groff $(PAGE) $$i > $$i.$(format); \
		else \
	        $(call make_pdf,$$i) \
		fi \
	done

clean:
	rm -f ../grading-criteria.tbl
	rm -f *.ascii
	rm -f *.pdf
	rm -f *.ps

