import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statuse_request.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/defualt_alert_dialog.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/datasource/remote/auth/forgetpassword/check_email_data.dart';

abstract class ForgetPassworController extends GetxController {
  //? login and go to the vrefiy code screen
  checkEmail();
}

class ForgetPassworControllerImp extends ForgetPassworController {
  late TextEditingController email;
  GlobalKey<FormState> forgetPassFormState = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(crudImp: Get.find());
  StatuseRequest statuseRequest = StatuseRequest.defualt;

  tryAgain() {
    statuseRequest = StatuseRequest.defualt;
    update();
  }

  @override
  checkEmail() async {
    if (forgetPassFormState.currentState!.validate()) {
      statuseRequest = StatuseRequest.loading;
      update();

      var response = await checkEmailData.checkData(email: email.text);

      statuseRequest = handlingData(response);
      if (statuseRequest == StatuseRequest.success) {
        if (response['status'] == 'success') {
          Get.toNamed(
            AppRoutes.vrefiyCodeScreen,
            arguments: {'email': email.text},
          );
        } else {
          defualtAlertDialog('Warring', 'This Email Not Found');
        }
      } else {
        defualtAlertDialog('Warring', 'This Email Not Found');
      }
      update();
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
