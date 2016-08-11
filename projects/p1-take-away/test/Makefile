SRCS= ../src/ComputerPlayer.cpp 

OBJS=$(SRCS:%.cpp=%.o)
CXXFLAGS+= -std=c++11 -Wno-c++98-compat
CXXFLAGS+= -I/opt/local/include
LDLIBS+= -lboost_unit_test_framework-mt
LDFLAGS+= -L/opt/local/lib

ai : test_ai.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

%.o: %.cpp %.h
	c++ ${CXXFLAGS} -c $< -o ../src/$@


clean : 
	rm -f ai ../src/*.o *.o
