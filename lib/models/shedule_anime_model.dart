class ScheduleAnime {
  late int malId;
  late String title;
  late String imageUrl;
  late String synopsis;
  late String type;

  ScheduleAnime({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
    required this.type,
  });

  factory ScheduleAnime.fromJson(Map<String, dynamic> json) {
    return ScheduleAnime(
      malId: json['mal_id'] ?? 0,
      title: json['title'] ?? "",
      imageUrl: json['image_url'] ?? "",
      synopsis: json['synopsis'],
      type: json['type'],
    );
  }
}
