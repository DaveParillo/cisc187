lab  := lab2a
srcs := lab2a.cpp

# common.mk includes step1 (checks $files)
include /var2/lopt/share/cisc187/common.mk

check: step1 step2 step3 step4 step5 step6 step7

step2: clean
	c++ ${CXXFLAGS} ${srcs} -o ${exe}

step3:
	@echo -e "\033[1;32mprint 1 string 'as is'\033[0m:"
	@$(exe) hello

step4:
	@echo -e "\033[1;32mprint a long string with spaces 'as is'\033[0m:"
	@$(exe) "twas bryllyg, and Ye slythy toves Did gyre and gymble in ye wabe"

step5:
	@echo -e "\033[1;32mCapitalize the first letter in a sentence\033[0m:"
	@$(exe) "the rain in spain lays mainly on the plain."

step6:
	@echo -e "\033[1;32mFormat a phone number\033[0m:"
	@$(exe) 5558675309

step7:
	@echo -e "\033[1;32mPrint a name, Lastname, first initial\033[0m:"
	@$(exe) "alex stepanov"


