SLIDES = welcome
PAGE= -pet -T pdf -P-l -P-p9,7.5i -ms slides.ms 


all: welcome

.PHONY: clean


grades:
	tbl ../grading-criteria.ms > ../grading-criteria.tbl


welcome:
	make grades
#	groff -pet -Tpdf -P-l -P-p13.33i,7.5i -ms slides $< > $@_16x9.pdf
	groff $(PAGE) welcome.ms > $@.pdf
week1:
	groff $(PAGE) week1.ms > $@.pdf

clean:
	rm -f ../grading-criteria.tbl
	rm -f *.pdf

