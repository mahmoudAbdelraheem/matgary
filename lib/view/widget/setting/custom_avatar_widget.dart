import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/app_image_assets.dart';

class CustomAvatarWidget extends StatelessWidget {
  const CustomAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.width / 3,
          width: double.infinity,
          color: AppColors.myBlue,
        ),
        Positioned(
          top: Get.width / 5,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.myWhite,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: AppColors.myGrey,
              ),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.myWhite,
              backgroundImage: const AssetImage(AppImageAssets.avatar),
            ),
          ),
        ),
      ],
    );
  }
}
