import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  //? sign up and go to the home screen
  signUp();
  //? go to login screen
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  //late GlobalKey<FormState> formState;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController name;

  @override
  signUp() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
    //formState = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    super.dispose();
  }
}
