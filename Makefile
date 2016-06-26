

all: grades syllabus template 

.PHONY: clean


grades: grading-criteria.ms
	tbl grading-criteria.ms > grading-criteria.tbl


syllabus: syllabus.ms
	groff -pet -T pdf -ms slides $< > $@.pdf

template: pogil-template.ms
	groff -pet -dthe_date=`date "+%Y-%m-%d"` -T pdf -ms slides $< > $@.pdf

clean:
	rm -f grading-criteria.tbl
	rm -f *.pdf

