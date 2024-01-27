import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

import 'package:matgary/core/constant/app_image_assets.dart';

class CustomAuthLogoWidget extends StatelessWidget {
  const CustomAuthLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.myBlue,
        child: Image.asset(
          AppImageAssets.logo,
          height: 70,
          width: 70,
        ),
      ),
    );
  }
}
