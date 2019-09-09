#include "Animal.h"
#include "Cat.h"
#include "Dog.h"
#include "Fish.h"
#include "Owl.h"
#include "Wolf.h"
#include "Pet.h"
#include "RoboDog.h"

#include <fstream>
#include <iostream>
#include <memory>
#include <unistd.h>
#include <vector>

using std::vector;
using std::unique_ptr;

#include <boost/serialization/export.hpp>
#include <boost/archive/text_oarchive.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/serialization/vector.hpp>

// Inform boost that our Pet and Animal classes are virtual
// These and the EXPORT macros must appear AFTER 
// all boost/archive headers
// BOOST_SERIALIZATION_ASSUME_ABSTRACT(Animal)
// BOOST_SERIALIZATION_ASSUME_ABSTRACT(Pet)

// Any source module that contains serialization code
// and is serializing a derived class not explicitly referred to in this file
// BOOST_CLASS_EXPORT(Cat)
// BOOST_CLASS_EXPORT(Dog)
// BOOST_CLASS_EXPORT(Fish)
// BOOST_CLASS_EXPORT(Wolf)
// BOOST_CLASS_EXPORT(RoboDog)

  
static void usage(const char* name) {
  std::cerr << "Usage: " << name << " [-h] [-r|w] [-f filename]\n";
}

static void help (const char* name) {
  usage(name);
  std::cerr << "Options:\n"
    << "  -h   Show this text\n"
    << "  -r   Read from a serialization file.\n"
    << "  -w   Write to a serialization file.\n"
    << "  -f   Set the (de)serialization filename.  Default = 'zoo.txt'.\n"
    << std::endl;
  exit(0);
}

void create_and_serialize (std::string fname);
void deserialize_and_display (std::string fname);

int main (int argc, char** argv) {
  int c;
  std::string fname = "zoo.txt";
  bool save_zoo = true;
  while ((c = getopt (argc, argv, "hrwf:")) != -1) {
    switch (c) {
      case 'f':
        fname = optarg;
        break;
      case 'w':
        save_zoo = true;
        break;
      case 'r':
        save_zoo = false;
        break;
      case 'h':
        help(argv[0]);
        break;
      default:
        usage(argv[0]);
        break;
    }
  }

  if (save_zoo) {
    create_and_serialize(fname);
  } else {
    deserialize_and_display(fname);
  }
  return 0;
}


void create_and_serialize (std::string fname) {
}

void deserialize_and_display (std::string fname) {
}

