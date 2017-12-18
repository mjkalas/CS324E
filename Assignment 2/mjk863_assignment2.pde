PImage img1, img2;
void setup() {
  surface.setResizable(true); 
  img1 = loadImage("tomatoplant.jpg");
  img2 = loadImage("tomatoplant.jpg");
  surface.setSize(img1.width, img1.height);

}

void draw(){
  img1.loadPixels();
  img2.loadPixels();
  int width = img2.width;
  int height = img2.height;
  image(img2, 0, 0);
}

void keyPressed() {
  if (keyPressed == true && key == '0'){
    img2.copy(img1, 0, 0, img1.width, img1.height, 0, 0, img2.width, img2.height);
  }
  
  if (keyPressed == true && key == '1'){
    colorMode(RGB);
    img1.loadPixels();
    for (int x = 0; x < img1.width; x++){
      for (int y = 0; y < img1.height; y++){
         int loc = x+y*img1.width;
         float r = red(img1.pixels[loc]);
         float g = green(img1.pixels[loc]);
         float b = blue(img1.pixels[loc]);
         int gray = (int)(r+g+b)/3;
         img2.pixels[loc] = color(gray);
      img2.updatePixels();
      }
    }
    image(img2, 0, 0);
  }
  
  
  if (keyPressed == true && key == '2'){
    int threshold = 100;
    int change = 50;
    colorMode(HSB);
    img1.loadPixels();
    for (int x = 0; x < img1.width; x++){
      for (int y = 0; y < img1.height; y++){
         int loc = x+y*img1.width;
         float r = red(img1.pixels[loc]);
         float g = green(img1.pixels[loc]);
         float b = blue(img1.pixels[loc]);
         float bright = brightness(img1.pixels[loc]);
         if (bright > threshold){
           r += change;
           g += change;
           b += change;
           bright += change;
         }
         else {
           r -= change;
           g -= change;
           b += change;
           bright -= change;
         }
         r = constrain(r, 0, 255);
         b = constrain(b, 0, 255);
         g = constrain(g, 0, 255);
         color contrast = color(r, g, b);
         img2.pixels[loc] = color(contrast);
      }
      img2.updatePixels();
      image(img2, 0, 0);
    }
  }

  if (keyPressed == true && key == '3'){
    img1.loadPixels();
    colorMode(RGB);
    float[][] matrix = {{.0625, .125, .0625}, {.125, .25, .125}, {.0625, .125, .0625}};
    float red, green, blue;
    for (int x = 1; x < img1.width-1; x++){
      for (int y = 1; y < img1.height-1; y++){
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            int loc = (y + j)*img1.width + (x + i);
              red = red(img1.pixels[loc]);
              green = green(img1.pixels[loc]);
              blue = blue(img1.pixels[loc]);
              red += red * matrix[i+1][j+1];
              green += green * matrix[i+1][j+1];
              blue += blue * matrix[i+1][j+1];
              color blur = color(red, green, blue);
              img2.pixels[loc] = color(blur);
             }
          }
        }
      }
    img2.updatePixels();
    image(img2, 0, 0);
  }
  
  if (keyPressed == true && key == '4'){
    img1.loadPixels();
    colorMode(RGB);
    float[][] matrixx = {{-1, -0, 1}, {-2, 9, 2}, {-1, 0, -1}};
    float[][] matrixy = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};
    float red, green, blue;
    float red2, green2, blue2;
    float red3, green3, blue3;
    for (int x = 1; x < img1.width-1; x++){
      for (int y = 1; y < img1.height-1; y++){
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            int loc = (y + j)*img1.width + (x + i);
              red = red(img1.pixels[loc]);
              green = green(img1.pixels[loc]);
              blue = blue(img1.pixels[loc]);
              red += red * matrixx[i+1][j+1];
              green += green * matrixx[i+1][j+1];
              blue += blue * matrixx[i+1][j+1];
              
              red2 = red(img1.pixels[loc]);
              green2 = green(img1.pixels[loc]);
              blue2 = blue(img1.pixels[loc]);
              red2 += red * matrixy[i+1][j+1];
              green2 += green * matrixy[i+1][j+1];
              blue2 += blue * matrixy[i+1][j+1];
              
              red3 = (sqrt(sq(red+red2)));
              green3 = (sqrt(sq(green+green2)));
              blue3 = (sqrt(sq(blue+blue2)));
              color edge = color(red3, green3, blue3);
              img2.pixels[loc] = color(edge);
            }
          }
        }
      }
    img2.updatePixels();
    image(img2, 0, 0);
    }
}
