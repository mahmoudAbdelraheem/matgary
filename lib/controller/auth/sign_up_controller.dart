import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  //? sign up and go to the verfiy email code screen
  signUp();
  //? go to login screen
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> signUpFormState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController name;

  bool isPasswordShow = true;

//? for show password and change icon
  showPassword() {
    isPasswordShow = !isPasswordShow;
    update();
  }

  @override
  signUp() {
    if (signUpFormState.currentState!.validate()) {
      Get.offNamed(AppRoutes.vrefiyEmailCodeScreen);
      //! Get.delete<SignUpControllerImp>(); //? to ensure that the all datated form memory
      //? we can just use Get.delete() or Get.lazyPut
    } else {
      print('not vaild');
    }
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
