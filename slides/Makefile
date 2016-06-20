SLIDES = welcome



all: welcome

.PHONY: clean


grades: ../grading-criteria.ms
	tbl ../grading-criteria.ms > ../grading-criteria.tbl


welcome: welcome.ms ../grading-criteria.ms
#	groff -pet -Tpdf -P-l -P-p13.33i,7.5i -ms slides $< > $@_16x9.pdf
#	groff -pet -Tpdf -P-l -P-p10,7.5i -ms slides $< > $@_4x3.pdf
	groff -pet -Tpdf -P-l -P-p10,7.5i -ms slides $< > $@.pdf

clean:
	rm -f ../grading-criteria.tbl
	for f in $(SLIDES).pdf; do \
		rm -f $(f); \
	done

