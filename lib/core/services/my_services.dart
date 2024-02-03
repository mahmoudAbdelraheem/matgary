import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  static Future<MyServices> init() async {
    MyServices myServices = MyServices();
    await Firebase.initializeApp();
    myServices.sharedPreferences = await SharedPreferences.getInstance();
    return myServices;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices.init());
}
