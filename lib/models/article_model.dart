class ArticleModel {
  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  String? content;
  String source;
  String? publishedAt;

  ArticleModel(
      {this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.url,
      required this.urlToImage,
      required this.source,
      this.publishedAt});
}
