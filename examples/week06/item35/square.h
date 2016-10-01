#pragma once

// from Effective C++, item # 35
//
// Does is make sense for a Square to inherit from Rectangle?

class Square : public Rectangle {
  public:
    void   height(size_t new_height) override;
    void   width (size_t new_width) override;
    size_t height() const override;
    size_t width()  const override;
  private:
    size_t _ht = 3;
    size_t _wd = 3;
};

