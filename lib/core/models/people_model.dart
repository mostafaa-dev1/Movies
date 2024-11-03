import 'package:movies/core/models/data_model.dart';

class PeopleModel {
  final String name;
  final String image;
  final String knownAs;
  final List<DataModel> knownFor;

  PeopleModel({
    required this.name,
    required this.image,
    required this.knownAs,
    required this.knownFor,
  });

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
      name: json['name'],
      image: json['profile_path'] ?? '',
      knownAs: json['known_for_department'],
      knownFor: List<DataModel>.from(
          json['known_for'].map((x) => DataModel.fromJson(x))),
    );
  }
}

class KnownFor {
  final String title;
  final String image;
  final String overview;
  final String popularity;
  final String date;
  final String voteAverage;
  final String voteCount;
  final String language;

  KnownFor({
    required this.title,
    required this.image,
    required this.overview,
    required this.popularity,
    required this.date,
    required this.voteAverage,
    required this.voteCount,
    required this.language,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
      title: json['title'] ?? '',
      image: json['poster_path'],
      overview: json['overview'],
      popularity: json['popularity'].toString(),
      date: json['release_date'] ?? '',
      voteAverage: json['vote_average'].toString(),
      voteCount: json['vote_count'].toString(),
      language: json['original_language'],
    );
  }
}

class PeopleModelList {
  List<PeopleModel> list;
  PeopleModelList({required this.list});

  factory PeopleModelList.fromJson(List<dynamic> json) {
    return PeopleModelList(
      list: List<PeopleModel>.from(json.map((x) => PeopleModel.fromJson(x))),
    );
  }
}
