import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData englishTheme = ThemeData(
  //? floating action button
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.myBlue,
  ),
  //? app bar theme
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: AppColors.myBlue,
    toolbarHeight: 60,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.myWhite,
    ),
  ),
  fontFamily: 'SignikaNegative',
  textTheme: TextTheme(
    titleLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.myGrey,
    ),
  ),
  useMaterial3: false,
);
ThemeData arabicTheme = ThemeData(
  fontFamily: 'Cairo',
  textTheme: TextTheme(
    titleLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.myGrey,
    ),
  ),
  useMaterial3: false,
);
