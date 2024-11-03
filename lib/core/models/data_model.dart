class DataModel {
  String title;
  String image;
  String overview;
  String date;
  dynamic voteAverage;
  dynamic voteCount;
  dynamic popularity;
  String language;

  DataModel({
    required this.title,
    required this.image,
    required this.overview,
    required this.date,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.language,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      title: json['name'] ?? json['title'],
      image: json['poster_path'] ?? '',
      overview: json['overview'] ?? '',
      date: json['release_date'] ?? json['first_air_date'] ?? '',
      voteAverage: json['vote_average'] ?? '0',
      voteCount: json['vote_count'] ?? '0',
      popularity: json['popularity'] ?? '0',
      language: json['original_language'] ?? '',
    );
  }
}

class DataModelList {
  List<DataModel> list;
  DataModelList({required this.list});

  factory DataModelList.fromJson(List<dynamic> json) {
    return DataModelList(
      list: List<DataModel>.from(json.map((x) => DataModel.fromJson(x))),
    );
  }
}
