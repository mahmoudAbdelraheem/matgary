import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/services/my_services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool('login') == true) {
      return const RouteSettings(name: AppRoutes.loginScreen);
    }
    return null;
  }
}
