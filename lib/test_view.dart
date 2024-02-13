import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/test_controller.dart';
import 'package:matgary/core/constant/app_colors.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myBlue,
        title: const Text('test data'),
      ),
      body: const Center(child: Text('Page body')),

      //? location
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //? animated container
      //floatingActionButton: CartFloatingActionBtnWidget(),
    );
  }
}
