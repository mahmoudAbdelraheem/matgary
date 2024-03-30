import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class CustomDeliveryType extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  const CustomDeliveryType({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        padding: const EdgeInsets.symmetric(vertical: 15),
        height: isSelected ? 180 : 160,
        width: isSelected ? 150 : 130,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.myBlue.withOpacity(0.6)
              : AppColors.myBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: isSelected ? 100 : 70,
              height: isSelected ? 100 : 70,
              color: isSelected ? AppColors.myBlack : AppColors.myGrey,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 7,
                  backgroundColor:
                      isSelected ? AppColors.myBlue : AppColors.myWhite,
                ),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? AppColors.myBlack : AppColors.myGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: isSelected ? 18 : 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
