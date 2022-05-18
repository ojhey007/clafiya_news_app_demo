class Article {
  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;

  Article(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.publshedAt,
      required this.urlToImage,
      required this.articleUrl});

  Article.fromJson(Map<String, dynamic> json)
      : title = json["title"] ?? "",
        description = json["description"] ?? "",
        author = json["author"] ?? "",
        content = json["content"] ?? "",
        publshedAt = DateTime.parse(json["publishedAt"] ?? ""),
        urlToImage = json["urlToImage"] ?? "",
        articleUrl = json["articleUrl"] ?? "";

  static getList(List<dynamic>? json) {
    List<Map<String, dynamic>> articles =
        List<Map<String, dynamic>>.from(json ?? []);
    return List.generate(
        articles.length, (index) => Article.fromJson(articles[index]));
  }
}
