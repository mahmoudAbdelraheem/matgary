import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class HeadLineTextWidget extends StatelessWidget {
  final String title;
  const HeadLineTextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.myBlack,
        ),
      ),
    );
  }
}
