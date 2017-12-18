Planet mars;
Planet p2;
Planet p3;

Tardis box1;
Tardis box2;

PImage tex;
PImage bg;

float ex, ey, ez = 1; // coordinates of camera (eye)
float cx, cy, cz = 0; // coordinates of scene center
float ox = 0, oy = 1, oz = 0; // camera orientation (up axis)
float r;

void setup () {
  size(650, 400, P3D);
  bg = loadImage("stars.jpg");
  frameRate(60);
  //Initialize SpinArm and SpinSpot objects
  mars = new Planet(0, 1700, 0, 
    -0.005, 1500, 0.0, 
    0.0, 1.0, 0.0);
  p2 = new Planet(-100, -50, 0, 
    0.01, 30, 1, 
    0.3, 0.5, 0.7);
  p3 = new Planet(-350, -100, 0, 
    0.01, 15, 0.5, 
    1, 0.3, 0.0);

  ex = width/2;
  ey = height/2;
  ez = (height/2)/tan(PI/6);
  cx = width/2;
  cy = height/2;
  cz = 0;
  camera(ex, ey, ez, 
    cx, cy, cz, 
    ox, oy, oz);

  box1 = new Tardis();
  box2 = new Tardis(0.01, -0.05, 500, 500, 500);
}

void draw() {
  background(bg);
  camera(ex, ey, ez, cx, cy, cz, ox, oy, oz);
  pointLight(255, 255, 255, 100, 0, 0);
  //pointLight(255, 255, 255, 1000, 10000, 0);
  ambientLight(20, 20, 20);


  translate(width/2, height/2);
  drawCoordinates();

  mars.update();
  mars.display();
  p2.update();
  p2.display();
  p3.update();
  p3.display();

  box1.update();
  box1.display();
  box2.update();
  box2.display();

  if (keyPressed == true) {
    checkKey();
  }

  if (mousePressed) {
    setup();
  }
}

void checkKey() {
  if (keyPressed == true && key == CODED && keyCode == UP) {
    ey -= 5;
    cy -= 5;
  } else if (keyPressed == true && key == CODED && keyCode == DOWN) {
    ey += 5;
    cy += 5;
  } else if (keyPressed == true && key == CODED && keyCode == LEFT) {
    ex -= 5;
    cx -= 5;
  } else if (keyPressed == true && key == CODED && keyCode == RIGHT) {
    ex += 5;
    cx += 5;
  } else if (keyPressed == true && key == CODED && keyCode == SHIFT) {
    ez -= 5;
    cz -= 5;
  } else if (keyPressed == true && key == ' ') {
    ez += 5;
    cz += 5;
  } else if (keyPressed == true && key == 'z') {
    ex = (ex)*cos(0.05) + (ez)*sin(0.05);
    ez = (ex)*-sin(0.05) + (ez)*cos(0.05);
  } else if (keyPressed == true && key == 'x') {
    ey = ey*cos(0.05) - ey*sin(0.05);
    ez = ez*sin(0.05) + ez*cos(0.05);
  } else if (keyPressed == true && key == 'c') {
    ex = ex*cos(0.05) - ex*sin(0.05);
    ey = ey*sin(0.05) + ey*cos(0.05);
  }
}

  void drawCoordinates() {
  //strokeWeight(2);
  stroke(255, 0, 0);
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(50, 0, 0);
  endShape();

  stroke(0, 255, 0);
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(0, 50, 0);
  endShape();

  stroke(0, 0, 255);
  beginShape(LINES);
  vertex(0, 0, 0);
  vertex(0, 0, 50);
  endShape();
}