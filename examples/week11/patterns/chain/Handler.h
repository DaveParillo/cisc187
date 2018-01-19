#pragma once

#include <iostream>
#include <memory>
#include <vector>

// Every handler is given a chance to 'handle' the object.
// - No object is obligated to do anything
// - The handler doesn't need to be pass by value

// An abstract handler
// It handles a value, but doesn't specify what is done
//
struct Handler {
        Handler() = default;
        virtual ~Handler() = default;
        virtual void request(int& value) const  = 0;
};


// A handler that prints an error if the 
// error value > error number
class ErrorHandler : public Handler {
    int id_ = 1;
    int error_ = 21;
    public:
      ErrorHandler() = default;
      ErrorHandler(int id, int err_num)
          : id_{id}, error_{err_num}
      {}
      ~ErrorHandler() = default;
      void request(int& value) const override {
          if (value > error_) {
              std::cout << "Error Handler " << id_ << " handled request with error #" << error_ << ".\n";
          } else {
              std::cout << "Error Handler " << id_ << " did not handle request.\n";
          }
      }

};

// A handler to print the nth fibonacci number
class FibonacciHandler : public Handler {
    unsigned fib(unsigned n) const {
        if(n == 0) return n;
        unsigned a = 0, b = 1;
        for (unsigned c = 0, i = 2; i <= n; ++i) {
            c = a + b;
            a = b;
            b = c;
        }
        return b;
    }
    public:
    FibonacciHandler() = default;
    ~FibonacciHandler() = default;
    void request(int& value) const override {
        if (value < 999) {
            value = fib(value);
            std::cout << "Fibonacci number #" << value << " is " << fib(value) <<  ".\n";
        } else {
            std::cout << "Fibonacci Handler did not handle request.\n";
        }
    }

};

