/*
Asteroid class
 */

//PImage img2;
int count;

class Asteroid {
  PVector pos; // holds x, y
  float radius;
  PVector velocity;
  float omega;
  //PImage img = loadImage("./resized/a2.png");
  //PImage img;
  //Animation animation1 = new Animation("./resized/a8-", 1);
  Animation anim;
  float angle = 0;

  Asteroid() {
    pos = new PVector(0, 0);
    radius = 100;
    velocity = new PVector(0, 0);
    angle = 0;
    omega = random(0, 10);
  }

  Asteroid(float _x, float _y, PVector _v) {
    pos = new PVector(_x, _y);
    radius = 100;
    velocity = _v;
    anim = getImg();
    angle = 0;
    omega = random(0, 10);
  }

  Animation getImg() {
    int rand = (int)random(1, 9);
    //println(rand);
    if (rand == 8) {
      anim = new Animation("./resized/a8-", 25);
    } else {
      anim = new Animation("./resized/a" + rand + "-", 1);
    }
    return anim;
  }

  void display() {
    pushMatrix();
    translate(320, 240); // go to center of screen
    //fill(255, 0, 0);  // d
    //rect(0, 0, 320, 240);  // d
    scale(0.5, 0.5); // everything will now take 2x as many pixels
    //fill(0, 255, 0);  // d
    //rect(0, 0, 320, 240);  // d
    translate(-anim.getWidth()/2, -anim.getWidth()/2); // move pic to center
    //fill(0, 0, 255);  // d
    //rect(0, 0, 320, 240);  // d
    translate(pos.x*2.0, pos.y*2.0); // move pic to it's x and y positions
    noStroke();
    fill(255, 255, 100, 0);
    ellipse(anim.getWidth()/2, anim.getWidth()/2, anim.getWidth(), anim.getWidth());
    noFill();
    int c1 = (int)random(0, 255);
    int c2 = (int)random(0, 255);
    int c3 = (int)random(0, 255);
    stroke(c1, c2, c3);
    fill(c1, c2, c3, 20);
    strokeWeight(4);
    ellipse(anim.getWidth()/2, anim.getWidth()/2, anim.getWidth(), anim.getWidth());
    //image(img, 0, 0);
        pushMatrix();
        //translate(-pos.x*2.0, -pos.y*2.0);
        //translate(anim.getWidth()/2, anim.getWidth()/2);
        //scale(2, 2);
        //translate(-320, -240);
    //rotate(angle);
        anim.display(0, 0);
    popMatrix();
    popMatrix();
  }

  void update() {
    //rotate(angle);
    if(!gameOver) {
      angle += omega;
      pos.x += velocity.x;
      pos.y += velocity.y;
    }
    
    float shipX = ship.getPosX() - 320;
    float shipY = ship.getPosY() - 240;
    double dist = Math.sqrt(pow((shipX - pos.x), 2) + pow((shipY - pos.y), 2));
    if(dist < anim.getWidth()/4) {
     gameOver = true;
     gameWon = false;
     gameOverScreen();
    }
    //println("dist: " + dist + " \t radius: " + anim.getWidth()/4);

    //print("x: " + pos.x + " y: " + pos.y + " z: " + pos.z + "\n");
    //print("vx: " + velocity.x + " vy: " + velocity.y + " vz: " + velocity.z + "\n");
    //x += 0.2;
  }
}