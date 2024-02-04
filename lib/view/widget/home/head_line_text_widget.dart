import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class HeadLineTextWidget extends StatelessWidget {
  final String text;
  const HeadLineTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.myBlack,
        ),
      ),
    );
  }
}