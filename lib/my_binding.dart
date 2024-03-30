import 'package:get/get.dart';
import 'controller/auth/forget_password/forget_password_controller.dart';
import 'controller/auth/forget_password/reset_password_controller.dart';
import 'controller/auth/login_controller.dart';
import 'controller/auth/sign_up_controller.dart';
import 'core/class/crud.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp(), fenix: true);

    Get.lazyPut(() => SignUpControllerImp(), fenix: true);

    Get.lazyPut(() => ForgetPassworControllerImp(), fenix: true);

    Get.lazyPut(() => ResetPassworControllerImp(), fenix: true);

    Get.put(CrudImp());
  }
}
