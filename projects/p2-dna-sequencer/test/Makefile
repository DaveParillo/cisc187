SRCS= ../src/BaseSequence.cpp \
			../src/Editable.cpp \
			../src/FragmentList.cpp \
			../src/Logger.cpp \
			../src/Printable.cpp \
			../src/SequenceType.cpp

OBJS=$(SRCS:%.cpp=%.o)
CXXFLAGS+= -std=c++11 -Wno-c++98-compat
CXXFLAGS+= -I/opt/local/include
LDLIBS+= -lboost_unit_test_framework-mt
LDFLAGS+= -L/opt/local/lib -L../src

all: base frags

frags : test_fragment_list.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

base : test_base_sequence.o $(OBJS)
	c++ ${CXXFLAGS} $(LDFLAGS) -o $@ $^ $(LDLIBS)
	./$@

%.o: %.cpp %.h
	c++ ${CXXFLAGS} -c $< -o $@

clean : 
	rm -f base frags ../src/*.o *.o
