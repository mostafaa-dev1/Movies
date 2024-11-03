import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/theme/text_styles.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: AppTextStyles.style18Bb,
    headlineMedium: AppTextStyles.style14Bb,
    headlineSmall: AppTextStyles.style13w400g700,
    bodyMedium: AppTextStyles.style16Bb,
    bodyLarge: AppTextStyles.style25Bb,
    titleLarge: AppTextStyles.style27Bb,
  ),
  brightness: Brightness.light,
  cardColor: const Color.fromARGB(255, 245, 245, 245),
  highlightColor: const Color.fromARGB(255, 243, 243, 243),
  primaryColor: AppColors.mainColor,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.mainColor,
    primary: Colors.white,
    background: Colors.grey[300],
    secondary: const Color.fromARGB(255, 219, 219, 219),
    shadow: Colors.grey[100],
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      )),
);
