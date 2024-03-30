import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statuse_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/defualt_alert_dialog.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/datasource/remote/auth/forgetpassword/reset_pass_data.dart';

abstract class ResetPassworController extends GetxController {
  checkPassword();

  goToSuccessResetPassword();
}

class ResetPassworControllerImp extends ResetPassworController {
  GlobalKey<FormState> resetPassFormState = GlobalKey<FormState>();

  String? email;

  late TextEditingController password;
  late TextEditingController rePassword;

  bool isPasswordShow = true;
  bool isRePasswordShow = true;

  ResetPasswordData resetPassData = ResetPasswordData(crudImp: Get.find());
  StatuseRequest statuseRequest = StatuseRequest.defualt;

  tryAgain() {
    statuseRequest = StatuseRequest.defualt;
    update();
  }

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
    if (password.text == rePassword.text) {}
  }

  @override
  goToSuccessResetPassword() async {
    if (resetPassFormState.currentState!.validate()) {
      if (password.text != rePassword.text) {
        return defualtAlertDialog('Warring', 'Password Dose Not Match');
      } else {
        statuseRequest = StatuseRequest.loading;
        update();
        var response = await resetPassData.resetData(
          email: email!,
          newPass: password.text,
        );
        statuseRequest = handlingData(response);
        if (statuseRequest == StatuseRequest.success) {
          if (response['status'] == 'success') {
            defualtAlertDialog('success', 'password updated successfuly.');
            Get.offAllNamed(AppRoutes.successResetPasswordScreen);
          } else {
            defualtAlertDialog('warring', 'some thing went wrrong.');
          }
        } else {
          defualtAlertDialog('warring', 'some thing went wrrong.');
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
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
