import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_colors.dart';

class DefualtBtnLoadingWidget extends StatelessWidget {
  final String btnText;
  final Color textColor;
  const DefualtBtnLoadingWidget({
    super.key,
    required this.btnText,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 25),
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.myBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            btnText.tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(width: 10),
          CircularProgressIndicator(
            color: AppColors.myWhite,
          ),
        ],
      ),
    );
  }
}
