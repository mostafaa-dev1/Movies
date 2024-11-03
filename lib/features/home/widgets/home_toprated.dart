import 'package:flutter/material.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/widgets/movie_home_item.dart';

class HomeTopRated extends StatelessWidget {
  const HomeTopRated({
    super.key,
    required this.topRated,
  });
  final DataModelList topRated;

  @override
  Widget build(BuildContext context) {
    return MovieHomeItem(dataModelList: topRated);
  }
}
