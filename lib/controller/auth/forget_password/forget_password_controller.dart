import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class ForgetPassworController extends GetxController {
  //? login and go to the home screen
  checkEmail();
  //? go to sign up screen
  goToVrefiyCode();
}

class ForgetPassworControllerImp extends ForgetPassworController {
  late TextEditingController email;

  @override
  checkEmail() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToVrefiyCode() {
    Get.toNamed(AppRoutes.vrefiyCodeScreen);
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
