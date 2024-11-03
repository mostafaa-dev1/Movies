import 'package:flutter/material.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/widgets/movie_home_item.dart';

class TopSeries extends StatelessWidget {
  const TopSeries({super.key, required this.topSeries});
  final DataModelList topSeries;

  @override
  Widget build(BuildContext context) {
    return MovieHomeItem(dataModelList: topSeries);
  }
}
