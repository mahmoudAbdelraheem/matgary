import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class VrefiyEmailCodeController extends GetxController {
  //? login and go to the home screen
  checkEmailVerificationCode(String vrefiyCode);

  goToSuccessSignUp();
}

class VrefiyEmailCodeControllerImp extends VrefiyEmailCodeController {
  late TextEditingController email;

  @override
  checkEmailVerificationCode(String vrefiyCode) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUpScreen);
  }

  @override
  void onInit() {
    //formState = GlobalKey<FormState>();
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
