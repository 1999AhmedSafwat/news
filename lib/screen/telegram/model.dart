class ConversationModel {
  late String imageUrl, name, lastMessage, day;
  late bool isSeen, active;

  ConversationModel({
    required this.imageUrl,
    required this.day,
    required this.lastMessage,
    required this.name,
    required this.isSeen,
    required this.active,
  });
}

class ArticleModel {
  late String sourceName, author, title, url, publishedAt;

  ArticleModel({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.url,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      sourceName: json['source.name'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      publishedAt: json['publishedAt'] as String,
    );
  }
}
