SRCS=../BigInt.cpp \
		../calc.cpp

OBJS=$(SRCS:%.cpp=%.o)
CXXFLAGS+= -std=c++11 -Wno-c++98-compat -Wno-unused-parameter
CXXFLAGS+= -I/opt/local/include
LDLIBS+= -lboost_unit_test_framework-mt
LDFLAGS+= -L/opt/local/lib -L..

all: add multiply power

add : test_add.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

multiply : test_multiply.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

power : test_power.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

%.o: %.cpp %.h
	c++ ${CXXFLAGS} -c $< -o $@

clean : 
	rm -f add multiply power ../*.o *.o





