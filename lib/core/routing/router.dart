import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/models/data_model.dart';
import 'package:movies/core/models/people_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/features/home/home.dart';
import 'package:movies/features/home/logic/home_cubit.dart';
import 'package:movies/features/movie_info/movie_info.dart';
import 'package:movies/features/people_info/people_info.dart';
import 'package:movies/features/search/logic/search_cubit.dart';
import 'package:movies/features/search/search.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit()..getHomeData(),
                  child: const Home(),
                ));

      case AppRoutes.search:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SearchCubit(),
                  child: const Search(),
                ));

      case AppRoutes.peopleInfo:
        PeopleModel data = settings.arguments as PeopleModel;
        return MaterialPageRoute(
          builder: (_) => PeopleInfo(
            data: data,
          ),
        );

      case AppRoutes.movieInfo:
        final arg = settings.arguments as Map<String, dynamic>;
        DataModel data = arg['data'];
        DataModelList list = arg['list'];
        return MaterialPageRoute(
          builder: (_) => MovieInfo(
            data: data,
            dataModelList: list,
          ),
        );

      default:
        return null;
    }
  }
}
