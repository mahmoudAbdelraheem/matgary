import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/widget/home/custom_buttom_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        //? floating action button
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.myBlue,
          child: const Icon(Icons.card_travel),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //? custom buttom navegation bar
        bottomNavigationBar: const CustomButtomNavBar(),
        //? selected page
        body: controller.pageList.elementAt(controller.pageIndex),
      ),
    );
  }
}
