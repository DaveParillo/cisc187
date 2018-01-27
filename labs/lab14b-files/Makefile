
CXXFLAGS+=-Wall -Wextra -pedantic -std=c++11 -Wno-c++98-compat -Wno-padded -Wno-weak-vtables
#CXXFLAGS+= -std=c++11 

copies :  clean
	c++ ${CXXFLAGS} -o $@ *.cpp

clean : 
	rm -f copies *.o
