
lab  := lab3a
srcs := lab3a.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3

step2: clean
	c++ $(srcs) ${CXXFLAGS} -o $(exe) 


step3:
	@echo -e "\033[1;32mswap tests\033[0m:"
	@echo -e "\033[1;32m{2, 987} => {a: 988, b: 3}\033[0m:"
	@$(exe) -a 2 -b 987
	@echo -e "\033[1;32m{3, 610} => {a: 611, b: 4}\033[0m:"
	@$(exe) -a 3 -b 610
	@echo -e "\033[1;32m{5, 377} => {a: 378, b: 6}\033[0m:"
	@$(exe) -a 5 -b 377
	@echo -e "\033[1;32m{8, 233} => {a: 234, b: 9}\033[0m:"
	@$(exe) -a 8 -b 233
	@echo -e "\033[1;32m{13, 144} => {a: 145, b: 14}\033[0m:"
	@$(exe) -a 13 -b 144
	@echo -e "\033[1;32m{21, 89} => {a: 90, b: 22}\033[0m:"
	@$(exe) -a 21 -b 89
	@echo -e "\033[1;32m{34, 55} => {a: 56, b: 35}\033[0m:"
	@$(exe) -a 34 -b 55

