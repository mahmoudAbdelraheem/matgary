import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/view/screen/home_screen.dart';
import 'package:matgary/view/screen/setting_screen.dart';

abstract class HomeController extends GetxController {
  changePage(int index);
  //? go to cart screen
  goToCart();
}

class HomeControllerImp extends HomeController {
  //? current page index
  int pageIndex = 0;

  //? nav bar botton and title
  final List navBarData = [
    {
      'title': "Home",
      'icon': Icons.home_outlined,
    },
    {
      'title': "Notification",
      'icon': Icons.notifications_on_outlined,
    },
    {
      'title': "Profile",
      'icon': Icons.person_2_outlined,
    },
    {
      'title': "Setting",
      'icon': Icons.settings_outlined,
    },
  ];
  //? list for button bar screen
  List<Widget> pageList = [
    const HomeScreen(),
    const Center(
      child: Text('Notifivcation'),
    ),
    const Center(
      child: Text('Profile'),
    ),
    const SettingScreen(),
  ];

  @override
  changePage(int index) {
    pageIndex = index;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoutes.cartScreen);
  }
}
