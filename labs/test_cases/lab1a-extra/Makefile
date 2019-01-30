lab  := lab1a-extra
srcs := hello.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

LDLIBS  +=-lboost_program_options-mt
# macports paths
LDFLAGS +=-L/opt/local/lib
INCLUDES+=-L/opt/local/includes

check: check_env step1 step2 step3

check_env:
	@echo -n "verify path set: "
	@(echo ${PATH} | grep -c '/var2/lopt/bin') && $(ok)  || $(fail)
	@echo -n "verify CXXFLAGS set: "
	@(echo ${CXXFLAGS} | grep -c 'std=c++11') && $(ok) || $(fail)


step2:
	c++ $(srcs) ${CXXFLAGS} ${LDLIBS} ${LDFLAGS} ${INCLUDES}  -o $(exe) 

step3:
	@echo -e "\033[1;32mtest 'hello -h'\033[0m:"
	@$(exe) -h
	@echo -e "\033[1;32mtest 'hello' default output\033[0m:"
	@$(exe)
	@echo -e "\033[1;32mtest 'hello -r 1'\033[0m:"
	@$(exe) -r 1
	@echo -e "\033[1;32mtest 'hello -r 3'\033[0m:"
	@$(exe) -r 3
	@echo -e "\033[1;32mtest 'hello -r 8'\033[0m:"
	@$(exe) -r 8
	@echo -e "\033[1;32mtest 'hello -n Alice'\033[0m:"
	@$(exe) -n Alice
	@echo -e "\033[1;32mtest 'hello -n Blair'\033[0m:"
	@$(exe) -n Blair
	@echo -e "\033[1;32mtest 'hello -n Cassandra'\033[0m:"
	@$(exe) -n Cassandra
	@echo -e "\033[1;32mtest 'hello -n Alice -r 2'\033[0m:"
	@$(exe) -n Alice -r 2
	@echo -e "\033[1;32mtest 'hello -n Blair -r 4'\033[0m:"
	@$(exe) -n Blair -r 4
	@echo -e "\033[1;32mtest 'hello -n Cassandra -r 6'\033[0m:"
	@$(exe) -n Cassandra -r 6
  



