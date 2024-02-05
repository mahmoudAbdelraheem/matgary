import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/view/screen/home_screen.dart';

abstract class HomeController extends GetxController {
  changePage(int index);
}

class HomeControllerImp extends HomeController {
  //? current page index
  int pageIndex = 0;

  //? nav bar botton and title
  final List navBarData = [
    {
      'title': "Home",
      'icon': Icons.home,
    },
    {
      'title': "Favorite",
      'icon': Icons.favorite,
    },
    {
      'title': "Setting",
      'icon': Icons.settings,
    },
    {
      'title': "Profile",
      'icon': Icons.person,
    },
  ];
  //? list for button bar screen
  List<Widget> pageList = [
    const HomeScreen(),
    const Center(
      child: Text('favorite'),
    ),
    const Center(
      child: Text('Setting'),
    ),
    const Center(
      child: Text('profile'),
    ),
  ];

  @override
  changePage(int index) {
    pageIndex = index;
    update();
  }
}
