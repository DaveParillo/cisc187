format=pdf
ifeq ($(format),ascii)
	PAGE = -pet -T $(format) -P-c -ms slides.ms 
else
#	Currently using 4x3 output.
#	Change page to  -P-p13.33i,7.5i to produce 16x9 output
	PAGE = -pet -T $(format) -P-l -P-p9,7.5i -ms slides.ms 
endif

all: welcome slides

.PHONY: clean


grades:
	tbl ../grading-criteria.ms > ../grading-criteria.tbl


welcome:
	make grades
	groff $(PAGE) welcome.ms > $@.$(format)

slides:
	for i in `/bin/ls week*.ms`; do \
	groff $(PAGE) $$i > $$i.$(format); \
	done

clean:
	rm -f ../grading-criteria.tbl
	rm -f *.ascii
	rm -f *.pdf

