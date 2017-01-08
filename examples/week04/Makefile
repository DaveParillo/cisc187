CXXFLAGS=-Wall -Wextra -pedantic -std=c++11 -Wno-c++98-compat

hello : clean
	c++ ${CXXFLAGS} -o $@ Hello.cpp main.cpp

enum : clean
	c++ ${CXXFLAGS} -o $@ Direction.cpp enum.cpp

clean : 
	rm -f enum hello *.o
