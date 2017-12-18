/*
Planet inherits from Spin and creates a spinning planet
 */
PImage img;
int numPointsW;
int numPointsH_2pi;
int numPointsH;

float[] coorX;
float[] coorY;
float[] coorZ;
float[] multXZ;

class Planet extends Spin {
  float radius;
  float velocity;
  float dx;
  float dy;
  float dz;
  float rr, rg, rb;
  float rr2, rg2, rb2;
  float ring_angle;
  PImage img;

  Planet(float _x, float _y, float _z, float _s, float _radius, float _vel, float _dx, float _dy, float _dz) {
    super(_x, _y, _z, _s);
    radius = _radius;
    velocity = _vel;
    dx = _dx;
    dy = _dy;
    dz = _dz;
    rr = (int)random(50, 150);
    rg = (int)random(50, 150);
    rb = (int)random(50, 150);
    rr2 = (int)random(50, 150);
    rg2 = (int)random(50, 150);
    rb2 = (int)random(50, 150);
    ring_angle = random(0.55, 0.7);
    img = loadImage("moonmap2k.jpg");
    initializeSphere(200, 30);
  }

  //display visualizes Spin behavior within a line
  void display() {
    strokeWeight(1);
    stroke(230);
    noStroke();
    pushMatrix();
    translate(x, y, z);
    //rotateY(PI/2);
    //rotateZ(PI/2);
    rotateY(angle);
    fill(rr, rg, rb);
    textureSphere(radius, radius, radius, img);
    rotateX(PI * ring_angle);
    noFill();
    rr2 = (int)random(100, 200);
    rg2 = (int)random(100, 200);
    rb2 = (int)random(100, 200);
    stroke(rr2, rg2, rb2);
    float rad = random(2, 3);
    ellipse(0, 0, rad*radius, rad*radius);
    rad = random(2, 3);
    ellipse(0, 0, rad*radius, rad*radius);
    popMatrix();
  }

  void update() {
    angle += speed;
    float mag = (float)Math.sqrt((Math.pow(dx, 2) + Math.pow(dy, 2) + Math.pow(dz, 2)));
    x += dx/mag*velocity;
    y += dy/mag*velocity;
    z += dz/mag*velocity;
  }

  void initializeSphere(int numPtsW, int numPtsH_2pi) {

    // The number of points around the width and height
    numPointsW=numPtsW+1;
    numPointsH_2pi=numPtsH_2pi;  // How many actual pts around the sphere (not just from top to bottom)
    numPointsH=ceil((float)numPointsH_2pi/2)+1;  // How many pts from top to bottom (abs(....) b/c of the possibility of an odd numPointsH_2pi)

    coorX=new float[numPointsW];   // All the x-coor in a horizontal circle radius 1
    coorY=new float[numPointsH];   // All the y-coor in a vertical circle radius 1
    coorZ=new float[numPointsW];   // All the z-coor in a horizontal circle radius 1
    multXZ=new float[numPointsH];  // The radius of each horizontal circle (that you will multiply with coorX and coorZ)

    for (int i=0; i<numPointsW; i++) {  // For all the points around the width
      float thetaW=i*2*PI/(numPointsW-1);
      coorX[i]=sin(thetaW);
      coorZ[i]=cos(thetaW);
    }

    for (int i=0; i<numPointsH; i++) {  // For all points from top to bottom
      if (int(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {  // If the numPointsH_2pi is odd and it is at the last pt
        float thetaH=(i-1)*2*PI/(numPointsH_2pi);
        coorY[i]=cos(PI+thetaH); 
        multXZ[i]=0;
      } else {
        //The numPointsH_2pi and 2 below allows there to be a flat bottom if the numPointsH is odd
        float thetaH=i*2*PI/(numPointsH_2pi);

        //PI+ below makes the top always the point instead of the bottom.
        coorY[i]=cos(PI+thetaH); 
        multXZ[i]=sin(thetaH);
      }
    }
  }

  void textureSphere(float rx, float ry, float rz, PImage t) { 
    // These are so we can map certain parts of the image on to the shape 
    float changeU=t.width/(float)(numPointsW-1); 
    float changeV=t.height/(float)(numPointsH-1); 
    float u=0;  // Width variable for the texture
    float v=0;  // Height variable for the texture

    beginShape(TRIANGLE_STRIP);
    texture(t);
    for (int i=0; i<(numPointsH-1); i++) {  // For all the rings but top and bottom
      // Goes into the array here instead of loop to save time
      float coory=coorY[i];
      float cooryPlus=coorY[i+1];

      float multxz=multXZ[i];
      float multxzPlus=multXZ[i+1];

      for (int j=0; j<numPointsW; j++) { // For all the pts in the ring
        normal(-coorX[j]*multxz, -coory, -coorZ[j]*multxz);
        vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
        normal(-coorX[j]*multxzPlus, -cooryPlus, -coorZ[j]*multxzPlus);
        vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
        u+=changeU;
      }
      v+=changeV;
      u=0;
    }
    endShape();
  }
}