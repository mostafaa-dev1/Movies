import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/bloc_observer/bloc_observer.dart';
import 'package:movies/core/routing/router.dart';
import 'package:movies/movie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(Movies(
    appRouter: AppRouter(),
  ));
}
