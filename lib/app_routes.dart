import 'package:flutter/material.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/view/screen/auth/login_screen.dart';
import 'package:matgary/view/screen/on_boarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.loginScreen: (context) => const LoginScreen(),
  AppRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),
};
