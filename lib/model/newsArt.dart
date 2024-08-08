class NewsArt {
  String imgurl;
  String newsDesc;
  String newsHead;
  String newscontent;
  String newsUrl;

  NewsArt({
    required this.imgurl,
    required this.newsDesc,
    required this.newsHead,
    required this.newsUrl,
    required this.newscontent,
  });

  static fromAPItoAPP(Map<String, dynamic> article) {
    return NewsArt(
        imgurl: article["urlToImage"] ??
            "https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
        newsDesc: article["description"] ?? "--",
        newsHead: article["title"] ?? '--',
        newsUrl: article["url"] ??
            "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en ",
        newscontent: article["content"] ?? "--");
  }
}
