//! to change app language

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/services/my_services.dart';

class LocaleController extends GetxController {
  // selected language
  Locale? language;
  MyServices myServices = Get.find();
  changeLanguage(String languageCode) {
    // get language code
    Locale locale = Locale(languageCode);
    // store language code in locale cache device
    myServices.sharedPreferences.setString('langCode', languageCode);
    // change laguage over all app
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String codeLang = myServices.sharedPreferences.getString('langCode') ??
        Get.deviceLocale!.languageCode;

    language = Locale(codeLang);

    super.onInit();
  }
}
