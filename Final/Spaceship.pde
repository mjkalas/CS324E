PImage img;

class Spaceship{
  float x, y;
  
  Spaceship () {
    img = loadImage("spaceship.png");
    x = 310; y = 430;
  }
  
  Spaceship (float _x, float _y) {
    img = loadImage("spaceship.png");
    x = _x; y = _y;
  }
  
  void display(){
    pushMatrix();
    noStroke();
    image(img, x, y);
    popMatrix();
  }
  
  void reset(){
   x = 310;
   y = 430;
  }

  void pressedUp(){
    y -= 5;
    if (y <= 0){
      y = 0;
    }
  }
  
  void pressedDown(){
    y += 5;
    if (y >= 430){
      y = 430;
    }
  }
  
  void pressedLeft(){
    x -= 5;
    if (x <= 0){
      x = 0;
    }
  }
  
  void pressedRight(){
    x += 5;
    if (x >= 593){
      x = 593;
    }
  }
  
  float getPosX(){
    return (x + 25);
  }
  
  float getPosY(){
    return (y + 25);
  }
}