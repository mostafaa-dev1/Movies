import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/core/theme/colors.dart';
import 'package:movies/core/theme/text_styles.dart';

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
    headlineLarge: AppTextStyles.style18Bb.copyWith(color: Colors.white),
    headlineMedium: AppTextStyles.style14Bb.copyWith(color: Colors.white),
    headlineSmall: AppTextStyles.style13w400g700.copyWith(color: Colors.white),
    bodyMedium: AppTextStyles.style16Bb.copyWith(color: Colors.white),
    bodyLarge: AppTextStyles.style25Bb.copyWith(color: Colors.white),
    titleLarge: AppTextStyles.style27Bb.copyWith(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  brightness: Brightness.dark,
  cardColor: Colors.grey[900],
  primaryColor: AppColors.mainColor,
  highlightColor: Colors.grey[900],
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AppColors.mainColor,
    primary: AppColors.mainColor,
    background: Colors.black,
    secondary: AppColors.secodaryColor,
    shadow: Colors.black,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.mainColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColor,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
      )),
);
