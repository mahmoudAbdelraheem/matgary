//? take arabic and english name and return the selected language
import 'package:get/get.dart';
import 'package:matgary/core/services/my_services.dart';

translateDatabase(String en, String ar) {
  final MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString('langCode') == 'en') {
    return en;
  } else {
    return ar;
  }
}
