//! to change app language

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_theme.dart';
import 'package:matgary/core/services/my_services.dart';

class LocaleController extends GetxController {
  // selected language
  Locale? language;
  //
  ThemeData appTheme = englishTheme;
  //
  MyServices myServices = Get.find();
  changeLanguage(String languageCode) {
    // get language code
    Locale locale = Locale(languageCode);

    // store language code in locale cache device
    myServices.sharedPreferences.setString('langCode', languageCode);
    // change laguage over all app
    appTheme = languageCode == 'en' ? englishTheme : arabicTheme;
    Get.updateLocale(locale);

    Get.changeTheme(appTheme);
  }

  @override
  void onInit() {
    String? codeLang = myServices.sharedPreferences.getString('langCode');
    if (codeLang == 'ar') {
      language = Locale(codeLang!);
      appTheme = arabicTheme;
    } else if (codeLang == 'en') {
      language = Locale(codeLang!);
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }
}
