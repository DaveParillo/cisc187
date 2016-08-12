SRCS= Book.cpp \
		 Date.cpp

OBJS=$(SRCS:%.cpp=%.o)
#CXXFLAGS+=-Wall -Weverything -pedantic -std=c++11 -Wno-c++98-compat
CXXFLAGS+= -std=c++11 -Wno-c++98-compat
CXXFLAGS+= -I/usr/include
LDLIBS+= -lboost_unit_test_framework-mt
LDFLAGS+= -L/usr/lib

hello : test_hello.o
	c++ ${CXXFLAGS} -c test_hello.cpp
	c++ ${CXXFLAGS} $(LDFLAGS) -o hello $< $(LDLIBS)
	./$@

date : test_date.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

book : test_book.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

%.o: %.cpp %.h
	c++ ${CXXFLAGS} -c $<

clean : 
	rm -f hello date book *.o
