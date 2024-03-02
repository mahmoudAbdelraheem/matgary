import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomShippingAddress extends StatelessWidget {
  final String addressName;
  final String addressCity;
  final bool isSelected;
  final void Function()? onTap;
  const CustomShippingAddress({
    super.key,
    required this.addressName,
    required this.addressCity,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.myBlue.withOpacity(0.6)
              : AppColors.myBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          leading: CircleAvatar(
            radius: 15,
            backgroundColor: isSelected ? AppColors.myBlue : AppColors.myWhite,
          ),
          title: Text(
            addressName,
            style: TextStyle(
              fontSize: isSelected ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.myBlack : AppColors.myGrey,
              height: 1,
            ),
          ),
          subtitle: Text(
            addressCity,
            style: TextStyle(
              fontSize: isSelected ? 14 : 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.myBlack : AppColors.myGrey,
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
