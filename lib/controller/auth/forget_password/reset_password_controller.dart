import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class ResetPassworController extends GetxController {
  checkPassword();

  goToSuccessResetPassword();
}

class ResetPassworControllerImp extends ResetPassworController {
  GlobalKey<FormState> resetPassFormState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;

  bool isPasswordShow = true;
  bool isRePasswordShow = true;

//? for show password and change icon
  showPassword() {
    isPasswordShow = !isPasswordShow;
    update();
  }

  showRePassword() {
    isRePasswordShow = !isRePasswordShow;
    update();
  }

  @override
  checkPassword() {
    if (resetPassFormState.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.successResetPasswordScreen);
      // Get.delete<ResetPassworControllerImp>();
    } else {
      print('not valid');
    }
  }

  @override
  goToSuccessResetPassword() {}

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
