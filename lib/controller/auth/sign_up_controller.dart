import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statuse_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/defualt_alert_dialog.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/auth/sing_up.dart';

abstract class SignUpController extends GetxController {
  //? sign up and go to the verfiy email code screen
  signUp();
  //? go to login screen
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> signUpFormState = GlobalKey<FormState>();

//? for Text Controller
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController name;
  //? for show password
  bool isPasswordShow = true;
  //? post user data
  SignUpData signUpData = SignUpData(crudImp: Get.find());
  //? check response of posting user data
  StatuseRequest statuseRequest = StatuseRequest.defualt;

//?
  tryAgain() {
    statuseRequest = StatuseRequest.defualt;
    update();
  }

//? for show password and change icon
  showPassword() {
    isPasswordShow = !isPasswordShow;
    update();
  }

//? post user data to database
  @override
  signUp() async {
    if (signUpFormState.currentState!.validate()) {
      //? loading
      statuseRequest = StatuseRequest.loading;
      update(); //? update to refresh loading ui
      //? post user data
      var response = await signUpData.postData(
        name: name.text,
        email: email.text,
        phone: phone.text,
        password: password.text,
      );
      //? check response
      statuseRequest = handlingData(response);
      if (statuseRequest == StatuseRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(
            AppRoutes.vrefiyEmailCodeScreen,
            arguments: {'email': email.text},
          );
          //! Get.delete<SignUpControllerImp>();
          //! to ensure that the all datated form memory
          //? we can just use Get.delete() or Get.lazyPut
        } else {
          //! thow alert dialog for user
          //?email or phone are
          defualtAlertDialog(
            'Warring',
            'Email Or Phone Alredy Existing\nTry Another Email Or Phone.',
          );
        }
      }
      update();
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
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
