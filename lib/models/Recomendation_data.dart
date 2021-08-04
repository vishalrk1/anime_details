class RecomendationModel {
  late int malId;
  late String url;
  late String imageUrl;
  late String title;

  RecomendationModel({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
  });

  factory RecomendationModel.formJson(Map<String, dynamic> json) {
    return RecomendationModel(
      malId: json['mal_id'] ?? 1,
      url: json['url'] ?? "",
      imageUrl: json['image_url'] ?? "",
      title: json['title'] ?? "",
    );
  }
}
