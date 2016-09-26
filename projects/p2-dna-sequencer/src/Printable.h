#pragma once
#include <cstddef>

namespace mesa
{
  /**
   * Defines actions that can be taken on things that print their contents.
   */
  class Printable {
    public:
      /**
       * Base class virtual destructor.
       * @see http://en.cppreference.com/w/cpp/language/destructor
       */
      virtual ~Printable();
      /**
       * Prints out all items.
       */
      virtual void print() const = 0;

      /**
       * Prints out a sepcific item.
       * @param pos the target position within the object.
       */
      virtual void print_at (const std::size_t pos) const = 0;

  };

}


