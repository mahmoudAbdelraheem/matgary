import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

ThemeData englishTheme = ThemeData(
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
