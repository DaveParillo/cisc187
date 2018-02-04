CXX = c++
ifndef CXXFLAGS
	CXXFLAGS = -Wall -Wextra -pedantic -std=c++11
endif

CXXFLAGS+=-I..

PROGS = add \
		call-stack \
		define \
		echo \
		passing-parameters \
		passing-parameters-test \
		simple-parameter \
		static-variables \
		static-variables-test \
		void-func

all: $(PROGS)

clean:
		rm -f $(PROGS)

