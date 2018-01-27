#include "student.h"
#include "math.h"

#include <iomanip>
#include <iostream>
#include <sstream>
#include <vector>


void add_student(std::vector<student*>* students, std::istringstream& iss) {
    // Your code here. Implement a function to add one student and their grades from the input stream to the vector
}

std::vector<student*> load_classroom() {
    std::string input;
    // Your code here. Init a new classroom
    //
    while (getline(std::cin, input)) {
        std::istringstream stream(input);
        // Your code here. add students to the classroom
        input.clear();
    }
    return classroom;
}

std::ostream& operator<< (std::ostream& os, const std::vector<student*>& rhs) {
    // Your code here. Implement a function to print all students
}

std::ostream& operator<< (std::ostream& os, const student* rhs) {
    // Your code here. Implement a function to print one students
}


