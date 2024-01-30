import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/services/my_services.dart';
import 'package:matgary/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  void nextPage();
  void onPageChanged(int pageIndex);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  @override
  void nextPage() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setBool('login', true);
      //! navigate to login page
      Get.offAllNamed(AppRoutes.loginScreen);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onPageChanged(int pageIndex) {
    currentPage = pageIndex;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
