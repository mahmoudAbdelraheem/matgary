import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_colors.dart';

class CustomBodyTextWidget extends StatelessWidget {
  final String body, email;
  const CustomBodyTextWidget({super.key, required this.body, this.email = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, top: 10),
      child: Text(
        "${body.tr}$email",
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
