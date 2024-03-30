import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

class CustomAppAppBar extends StatelessWidget {
  final String title;
  const CustomAppAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.myBlue,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.myWhite,
          height: 2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
