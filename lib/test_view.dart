import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/test_controller.dart';
import 'package:matgary/core/class/handling_data_view.dart';
import 'package:matgary/core/constant/app_colors.dart';

class TestBackEndView extends StatelessWidget {
  const TestBackEndView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myBlue,
        title: const Text('test data'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingDataView(
            statuseRequest: controller.statuseRequest,
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (_, index) {
                return Center(child: Text("${controller.data[index]}"));
              },
            ),
          );
        },
      ),
    );
  }
}
