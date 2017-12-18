// Music Credit:
// Flower by Doxent Zsigmond (c) 2016 Licensed under a Creative Commons Attribution
// Noncommercial  (3.0) license.
// http://dig.ccmixter.org/files/doxent/52940 Ft: Rocavaco, Javolenus, Jeris, State Shirt

//import processing.sound.*;
//SoundFile file;

float Lx, Ly, Lz; // size of box
int N = 500;
Particle[] particles = new Particle[N];
float msx, msy;

double time;         //time
double dt = 10.0;     //time step

void setup() {
  size(640, 480, P3D);
  colorMode(RGB);

  // play music
  //file = new SoundFile(this, "music.mp3");
  //file.play();

  for (int i = 0; i < N; i++) {
    // calculate random position to draw each particle
    double theta = Math.random() * PI;
    double phi   = Math.random() * TWO_PI;
    float sx = (float)(Math.cos(phi)*Math.sin(theta));
    float sy = (float)(Math.sin(phi)*Math.sin(theta));
    float sz = (float)Math.cos(theta);
    //print("sx: " + sx + " sy: " + sy + " sz: " + sz + "\n");
    sx = map(sx, -1, 1, 0, 500);
    sy = map(sy, -1, 1, 0, 500);
    sz = map(sz, -1, 1, 0, 500);

    // determine which particle will be drawn
    int t = (int)(Math.random() * 3) - 1;
    print("t: " + t + "\n");

    PVector f = new PVector(0, 0, 0);
    PVector v = new PVector(0, 0, 0);
    if (t == -1) {
      // make an electron
      particles[i] = new Electron(sx, sy, sz, 8.5, 0.545, v, t, f, 1.0);
    } else if (t == 0) {
      // make a neutron
      particles[i] = new Neutron(sx, sy, sz, 15.0, 1.0, v, t, f, 1.0);
    } else {
      // make a proton
      particles[i] = new Proton(sx, sy, sz, 15.0, 1.0, v, t, f, 1.0);
    }
  }
  Lx = 500; 
  Ly = 500; 
  Lz = 500;
  time = 0;
  msx = 453;
  msy = 218;
}
/////
void draw() {

  background(200);

  float R = width * 2.5;
  float phi = - (float)PI * msx / width;
  float th  = - (float)PI * msy / height;
  float eyeX = R * sin(th) * cos(phi);
  float eyeZ = R * sin(th) * sin(phi);
  float eyeY = - R * cos(th);

  camera(eyeX, eyeY, eyeZ+100, // eyeX, eyeY, eyeZ
    Lx/2, Ly/2, Lz/2, // centerX, centerY, centerZ
    0.0, 1.0, 0.0);   // upX, upY, upZ
  //lights();     
  ////directionalLight(-128, 128, -128, 0, 0, -1);
  ////camera(2*msx-Lx, 3*msy-Ly ,750,Lx/2,Ly/2,Lz/2,0,1,0);

  drawBoundary();


  for (int i = 0; i < N; i++) {

    for (int j = 0; j < N; j++) {
      if (j != i) {
        PVector jpos = particles[j].pos.copy();

        PVector force;
        if (particles[j].type == -1) {
          // its an electron
          force = particles[i].calculateForceforElectron(jpos);
        } else if (particles[j].type == 0) {
          // its a neutron
          force = particles[i].calculateForceforNeutron(jpos);
        } else {
          // its a proton
          force = particles[i].calculateForceforProton(jpos);
        }

        //print("r: " + r.mag() + "\n");
        //print(force + "\n");
        //float accel = force.div();
        particles[i].force.add(force);
      }
    }
    PVector iforce = particles[i].force.copy();
    float imass = particles[i].mass;
    PVector accel = iforce.div(imass);
    PVector vel = accel.mult((float)dt);
    particles[i].velocity= vel;
    particles[i].force.mult(0.95);

    particles[i].update();
    particles[i].display();
  }

  /*if (frame_time < 100) {
   line(frame_time, 0, frame_time, 100);
   frame_time = frame_time + 1;
   } else {
   noLoop();
   }
   saveFrame();*/

  //if (mousePressed) {
  // setup();
  //}
}

void drawBoundary() {
  pushMatrix();
  translate(Lx/2, Ly/2, Lz/2);
  stroke(0);
  noFill();
  box(Lx, Ly, Lz); // the boundary
  noStroke();
  //fill(255, 120, 0);
  //sphere(Lx/10); // sphere at origin
  strokeWeight(4);
  stroke(255, 0, 0);
  line(0, 0, 0, Lz/2, 0, 0);  // x-axis(red)
  stroke(0, 156, 47);
  line(0, 0, 0, 0, Lx/2, 0);  // y-axis(green)
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, Lx/2); // z-axis(blue)
  strokeWeight(1);
  popMatrix();
}

void mouseDragged() {
  msx = mouseX;
  msy = mouseY;
  //println(msx + "   " + msy);
}