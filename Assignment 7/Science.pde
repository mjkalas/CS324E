class Science{
  XML xml_science;
  XML channel_science;
  XML feed_source_science;
  XML[] children_science;
  XML[] item_science;
  XML title_science;
  int x_science = 50;
  int y_science = 50;
  int page;
  int d = day();
  int m = month();
  int y = year();

void setup_science(){
  page = 3;
  textSize(30);
  fill(#A55403);
  text(m, 500, 25);
  text(d, 525, 25);
  text(y, 575, 25);
  xml_science = loadXML("http://feeds.bbci.co.uk/news/science_and_environment/rss.xml?edition=uk");
  channel_science = xml_science.getChild("channel");
  feed_source_science = channel_science.getChild("title");
  textSize(30);
  fill(#A55403);
  text(feed_source_science.getContent(), 30, 25);
  children_science = channel_science.getChildren("item");
  for(int j = 0; j < children_science.length; j++){
    title_science = children_science[j].getChild("title");
    textSize(20);
    fill(#A55403);
    text(title_science.getContent(), x_science, y_science);
    y_science += 30;
    link = children_science[j].getChild("link").getContent();
    }
  }
}