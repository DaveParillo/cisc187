#include "Direction.h"

#include <map>
#include <string>

namespace mesa {
  const std::string direction_to_string(Direction dir)
  {
    std::map<Direction, const std::string> dirs = 
    {
      {Direction::NORTH, "NORTH"},
      {Direction::EAST, "EAST"},
      {Direction::SOUTH, "SOUTH"},
      {Direction::WEST, "WEST"}
    };

    return dirs[dir];
  }
}

