/*
Particle class
 */

class Particle {
  PVector pos; // holds x, y, and z
  float radius;
  float mass;
  PVector velocity;
  int type; // proton (1), neutron (0), electron (-1)
  PVector force;

  Particle() {
    pos = new PVector(0, 0, 0);
    radius = 0;
    mass = 0;
    velocity = new PVector(0, 0, 0);
    type = 0;
    force = new PVector(0, 0, 0);
  }

  Particle(float _x, float _y, float _z, float _r, float _m, PVector _v, int _t, PVector _f) {
    pos = new PVector(_x, _y, _z);
    radius = _r;
    mass = _m;
    velocity = _v;
    type = _t;
    force = _f;
  }

  void display() {
    pushMatrix();
    //translate(x, y, z);
    translate(pos.x, pos.y, pos.z);
    noStroke();
    int op = 100;
    if (type == -1) {
      fill(0, 100, 255, op);
    } else if (type == 1) {
      fill(255, 0, 0, op);
    } else {
      fill(255, 255, 0, op);
    }
    //fill(255, 255, 0);
    sphere(radius);
    popMatrix();
  }

  void update() {
    // if we wanted to have a control volume
    //pos.x = abs((pos.x + velocity.x) % 500);
    //pos.y = abs((pos.y + velocity.y) % 500);
    //pos.z = abs((pos.z + velocity.z) % 500);

    pos.x += velocity.x;
    pos.y += velocity.y;
    pos.z += velocity.z;

    //print("x: " + pos.x + " y: " + pos.y + " z: " + pos.z + "\n");
    //print("vx: " + velocity.x + " vy: " + velocity.y + " vz: " + velocity.z + "\n");
    //x += 0.2;
  }

  PVector calculateForceforProton(PVector jpos) {
    return new PVector(0, 0, 0);
  };

  PVector calculateForceforElectron(PVector jpos) {
    return new PVector(0, 0, 0);
  };

  PVector calculateForceforNeutron(PVector jpos) {
    //PVector ipos = pos.copy();
    //PVector r = jpos.sub(ipos);
    //PVector runit = r.copy().div(r.mag());
    //float G = 100;
    PVector force;
    //if (r.mag() <= 2*15) {
    force = new PVector(0, 0, 0);
    //} else {
    //  force = runit.mult((G * mass * 1 / pow(r.mag(), 2))*.1);
    //}
    return force;
  };
}