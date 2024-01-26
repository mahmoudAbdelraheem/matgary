import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/app_routes.dart';
import 'package:matgary/core/constant/app_theme.dart';
import 'package:matgary/view/screen/on_boarding_screen.dart';

void main() {
  runApp(const MatgaryApp());
}

class MatgaryApp extends StatelessWidget {
  const MatgaryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Eeommerce App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const OnBoardingScreen(),
      routes: routes,
    );
  }
}
