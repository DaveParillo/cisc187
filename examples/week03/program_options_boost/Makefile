CXXFLAGS+=-Wall -Wextra -pedantic -std=c++11
INCLUDES+=-I/opt/local/include
LDFLAGS+=-L/opt/local/lib
LDLIBS+=-lboost_program_options-mt

hello : clean
	${CXX} ${CXXFLAGS} ${LDLIBS} ${LDFLAGS} ${INCLUDES} -o $@ *.cpp

.PHONY : clean
clean : 
	rm -f hello *.o
