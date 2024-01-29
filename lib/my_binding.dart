import 'package:get/get.dart';
import 'package:matgary/controller/auth/forget_password/forget_password_controller.dart';
import 'package:matgary/controller/auth/forget_password/reset_password_controller.dart';
import 'package:matgary/controller/auth/login_controller.dart';
import 'package:matgary/controller/auth/sign_up_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp(), fenix: true);

    Get.lazyPut(() => SignUpControllerImp(), fenix: true);

    Get.lazyPut(() => ForgetPassworControllerImp(), fenix: true);

    Get.lazyPut(() => ResetPassworControllerImp(), fenix: true);
  }
}
