#include <iostream>

#include "Person.h"

Person::~Person(){ 
}


Person::Person(const Person& p)
{
}

Person& Person::operator=(const Person& p)
{
}


std::ostream& operator<<(std::ostream& os, Person& p)
{
}

