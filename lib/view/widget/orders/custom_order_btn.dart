import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomOrderBtnWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  final Color btnColor;
  const CustomOrderBtnWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.myWhite,
              ),
            ),
            const SizedBox(height: 15),
            Icon(
              icon,
              size: 50,
              color: AppColors.myWhite,
            ),
          ],
        ),
      ),
    );
  }
}
