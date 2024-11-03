class SearchModel {
  int id;
  String title;
  String poster_path;
  String overview;
  String realase_date;
  dynamic vote_average;
  dynamic vote_count;
  dynamic popularity;

  SearchModel({
    required this.id,
    required this.title,
    required this.poster_path,
    required this.overview,
    required this.realase_date,
    required this.vote_average,
    required this.vote_count,
    required this.popularity,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
        id: json['id'],
        title: json['name'] ?? json['title'],
        poster_path: json['poster_path'] ?? '',
        overview: json['overview'] ?? '',
        realase_date: json['release_date'] ?? json['first_air_date'] ?? '',
        vote_average: json['vote_average'] ?? '0',
        vote_count: json['vote_count'] ?? '0',
        popularity: json['popularity'] ?? '0');
  }
}

class SearchModelList {
  List<SearchModel>? list;
  SearchModelList({required this.list});

  factory SearchModelList.fromJson(List<dynamic> json) {
    return SearchModelList(
      list: List<SearchModel>.from(json.map((x) => SearchModel.fromJson(x))),
    );
  }
}
