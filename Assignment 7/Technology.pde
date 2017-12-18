class Technology{
  XML xml_technology;
  XML channel_technology;
  XML feed_source_technology;
  XML[] children_technology;
  XML[] item_technology;
  XML title_technology;
  int x_technology = 50;
  int y_technology = 50;
  int page;
  int d = day();
  int m = month();
  int y = year();

void setup_technology(){
  page = 4;
  textSize(30);
  fill(#38085F);
  text(m, 500, 25);
  text(d, 525, 25);
  text(y, 575, 25);
  xml_technology = loadXML("http://feeds.bbci.co.uk/news/technology/rss.xml?edition=uk");
  channel_technology = xml_technology.getChild("channel");
  feed_source_technology = channel_technology.getChild("title");
  textSize(30);
  fill(#38085F);
  text(feed_source_technology.getContent(), 30, 25);
  children_technology = channel_technology.getChildren("item");
  for(int j = 0; j < children_technology.length; j++){
    title_technology = children_technology[j].getChild("title");
    textSize(20);
    fill(#38085F);
    text(title_technology.getContent(), x_technology, y_technology);
    y_technology += 30;
    link = children_technology[j].getChild("link").getContent();
    }
  }
}