String[] words;
PFont font;

void setup() {
  size(800, 600);
  String inputFile = "uniquewords.txt";
  words = loadStrings(inputFile);
  font = createFont("Courier", 32);
  noLoop();
}

void draw() {
  background(255);
  textFont(font);
  int x = 0;
  int y = 32;
  int xtest = 0;
  int i = 0;
  while(y < 600 && i < words.length) {
    int index = (int)random(0.0, words.length);
    int length = words[index].length();
    
    // set the color
    if (length < 8){
      fill (0);
    } else if (length < 12) {
      fill(#B29607);
    } else {
      fill(#760808);
    }
    
    xtest = x + (int)textWidth(words[index] + " "); // how long the word will be after this
    if (xtest > 800){
      if(y < 570) {
        print(i, " greater: x:", x, " xtest:", xtest, "\n");
        y += 32;
        x = 0;
        text(words[index], x, y);
        x = (int)textWidth(words[index] + " ");  
      }
      
    } else {
      print(i, " less: x:", x, " xtest:", xtest, "\n");
      text(words[index], x, y);
      x = xtest;
    }
    xtest = 0;
    //x = xtest;
    //text(words[i], x, y);
    i++;
  }
}

void mousePressed() {
  background(255);
  loop();
}