import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('home app screen'),
      ),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => Center(
          child: Text('welcom ${controller.name!} '),
        ),
      ),
    );
  }
}
