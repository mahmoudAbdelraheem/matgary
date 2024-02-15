import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/services/my_services.dart';

abstract class SettingController extends GetxController {
  //? logout from account
  logout();
}

class SettingControllerImp extends SettingController {
  //?
  //? list for setting card information (title&icon)
  final List cardInfo = [
    {
      'title': "Disable Notification",
      'icon': Icons.notifications_off_outlined,
    },
    {
      'title': "Address",
      'icon': Icons.location_on_outlined,
    },
    {
      'title': "Contact US",
      'icon': Icons.phone_callback_outlined,
    },
    {
      'title': "About US",
      'icon': Icons.contact_support_outlined,
    },
    {
      'title': "Logout",
      'icon': Icons.exit_to_app_outlined,
    },
  ];

  //? for logout
  final MyServices _myServices = Get.find();
  late String _langCode;
  @override
  logout() {
    //? get user selected language
    _langCode = _myServices.sharedPreferences.getString('langCode')!;
    //? clear user data from device cache
    _myServices.sharedPreferences.clear();
    //? set step by 1 to be in login screen And language code
    _myServices.sharedPreferences.setString('step', '1');
    _myServices.sharedPreferences.setString('langCode', _langCode);
    //? go to login screen
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}