import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/defualt_alert_dialog.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/data/datasource/remote/auth/forgetpassword/vrefiy_code_data.dart';

abstract class VrefiyCodeController extends GetxController {
  //? login and go to the home screen
  checkVerificationCode(String vrefiyCode);

  goToResetPassword();
}

class VrefiyCodeControllerImp extends VrefiyCodeController {
  String? email;

  StatuseRequest statuseRequest = StatuseRequest.defualt;
  VrefiyPassCodeData vrefiyPassCodeData =
      VrefiyPassCodeData(crudImp: Get.find());

  tryAgain() {
    statuseRequest = StatuseRequest.defualt;
    update();
  }

  @override
  checkVerificationCode(String vrefiyCode) async {
    statuseRequest = StatuseRequest.loading;
    update();
    var response = await vrefiyPassCodeData.checkData(
      email: email!,
      vrefiyCode: vrefiyCode,
    );
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetPasswordScreen,
            arguments: {'email': email});
      } else {
        defualtAlertDialog('Warring', 'Vreification Code Not Correct');
      }
    } else {
      defualtAlertDialog('Warring', 'some thing went wrrong.');
    }
  }

  @override
  goToResetPassword() {}

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
