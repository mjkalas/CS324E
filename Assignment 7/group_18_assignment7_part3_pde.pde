World world;
Technology technology;
Science science;
Politics politics;
Health health;
int rectX, rectY;
String link;

void setup() {
  size (650, 800);
}

void draw() {
  /*world = new World();
  //world.setup_world();
  //technology = new Technology();
  technology.setup_technology();
  science = new Science();
  science.setup_science();
  politics = new Politics();
  politics.setup_politics();*/
  health = new Health();
  health.setup_health();
  //if (mousePressed == true && page == 1){
      //link("http://feeds.bbci.co.uk/news/health/rss.xml?edition=uk");
}

void mousePressed() { 
}