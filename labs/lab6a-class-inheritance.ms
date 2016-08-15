.ds CH Lab #6a
.TL
Lab #6a: Class inheritance
.so cover-page.ms

.bp
.NH
Base and derived classes: 30 minutes \fImaximum\fR
.time_box
.QP
.nr step 1 1
.IP \n[step].
Given the following classes:
.CW
  class Animal {
    public:
    void make_noise() {}
    void eat() {}
    void sleep() {}
    void roam() {}
  };

  class Canine : public Animal {
    public:
    void roam() {}
  };


  class Wolf : public Canine {
    public:
    void make_noise() {}
    void eat() {}

  };
.R

And given a new wolf object:
.CW
  Wolf w;
.R

Identify which of the versions of the methods called by \fCWolf w\fR are invoked:
.CW
  w.make_noise();
  w.roam();
  w.eat();
  w.sleep();
.R
.bp
.IP \n+[step].
Given the following classes:
.CW
  Musician
  RockStar
  MusicFan
  BassPlayer
  ConcertPianist
.R
.RS
.nr substep 1 1
.IP \n[substep].
Identify appropriate sub classes and super classes.







.IP \n+[substep].
Draw an inheritance diagram that makes sense.
Not everything needs to be connected to something else.
.RE












.QP
.IP \n+[step].
Given the following classes:
.CW
  Bathtub
  Bathroom
  Bubbles
  Sink
.R
.RS
.nr substep 1 1
.IP \n[substep].
Identify appropriate sub classes and super classes.





.IP \n+[substep].
Draw an inheritance diagram that makes sense.
Not everything needs to be connected to something else.



.RE
.bp
.QP
.IP \n+[step].
Identify the relationships that make sense.

If a relationship doesn't make sense, explain why.

.CW
  struct Oven : Kitchen



  struct Guitar : Instrument



  struct Person : Employee



  struct Ferrari : Engine



  struct FriedEgg : Food



  struct Beagle : Pet



  struct Porch : House



  struct Metal : Titanium



  struct GratefulDead : Band

.R

.bp
.NH
Abstract classes: 30 minutes \fImaximum\fR
.time_box
.QP
Given the following classes and a main method that uses them:
.CW

  class Car {
    public:
    // insert A here
  };

  class RaceCar : public Car {
    public:
    // insert B here
  };

  class ElectricCar : public Car {
    public:
    bool accelerate(int change) const override {
      std::cout << "Shhhh...  " << change << std::endl;
      return true;
    }
  };

  int main () {
    vector<Car*> cars(3);
    cars[0] = new RaceCar();
    cars[1] = new ElectricCar();
    cars[2] = new Car();

    for (int x = 0; x < cars.size(); x++) {
      cars[x]->accelerate(x);
    }
    return 0;
  }
.R
For each of the following pairs of code, when inserted at locations "A" and "B":
.RS
.IP \[bu]
Which do not compile? 
.IP \[bu]
Which compile and produce the following output?
.RS
.CW
  Vroom! 0 
  Shhhh... 1 
  Change is: 2
.R
.RE
.IP \[bu]
For those that compile, but do not produce the output above, explain why they do not.
.RE
.SH
Pair #1:
.QP
.IP A:
.CW
  bool accelerate(int change) const {
    std::cout << "Change is: " << change << std::endl;
    return true;
  }
.R

.IP B:
.CW
  bool accelerate(int change) const {
    std::cout << "Vroom!  " << change << std::endl;
    return false;
  }
.R

.SH
Pair #2:
.QP
.IP A:
.CW
  virtual bool accelerate(int change) const {
    std::cout << "Change is: " << change << std::endl;
    return true;
  }
.R

.IP B:
.CW
  bool accelerate(int change) const {
    std::cout << "Vroom!  " << change << std::endl;
    return false;
  }
.R


.SH
Pair #3:
.QP
.IP A:
.CW
  virtual bool accelerate(int change) const {
    std::cout << "Change is: " << change << std::endl;
    return true;
  }
.R

.IP B:
.CW
  bool accelerate(long change) const {
    std::cout << "Vroom!  " << change << std::endl;
    return false;
  }
.R



.SH
Pair #4:
.QP
.IP A:
.CW
  virtual bool accelerate(int change) const {
    std::cout << "Change is: " << change << std::endl;
    return true;
  }
.R

.IP B:
.CW
  bool accelerate(long change) const override {
    std::cout << "Vroom!  " << change << std::endl;
    return false;
  }
.R


.bp
.NH
Boats: 30 minutes \fImaximum\fR
.time_box
.QP
Use the following code snippets and place them in the provided classes where there are underscores in the code.

You may use a snippet more than once.

You may not need all the snippets.

The goal is to make a working program that generates the following output:
.RS
.CW
   drift  drift  hoist sail
.R
.RE

Choose from the following code snippets:
.CW

  RowBoat            SailBoat           Boat
  subclasses         extends            return
  const              continue           break
  int                static             private
  private:           public             public:
  string             void               virtual
  override           b1                 b2
  b3                 len                len{0}
  length             int b1             int b2
  int b3             int len            int length
  drift              row row            hoist sail
  move               rowTheBoat         std::cout
.R

.CW
  #include <iostream>

  class ________ { 
    ________
      Boat() : ________
      {}
      ________ ~________();

      void ________(int length) {
        ________ = ________;
      }

      int ________() {
        return len;
      }

      virtual void move () const {
        std::cout << " drift ";
      }
    ________
      int len;

  };
.R
.bp
.CW

  class SailBoat : ________ Boat {
    public:
      virtual ~________();
      ________ move() ________ ________ {
        ________ << " ________ ";

      }

  };

  class RowBoat : ________ ________ {
    public:
      virtual ~________();
      void row() ________ {
        std::cout << " ________ ";

      }

  };


  int main() {
      Boat b1;
      ________ b2;
      RowBoat ________;

      b2.length(32);
      b1.________();
      b3.________();
      ________.move();
      std::cout << std::endl;

      return 0;
  }
.R


.bp
.so reflection.ms

