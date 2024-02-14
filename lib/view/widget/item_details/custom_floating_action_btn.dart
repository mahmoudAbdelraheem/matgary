import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class CustomFloatingActionBtn extends StatelessWidget {
  final void Function()? onTap;
  const CustomFloatingActionBtn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.myBlue,
        textColor: AppColors.myWhite,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onTap,
        child: const Text(
          'Go To Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
