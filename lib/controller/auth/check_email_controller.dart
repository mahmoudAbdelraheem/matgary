import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class CheckEmailController extends GetxController {
  //? login and go to the home screen
  checkEmail();
  //? go to sign up screen
  goToSuccessSignUp();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  checkEmail() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSingUpScreen);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
