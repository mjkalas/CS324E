PShape tardis;

class Tardis {
  float angle1;
  float angle2;
  float x, y, z;
  float speed1;
  float speed2;

  Tardis() {
    tardis = loadShape("TARDIS.obj");
    x = 0; y = 300; z = 100;
    angle1 = 0.01; angle2 = 0.02;
  }
  
  Tardis(float _a1, float _a2, float _x, float _y, float _z) {
    tardis = loadShape("TARDIS.obj");
    x = _x; y = _y; z = _z;
    angle1 = _a1; angle2 = _a2;
  }

  void display() {
    noStroke();
    pointLight(255, 255, 255, 0, 0, 0);
    pointLight(255, 255, 255, 100, 0, 0);
    pushMatrix();
    rotateX(PI);
    rotateX(PI/4);
    rotateY(speed1);
    scale(0.5);
    translate(x, y, z);
    rotateZ(speed2);
    translate(speed1*100, speed2*100, 0);
    shape(tardis, 0, 0);
    popMatrix();
  }

  void update() {
    speed1 += angle1;
    speed2 += angle2;
  }
}