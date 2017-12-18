// there are X words that appear Y times
double[] keys; // that appear Y times
double[] values;  // X words

void setup() {
  size(500, 500);
  String[] lines = loadStrings("wordfrequency.txt");
  
  keys = new double[lines.length];
  values = new double[lines.length];
  
  for(int i = 0; i < lines.length; i++) {
    String string = lines[i];
    String[] parts = string.split(":");
    String part1 = parts[0];
    String part2 = parts[1];
    keys[i] = Math.log(Integer.parseInt(part1)) / 10.0 * 400 + 50.0;
    values[i] = Math.log(Integer.parseInt(part2)) / 10.0 * 400 + 50.0;
  }
}

void draw() {
  background(255);
  stroke(100, 150);
  strokeWeight(1);
  fill(200);
  rect(40,40,410,410);
  stroke(255, 200);
  strokeWeight(10);
  for(int i = 0; i < keys.length; i++) {
    int x = (int)keys[i];
    int y = (int)values[i];
    int c = (int)((y - 50) / 400 * (255-200)+200);
    //strokeWeight(s);
    point(x,y);
  }
  
  
}
