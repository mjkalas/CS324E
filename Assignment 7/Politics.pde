class Politics{
  XML xml_politics;
  XML channel_politics;
  XML feed_source_politics;
  XML[] children_politics;
  XML[] item_politics;
  XML title_politics;
  int x_politics = 50;
  int y_politics = 50;
  int page;
  int d = day();
  int m = month();
  int y = year();

void setup_politics(){
  page = 2;
  textSize(30);
  fill(#030AA5);
  text(m, 500, 25);
  text(d, 525, 25);
  text(y, 575, 25);
  xml_politics = loadXML("http://feeds.bbci.co.uk/news/politics/rss.xml?edition=uk");
  channel_politics = xml_politics.getChild("channel");
  feed_source_politics = channel_politics.getChild("title");
  textSize(30);
  fill(#030AA5);
  text(feed_source_politics.getContent(), 30, 25);
  children_politics = channel_politics.getChildren("item");
  for(int j = 0; j < children_politics.length; j++){
    title_politics = children_politics[j].getChild("title");
    textSize(20);
    fill(#030AA5);
    text(title_politics.getContent(), x_politics, y_politics);
    y_politics += 30;
    String link_politics = children_politics[j].getChild("link").getContent();
    }
  }
}