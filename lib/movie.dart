import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/routing/router.dart';
import 'package:movies/core/theme/dark_theme.dart';
import 'package:movies/core/theme/light_theme.dart';

class Movies extends StatelessWidget {
  final AppRouter appRouter;
  const Movies({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(width, height),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        onGenerateRoute: (settings) {
          return appRouter.generateRoute(settings);
        },
      ),
    );
  }
}
