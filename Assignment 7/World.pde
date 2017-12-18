class World{
  XML xml_world;
  XML channel_world;
  XML feed_source_world;
  XML[] children_world;
  XML[] item_world;
  XML title_world;
  int x_world = 50;
  int y_world = 50;
  int page;
  int d = day();
  int m = month();
  int y = year();

void setup_world(){
  page = 5;
  textSize(30);
  fill(#5F0813);
  text(m, 500, 25);
  text(d, 525, 25);
  text(y, 575, 25);
  xml_world = loadXML("http://feeds.bbci.co.uk/news/world/rss.xml?edition=uk");
  channel_world = xml_world.getChild("channel");
  feed_source_world = channel_world.getChild("title");
  textSize(30);
  fill(#5F0813);
  text(feed_source_world.getContent(), 30, 25);
  children_world = channel_world.getChildren("item");
  for(int j = 0; j < children_world.length; j++){
    title_world = children_world[j].getChild("title");
    textSize(20);
    fill(#5F0813);
    text(title_world.getContent(), x_world, y_world);
    y_world += 30;
    link = children_world[j].getChild("link").getContent();
    }
  }
}