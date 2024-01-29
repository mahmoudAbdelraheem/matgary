import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLoginScreen();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLoginScreen() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
