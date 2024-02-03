import 'package:get/get.dart';
import 'package:matgary/core/services/my_services.dart';

abstract class HomeController extends GetxController {
  getUserDate();
}

class HomeControllerImp extends HomeController {
  final MyServices _myServices = Get.find();
  String? name;
  String? email;
  String? phone;
  @override
  getUserDate() {}

  @override
  void onInit() {
    name = _myServices.sharedPreferences.getString('name');
    email = _myServices.sharedPreferences.getString('email');
    phone = _myServices.sharedPreferences.getString('phone');
    super.onInit();
  }
}
