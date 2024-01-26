import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/routes.dart';
import 'package:matgary/core/localization/change_local.dart';

import '../../../core/constant/app_colors.dart';

class LanguageCustomButtonWidget extends GetView<LocaleController> {
  final String buttonText;

  const LanguageCustomButtonWidget({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.myBlue,
      ),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        onPressed: () {
          if (buttonText == 'Arabic') {
            controller.changeLanguage('ar');
          } else if (buttonText == 'English') {
            controller.changeLanguage('en');
          }
          Get.offAllNamed(AppRoutes.onBoardingScreen);
        },
        textColor: Colors.white,
        child: Text(
          buttonText.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
