import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const CustomCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shadowColor: AppColors.myGrey,
          elevation: 10,
          child: ListTile(
            trailing: Icon(
              icon,
              size: 30,
              color: AppColors.myGrey,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.myGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
