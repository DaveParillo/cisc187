.ds CH Lab #13a: Class inheritance
.so headings.ms
.TL
\*[CH]
.NH
Base and derived classes: 40 points, 45 minutes \fImaximum\fR
.time_box
.RS
.nr step 0 1
.IP \n+[step].
Given the following classes:
.CW
  class Animal {
    public:
    virtual void make_noise() {}
    void eat() {}
    void sleep() {}
    void roam() {}
  };

  class Canine : public Animal {
    public:
    void roam() {}
    void eat() {}
  };


  class Wolf : public Canine {
    public:
    void make_noise() {}
    void eat() {}

  };
.R

And given: 
.CW
  void call (Animal& a) {
    a.make_noise();
    a.roam();
    a.eat();
    a.sleep();
  }

  int main () {
    Wolf w;
    call(w);
  }
.R

Identify which of the versions of the methods \fCWolf, Canine, Animal\fR are invoked in \fCcall()\fR.
.RE

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
.IP a.
Identify appropriate base and derived classes.







.IP b.
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
.IP a.
Identify appropriate base and derived classes.





.IP b.
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
Abstract classes: 60 points, 45 minutes \fImaximum\fR
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

Examine each of the 4 pairs of code on the next page and
describe what would happen when inserted at locations "A" and "B".
For each, answer the following:
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
.bp

.SH
Pair #1:
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
.RE

