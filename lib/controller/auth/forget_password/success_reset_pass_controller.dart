import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';

abstract class SuccessResetPassController extends GetxController {
  goToLoginScreen();
}

class SuccessResetPassControllerImp extends SuccessResetPassController {
  @override
  goToLoginScreen() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
