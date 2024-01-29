import 'package:flutter/material.dart';
import 'package:matgary/core/constant/routes.dart';

import 'package:matgary/view/screen/auth/forget_password/forget_password_screen.dart';
import 'package:matgary/view/screen/auth/forget_password/reset_password_screen.dart';
import 'package:matgary/view/screen/auth/forget_password/success_reset_password_screen.dart';
import 'package:matgary/view/screen/auth/forget_password/vrefiy_code_screen.dart';
import 'package:matgary/view/screen/auth/login_screen.dart';
import 'package:matgary/view/screen/auth/signup_screen.dart';
import 'package:matgary/view/screen/auth/success_sign_up_screen.dart';
import 'package:matgary/view/screen/auth/vrefiy_email_code_screen.dart';
import 'package:matgary/view/screen/on_boarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //? on boarding
  AppRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),

  //? auth
  AppRoutes.loginScreen: (context) => const LoginScreen(),
  AppRoutes.signUpScreen: (context) => const SignUpScreen(),

  AppRoutes.vrefiyEmailCodeScreen: (context) => const VrefiyEmailCodeScreen(),

  AppRoutes.successSingUpScreen: (context) => const SuccessSignUpScreen(),

  AppRoutes.forgetPasswordScreen: (context) => const ForgetPasswordScreen(),
  AppRoutes.vrefiyCodeScreen: (context) => const VrefiyCodeScreen(),

  AppRoutes.resetPasswordScreen: (context) => const ResetPasswordScreen(),
  AppRoutes.successResetPasswordScreen: (context) =>
      const SuccessResetPasswordScreen(),
};
