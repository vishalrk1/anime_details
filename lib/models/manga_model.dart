class MangaModel {
  late int malId;
  late var rank;
  late String title;
  late String url;
  late String imageUrl;
  late String type;
  late int volumes;
  late String startDate;
  late String endDate;
  late var score;
  late String status;
  late int chapters;
  late String synopsis;
  late List genres;
  late var genreId;

  MangaModel({
    this.malId = 0,
    this.url = '',
    this.imageUrl = '',
    this.title = '',
    this.type = '',
    this.volumes = 0,
    this.score = 0,
    this.rank = 0,
    this.startDate = '',
    this.endDate = '',
    this.chapters = 0,
    this.status = '',
    this.synopsis = '',
    // this.genres = const [],
    this.genreId = 1,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    // List genresList = json['genres'];
    // List tempGenresList = [];
    // for (int i = 0; i < genresList.length; i++) {
    //   var genres = json['genres'][i]['name'];
    //   tempGenresList.add(genres);
    //   // print(tempGenresList);
    // }
    return MangaModel(
      malId: json['mal_id'] ?? 0,
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      startDate: json['start_date'] ?? 'Not Available',
      endDate: json['end_date'] ?? 'Not Available',
      type: json['type'] ?? 'Not Available',
      volumes: json['volumes'] ?? 0,
      score: json['score'] ?? 0.0,
      rank: json['rank'] ?? 0,
      chapters: json['chapters'] ?? 0,
      status: json['status'] ?? '',
      synopsis: json['synopsis'] ?? 'Not Available',
    );
  }
}
