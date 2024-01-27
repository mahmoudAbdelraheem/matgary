import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomBodyTextWidget extends StatelessWidget {
  final String body;
  const CustomBodyTextWidget({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, top: 10),
      child: Text(
        body.tr,
        style: TextStyle(
          fontSize: 18,
          color: AppColors.myGrey,
          height: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
