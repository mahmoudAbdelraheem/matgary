import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../constant/routes.dart';
import '../services/my_services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoutes.loginScreen);
    }
    return null;
  }
}
