class HomeCardModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;
  late var score;

  HomeCardModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.score,
  });

  factory HomeCardModel.fromJson(Map<String, dynamic> json) {
    return HomeCardModel(
      malId: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? "",
      title: json['title'] ?? "",
      score: json['score'] ?? 5.0,
    );
  }
}
