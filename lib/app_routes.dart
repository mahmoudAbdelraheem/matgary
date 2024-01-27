import 'package:flutter/material.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/view/screen/auth/login_screen.dart';
import 'package:matgary/view/screen/auth/signup_screen.dart';
import 'package:matgary/view/screen/on_boarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),
  AppRoutes.loginScreen: (context) => const LoginScreen(),
  AppRoutes.signUpScreen: (context) => const SignUpScreen(),
};
