import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/defualt_alert_dialog.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/data/datasource/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  //? login and go to the home screen
  login();
  //? go to sign up screen
  goToSignUp();
  //? go to forget password screen
  goToforgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> loginFormState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isPasswordShow = true;

  StatuseRequest statuseRequest = StatuseRequest.defualt;
  LoginData loginData = LoginData(crudImp: Get.find());

  tryAgain() {
    statuseRequest = StatuseRequest.defualt;
    update();
  }

//? for show password and change icon
  showPassword() {
    isPasswordShow = isPasswordShow == true ? false : true;
    update();
  }

  @override
  login() async {
    if (loginFormState.currentState!.validate()) {
      //? loading
      statuseRequest = StatuseRequest.loading;
      update(); //? update to refresh loading ui
      //? check user data
      var response = await loginData.checkData(
        email: email.text,
        password: password.text,
      );
      //? check response
      statuseRequest = handlingData(response);
      if (statuseRequest == StatuseRequest.success) {
        if (response['status'] == 'success') {
          //? login success and go to home page
          Get.offAllNamed(AppRoutes.homeScreen);
        } else {
          defualtAlertDialog(
            'Warring',
            'Email Or Password Not Correct.',
          );
        }
      }
      update();
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUpScreen);
  }

  @override
  goToforgetPassword() {
    Get.toNamed(AppRoutes.forgetPasswordScreen);
  }

  @override
  void onInit() {
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
