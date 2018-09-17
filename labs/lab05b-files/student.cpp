#include "student.h"
#include "average.h"

#include <iomanip>
#include <iostream>
#include <sstream>
#include <vector>


void add_student(std::vector<student*>* students, std::istringstream& iss) {
    // Your code here. 
    // Implement a function to add one student and their grades from the input stream to the vector

}

std::vector<student*> load_classroom() {
    std::string line;
    // Your code here. Init a new classroom
    
    while (getline(std::cin, line)) {
        std::istringstream stream(line);
        // Your code here. add students to the classroom

        line.clear();
    }
    // uncomment the return when you have created something to return
    //return classroom;
}

std::ostream& operator<< (std::ostream& os, const std::vector<student*>& rhs) {
    // Your code here.
    // Implement a function to stream data from a classroom
}

std::ostream& operator<< (std::ostream& os, const student* rhs) {
    // Your code here. 
    // Implement a function to stream data from one student
    // to the output stream
}


