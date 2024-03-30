import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/on_boarding_controller.dart';

import '../widget/on_boarding/controller_widget.dart';
import '../widget/on_boarding/custom_button_widget.dart';

import '../widget/on_boarding/model_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: OnBoardingModelWidget(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  OnBoardingControllerWidget(),
                  SizedBox(height: 20),
                  OnBoardingCustomButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
