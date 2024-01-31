import 'package:get/get.dart';
import 'package:matgary/core/class/statuse_request.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/functions/defualt_alert_dialog.dart';
import 'package:matgary/core/functions/handling_data.dart';
import 'package:matgary/data/datasource/remote/auth/vrefiy_email_code.dart';

abstract class VrefiyEmailCodeController extends GetxController {
  //? login and go to the home screen
  checkEmailVerificationCode(String vrefiyCode);

  goToSuccessSignUp();
}

class VrefiyEmailCodeControllerImp extends VrefiyEmailCodeController {
  String? email;
  //? post user vrefiy code data
  VrefiyEmailCodeData vrefiyData = VrefiyEmailCodeData(crudImp: Get.find());
  //? check response of posting user data
  StatuseRequest? statuseRequest;
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
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUpScreen);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
