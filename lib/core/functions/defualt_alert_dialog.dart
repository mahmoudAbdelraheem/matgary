import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_colors.dart';

defualtAlertDialog(String title, String midText) {
  Get.defaultDialog(
    title: title,
    middleText: midText,
    actions: [
      MaterialButton(
        onPressed: () {
          Get.back();
        },
        color: AppColors.myBlue,
        child: Text(
          'Ok',
          style: TextStyle(color: AppColors.myWhite),
        ),
      ),
    ],
  );
}
