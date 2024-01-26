import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/controller/on_boarding_controller.dart';

import '../../../core/constant/app_colors.dart';
import '../../../data/datasource/static/static.dart';

class OnBoardingControllerWidget extends StatelessWidget {
  const OnBoardingControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...List.generate(onBoardingList.length, (index) {
            return AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 700),
              height: 6,
              width: controller.currentPage == index ? 20 : 6,
              decoration: BoxDecoration(
                color: AppColors.myBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ],
      ),
    );
  }
}
