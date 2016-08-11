CISC-187 Introduction to Programming
====================================

Although at Mesa, this course is described as "Data Structures in C++",
it's a typical second semester C++ programming course.

The course focuses on proficiency in modern C++.

This repository contains all of the course documentation, 
lab assignments, projects, and lecture slides.

Format for printed material
---------------------------
Presentations and lab instructions are stored as *troff* documents using the *ms* macro package.

To generate a typical lab assignment for printing:

    groff -pet -Tpdf -ms lab1.ms > lab1.pdf


To generate a typical lab assignment for viewing on the mesa server, type:

    groff -pet -Tascii -ms lab1.ms | less

To generate a pdf of all labs or slides, *cd* to the appropriate directory and type:

    make


