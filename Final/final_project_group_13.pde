// Music Credit:
// http://www.dl-sounds.com/royalty-free/time-portal/
// Asteroid Image Credits:
// http://icons.iconarchive.com/icons/zairaam/bumpy-planets/256/asteroid-icon.png
// http://zenway.ru/uploads/12_15/a3d_001.gif
// http://icons.iconarchive.com/icons/zairaam/bumpy-planets/256/05-moon-icon.png
// https://cdn.habtium.com/album/7/1688b33a4e02.png
// http://s209.photobucket.com/user/Tyrkeyz/media/Asteroid.png.html
// http://www.minerwars.com/ForumUploads/20101222063029_5025_Asteroid2.png
// http://img07.deviantart.net/b5f3/i/2013/130/4/d/asteroid_stock_by_fimar-d64qnwa.png

import processing.sound.*;
SoundFile file;

Asteroid a1;
int N = 30;
Asteroid[] astrs = new Asteroid[N];
int acount;
int start;
int time;
boolean gameOver = false;
boolean gameWon = false;
int gameTime = 30 * 1000;
int gameLevel = 1;
boolean pause = false;

int gameScreen = 0;
PImage bg;

Spaceship ship;
float x = 310, y = 430;

void setup() {
  size(640, 480);
  colorMode(RGB);
  bg = loadImage("stars.jpg");

  // play music
  //file = new SoundFile(this, "music.mp3");
  //file.play();

  //frameRate(24);
  ship = new Spaceship(x, y);
  //PVector vel = new PVector(0, 0);
  //a1 = new Asteroid(0, 0, vel);
}

void draw() {
  if (gameScreen == 0) {
    initScreen();
  } else {
    //background(230);
    background(bg);

    ship.display();
    if (keyPressed == true) {
      movement();
    }

    if (!gameOver) {
      time = millis() - start;
    }

    if (time%1000 < 20) {
      makeAsteroid();
    }

    for (int i = 0; i < acount; i++) {
      astrs[i].display();
      astrs[i].update();
    }

    //a1.display();
    //a1.update();

    fill(255);
    noStroke();
    String str;
    if (time < gameTime && !gameOver) {
      str = "Level: " + gameLevel + "           Time left: " + ((gameTime/1000) - (time/1000)) + " sec";
    } else if (time > gameTime) {
      gameOver = true;
      gameWon = true;
      str = "Time's up! You won!";
      gameOverScreen();
    } else {
      str = "Sorry, You lost!";
    }
    //String str = "Time left: " + (30 - (time/1000)) + " sec";
    int strSize = (int)textWidth(str);
    rect(5, 5, strSize+10, 20);
    fill(0);
    //text("Time left: " + (30000 - time) + " ms", 20, 20);
    text(str, 10, 20);
  }
}


void gameScreen() {
  background(#050B29);
  ship.display();

  if (keyPressed == true) {
    movement();
  }
}

void movement() {
  if (!gameOver) {
    if (keyPressed == true && key == CODED && keyCode == UP) {
      ship.pressedUp();
    } else if (keyPressed == true && key == CODED && keyCode == DOWN) {
      ship.pressedDown();
    } else if (keyPressed == true && key == CODED && keyCode == RIGHT) {
      ship.pressedRight();
    } else if (keyPressed == true && key == CODED && keyCode == LEFT) {
      ship.pressedLeft();
      /*} else if (keyPressed == true && key == CODED && keyCode == LEFT && keyCode == DOWN){
       ship.pressedLD();*/
    }
  }
}

void makeAsteroid() {
  if (acount < N) {

    double theta = Math.random() * TWO_PI;
    double r = 800.0;
    int x = (int)(r*Math.cos(theta));
    int y = (int)(r*Math.sin(theta));
    float len = (float)Math.sqrt(pow(x, 2) + pow(y, 2));
    float rx = random(1, 5);
    float ry = random(1, 5);
    PVector vel = new PVector(-x/len*rx, -y/len*ry);
    astrs[acount] = new Asteroid(x, y, vel);
    acount++;
    println(acount);
  }
}

void mousePressed() {
  if (gameScreen == 0) {
    gameScreen++;
  //} else if (!gameOver && !pause) {
  //  pause = true;
  //  gameOver = true;
  //  pause();
    
  //} else if (pause) {
  //  gameOver = false;
  //  pause = false;
  } else {
    gameScreen ++;
    gameScreen = gameScreen % 2;
  }
}