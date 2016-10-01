// from Effective C++, item # 14
//
// Some classes that keep track of the number of instances
class EnemyTarget {
  public:
    EnemyTarget ()                   { ++numTargets; }
    EnemyTarget (const EnemyTarget&) { ++numTargets; }

    ~EnemyTarget()                   { --numTargets; }
    static size_t numberOfTargets () { return numTargets; }
    virtual bool destroy(); // returns success of
                            // to destroy
                            // EnemyTarget object
  private:
    static size_t numTargets; // object counter
};
// class statics must be defined outside the class;
// initialization is to 0 by default
size_t EnemyTarget::numTargets;

// Let us suppose that a particular kind of enemy target is an enemy tank, 
// which you model as a publicly derived class of EnemyTarget. 
// Because you are interested in the total number of enemy tanks as well as the 
// total number of enemy targets, you'll pull the same trick with the
// derived class that you did with the base class: 

class EnemyTank: public EnemyTarget {
  public:
    EnemyTank ()                      { ++numTanks; }
    EnemyTank (const EnemyTank& rhs)
      : EnemyTarget(rhs)              { ++numTanks; }

    ~EnemyTank ()                     { --numTanks; }
    static size_t numberOfTanks ()    { return numTanks; }
    virtual bool destroy();
  private:
    static size_t numTanks;         // object counter for tanks
};
