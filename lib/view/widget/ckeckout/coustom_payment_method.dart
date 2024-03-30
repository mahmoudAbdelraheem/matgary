import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class CustomPaymentMethod extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  const CustomPaymentMethod({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.myBlue.withOpacity(0.6)
              : AppColors.myBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  isSelected ? AppColors.myBlue : AppColors.myWhite,
              radius: 7,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: isSelected ? 18 : 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppColors.myBlack : AppColors.myGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
