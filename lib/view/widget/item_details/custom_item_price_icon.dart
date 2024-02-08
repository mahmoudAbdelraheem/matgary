import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomItemPriceIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const CustomItemPriceIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.myBlue,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: AppColors.myWhite,
        ),
      ),
    );
  }
}
