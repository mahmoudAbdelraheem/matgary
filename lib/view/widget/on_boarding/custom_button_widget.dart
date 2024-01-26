import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';

import '../../../controller/on_boarding_controller.dart';
import '../../../core/constant/app_colors.dart';

class OnBoardingCustomButtonWidget extends GetView<OnBoardingControllerImp> {
  const OnBoardingCustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.myBlue,
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        onPressed: () {
          controller.nextPage();
        },
        textColor: Colors.white,
        child: Text(
          LocalizationKeys.continueBtn.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
