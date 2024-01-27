import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  //? login and go to the home screen
  login();
  //? go to sign up screen
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  //late GlobalKey<FormState> formState;

  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  @override
  void onInit() {
    //formState = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
