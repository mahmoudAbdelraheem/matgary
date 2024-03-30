import 'package:get/get.dart';
import '../../../core/constant/routes.dart';

abstract class SuccessResetPassController extends GetxController {
  goToLoginScreen();
}

class SuccessResetPassControllerImp extends SuccessResetPassController {
  @override
  goToLoginScreen() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
