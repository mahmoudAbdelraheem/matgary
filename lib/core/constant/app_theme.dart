import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'PlayfairDisplay',
  textTheme: TextTheme(
    titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
      color: AppColors.myGrey,
    ),
  ),
  useMaterial3: false,
);
