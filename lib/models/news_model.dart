class NewsModel {
  late String title;
  late String url;
  late String imageUrl;
  late String formUrl;
  late String intro;
  late String authorName;
  late String authorUrl;

  NewsModel({
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.formUrl,
    required this.intro,
    required this.authorName,
    required this.authorUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      url: json['url'],
      imageUrl: json['image_url'],
      formUrl: json['forum_url'],
      intro: json['intro'],
      authorName: json['author_name'],
      authorUrl: json['author_url'],
    );
  }
}
