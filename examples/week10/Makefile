CXXFLAGS=-Wall -Wextra -pedantic -std=c++11 -Wno-c++98-compat

hello : clean
	c++ ${CXXFLAGS} -o $@ Hello.cpp main.cpp

clean : 
	rm -f hello *.o
