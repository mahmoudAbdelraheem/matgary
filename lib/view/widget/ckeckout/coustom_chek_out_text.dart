import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CoustomCheckOutText extends StatelessWidget {
  final String title;
  const CoustomCheckOutText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.myGrey,
            radius: 5,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.myBlack,
            ),
          ),
        ],
      ),
    );
  }
}
