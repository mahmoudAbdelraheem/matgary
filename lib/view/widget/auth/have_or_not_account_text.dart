import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_colors.dart';

class HaveOrNotHaveAccountText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function() myTap;
  const HaveOrNotHaveAccountText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.myTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText.tr),
        InkWell(
          //? navigate to sign up screen
          onTap: myTap,
          child: Text(
            secondText.tr,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.myBlue,
            ),
          ),
        ),
      ],
    );
  }
}
