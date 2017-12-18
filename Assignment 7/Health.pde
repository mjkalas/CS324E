class Health{
  XML xml_health;
  XML channel_health;
  XML feed_source_health;
  XML[] children_health;
  XML[] item_health;
  XML title_health;
  String link_health;
  int x_health = 50;
  int y_health = 50;
  int page;
  int d = day();
  int m = month();
  int y = year();

void setup_health(){
  page = 1;
  textSize(30);
  fill(#066428);
  text(m, 500, 25);
  text(d, 525, 25);
  text(y, 575, 25);
  xml_health = loadXML("http://feeds.bbci.co.uk/news/health/rss.xml?edition=uk");
  channel_health = xml_health.getChild("channel");
  feed_source_health = channel_health.getChild("title");
  textSize(30);
  fill(#066428);
  text(feed_source_health.getContent(), 30, 25);
  children_health = channel_health.getChildren("item");
  for(int j = 0; j < children_health.length; j++){
    title_health = children_health[j].getChild("title");
    textSize(20);
    fill(#066428);
    text(title_health.getContent(), x_health, y_health);
    y_health += 30;
    link_health = children_health[j].getChild("link").getContent();
    }
        println(title_health);
  }

void mousePressed(){
}

void showMouseOver(){
}
}