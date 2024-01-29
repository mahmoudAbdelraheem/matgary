import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class ForgetPassworController extends GetxController {
  //? login and go to the vrefiy code screen
  checkEmail();
}

class ForgetPassworControllerImp extends ForgetPassworController {
  late TextEditingController email;
  GlobalKey<FormState> forgetPassFormState = GlobalKey<FormState>();

  @override
  checkEmail() {
    if (forgetPassFormState.currentState!.validate()) {
      Get.toNamed(AppRoutes.vrefiyCodeScreen);
      //Get.delete<ForgetPassworControllerImp>();
    } else {
      print('not valid');
    }
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
