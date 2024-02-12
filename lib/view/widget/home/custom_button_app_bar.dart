import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String title;
  final bool isActive;
  const CustomButtonAppBar({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 35,
            color: isActive == true ? AppColors.myWhite : AppColors.myGrey,
          ),
          // Text(
          //   title,
          //   style: TextStyle(
          //     color: isActive == true
          //         ? AppColors.myWhite
          //         : AppColors.myBlack.withOpacity(0.7),
          //   ),
          // ),
        ],
      ),
    );
  }
}
