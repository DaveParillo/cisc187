format=ps
o=week
ifeq ($(format),ascii)
	PAGE = -pet -T $(format) -P-c -ms slides.ms 
else
#	Currently using 4x3 output.
#	Change page to  -P-p13.33i,7.5i to produce 16x9 output
	#PAGE = -pet -T $(format) -P-l -P-p9,7.5i -ms slides.ms 
	PAGE = -pet -T $(format) -P-l -P-p11.5i,8.5i -mspdf slides.ms 
endif

all: welcome slides

.PHONY: clean


grades:
	tbl ../grading-criteria.ms > ../grading-criteria.tbl


welcome:
	make grades
	if [ $(format) = "ascii" ]; then \
		groff $(PAGE) welcome.ms > $@.$(format); \
	else \
		groff $(PAGE) welcome.ms | ps2pdf - welcome.pdf; \
	fi 

slides:
	for i in `/bin/ls $(o)*.ms`; do \
		if [ $(format) = "ascii" ]; then \
			groff $(PAGE) $$i > $$i.$(format); \
		else \
			groff $(PAGE) $$i | ps2pdf - $$i.pdf; \
		fi \
	done

clean:
	rm -f ../grading-criteria.tbl
	rm -f *.ascii
	rm -f *.pdf
	rm -f *.ps

