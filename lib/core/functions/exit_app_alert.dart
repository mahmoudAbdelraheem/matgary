import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_colors.dart';

exitAppAlert() {
  Get.defaultDialog(
    title: 'Warring',
    middleText: 'do you wont to exit from app?',
    actions: [
      MaterialButton(
        onPressed: () {
          exit(0); //? exit from app
        },
        color: AppColors.myBlue,
        child: Text(
          'Yes',
          style: TextStyle(color: AppColors.myWhite),
        ),
      ),
      MaterialButton(
        onPressed: () {
          Get.back();
        },
        color: AppColors.myRed,
        child: Text(
          'No',
          style: TextStyle(color: AppColors.myWhite),
        ),
      ),
    ],
  );
}
