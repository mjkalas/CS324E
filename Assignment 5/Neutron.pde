/*
Neutron inherits from Particle
 */

class Neutron extends Particle {
  float charge;


  Neutron(float _x, float _y, float _z, float _r, float _m, PVector _v, int _t, PVector _f, float _c) { 
    super(_x, _y, _z, _r, _m, _v, _t, _f);
    charge = _c;
  }

  //display visualizes Spin behavior within a line
  //void display() {
  //}

  PVector calculateForceforProton(PVector jpos) {
    PVector ipos = pos.copy();
    PVector r = jpos.sub(ipos);
    PVector runit = r.copy().div(r.mag());
    float G = 100;
    PVector force;
    if (r.mag() <= 2*15) {
      force = new PVector(0, 0, 0);
    } else {
      force = runit.mult((G * mass * 1 / pow(r.mag(), 2)) * 0.5);
    }
    return force;
  };

  PVector calculateForceforElectron(PVector jpos) {
    PVector ipos = pos.copy();
    PVector r = jpos.sub(ipos);
    PVector runit = r.copy().div(r.mag());
    float G = 100;
    PVector force;
    if (r.mag() <= 2*15) {
      force = new PVector(0, 0, 0);
    } else {
      force = runit.mult((G * mass * 1 / pow(r.mag(), 2)) * 0.5);
    }
    return force;
  };

  //void update() {
  //}
}