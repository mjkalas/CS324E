PImage start_img;
PImage end_img;

void initScreen() {
  start = millis();
  gameOver = false;
  acount = 0;
  ship.reset();
  start_img = loadImage("playimage.png");
  if(gameWon) {
   gameLevel++; 
  }
  gameWon = false;
  image(start_img, 0, 0);
}

void gameOverScreen() {
  tint(255, 127);  // Display at half opacity
  if(gameWon) {
    start_img = loadImage("gamewon.png");
  } else {
    gameLevel = 0;
   start_img = loadImage("gameover.png"); 
  }
  image(start_img, 0, 0);
  tint(255, 255);  // Display at half opacity
}

void pause() {
  tint(255, 127);  // Display at half opacity
  start_img = loadImage("pause.png");
  image(start_img, 0, 0);
  tint(255, 255);  // Display at half opacity
}