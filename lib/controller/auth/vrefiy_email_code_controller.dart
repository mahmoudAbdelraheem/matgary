import 'package:get/get.dart';
import '../../core/class/statuse_request.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/defualt_alert_dialog.dart';
import '../../core/functions/handling_data.dart';
import '../../data/datasource/remote/auth/vrefiy_email_code.dart';

abstract class VrefiyEmailCodeController extends GetxController {
  //? login and go to the home screen
  checkEmailVerificationCode(String vrefiyCode);
  //? resend virefiy code
  resendVirefiyCode();

  goToSuccessSignUp();
}

class VrefiyEmailCodeControllerImp extends VrefiyEmailCodeController {
  String? email;
  String? code;
  //? post user vrefiy code data
  VrefiyEmailCodeData vrefiyData = VrefiyEmailCodeData(crudImp: Get.find());
  //? check response of posting user data
  StatuseRequest statuseRequest = StatuseRequest.defualt;
  @override
  checkEmailVerificationCode(String vrefiyCode) async {
    //? loading
    statuseRequest = StatuseRequest.loading;
    update(); //? update to refresh loading ui
    //? post user data
    var response = await vrefiyData.postvrefiyCodeData(
      email: email!,
      vrefiyCode: vrefiyCode,
    );
    //? check response
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        //? go to success singn up page
        Get.offNamed(AppRoutes.successSignUpScreen);
        defualtAlertDialog(
          'Congratolations',
          'Your Vreification Code Correct.',
        );
      } else {
        //! thow alert dialog for user
        //?  vrefiy code dose not match
        defualtAlertDialog(
          'Warring',
          'Your Vreification Code Dose not Match\nPlease Enter Correct Code.',
        );
      }
    }
    update();
  }

  @override
  resendVirefiyCode() async {
    //? send another vrefiy code to user email
    var response = await vrefiyData.resendVrefiyCode(
      email: email!,
    );
    //? check response
    statuseRequest = handlingData(response);
    if (statuseRequest == StatuseRequest.success) {
      if (response['status'] == 'success') {
        defualtAlertDialog(
          'hint',
          'Vreification Code Send To Your Email.',
        );
      } else {
        defualtAlertDialog(
          'Warring',
          'Something Wrong Please Try Again.',
        );
      }
    }
    update();
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUpScreen);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    code = Get.arguments['code'];
    //? if the value of code = 1
    //? the new vreification code will send to user email
    if (code == '1') {
      resendVirefiyCode();
    }
    super.onInit();
  }
}
