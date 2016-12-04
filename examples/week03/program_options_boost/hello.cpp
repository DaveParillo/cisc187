
#include <iostream>
#include <string>
#include <boost/program_options.hpp>

namespace po = boost::program_options;

int main(int argc, char* argv[]) {
  int opt;
  po::options_description desc (std::string (argv[0]).append("\nOptions"));
  desc.add_options()
      ("help,h",   "Show this text")
      ("repeat,r", po::value<int>(&opt)->default_value(1),
                 "Set the number of times to repeat the hello message.")
      ("name,n",   po::value<std::string>()->default_value("World"),
                 "Set the name for the hello message.")
  ;

  po::variables_map vm;
  po::store (po::parse_command_line(argc, argv, desc), vm);
  po::notify(vm);

  if (vm.count("help")) {
    std::cout << desc << std::endl;
    return 1;
  }

  int repeat = 1;
  std::string msg = "Hello, ";

  if (vm.count("repeat")) {
    repeat = vm["repeat"].as<int>();
  }
  if (vm.count("name")) {
    msg += vm["name"].as<std::string>();
  }

  if (msg == "Hello, ") {
    //msg += "World";
  }

  for (int i = 0; i < repeat; i++) {
    std::cout << msg << "!\n";
  }
  return 0;
}


