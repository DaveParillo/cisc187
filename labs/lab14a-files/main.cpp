#include <iostream>
#include <memory>
#include <vector>

#include "Animal.h"
#include "Cat.h"
#include "Dog.h"
#include "Fish.h"
#include "Owl.h"
#include "Wolf.h"
#include "Pet.h"
#include "RoboDog.h"

using std::vector;
using std::unique_ptr;

void play_with(Pet* p);
void give_shot(const unique_ptr<Animal>& a);

void play_with_pets(vector<Pet*>& pets);
void treat_animals (vector<unique_ptr<Animal>>& animals);

int main () 
{
  //declare a vector of raw pointers of Pet objects
  vector<_________> pets;
  play_with_pets(pets);
  
  // write a loop that plays with a RoboDog 5 more times
  // and then prints the charge remaining
  //
  // Do not make a new RoboDog.
  // Use the RoboDog in pets


  //declare a vector of unique_ptr pointers of Animal objects
  vector<___________> animals;
  treat_animals(animals);

  return 0;
}

// implement this method:
//
// 1. Add at least a Cat, Dog, Fish, and RoboDog to the vector
// 2. Write a loop to play with each pet at least once
//    Call play_with for each pet
// 3. In your loop print out the memory address of each Pet
//
void play_with_pets(vector<Pet*>& pets)
{
}


// implement this method:
// 1. Print out the name of the pet you are playing with
//    and the memory address of the Pet
// 2. call the pet play() function
void play_with(Pet* p)
{
}


// implement this method:
//
// 1. Add at least a Cat, Dog, Fish, and Wolf to the vector
// 2. Write a loop to give each animal a shot
//    Call give_shot for each animal
// 3. In your loop print out the memory address of each Animal
//

void treat_animals (vector<unique_ptr<Animal>>& animals)
{

}


// implement this method:
// 1. Print out the name of the animal getting a shot
//    and the memory address of the animal
// 2. call the animal make_sound() function
void give_shot(const unique_ptr<Animal>& a)
{
}
