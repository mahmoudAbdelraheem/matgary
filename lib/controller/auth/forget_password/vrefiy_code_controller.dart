import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class VrefiyCodeController extends GetxController {
  //? login and go to the home screen
  checkVerificationCode(String vrefiyCode);

  goToResetPassword();
}

class VrefiyCodeControllerImp extends VrefiyCodeController {
  late TextEditingController email;

  @override
  checkVerificationCode(String vrefiyCode) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPasswordScreen);
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
