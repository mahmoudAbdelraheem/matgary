import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class ResetPassworController extends GetxController {
  checkPassword();

  goToSuccessResetPassword();
}

class ResetPassworControllerImp extends ResetPassworController {
  late TextEditingController password;
  late TextEditingController rePassword;

  @override
  checkPassword() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRoutes.successResetPasswordScreen);
  }

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
