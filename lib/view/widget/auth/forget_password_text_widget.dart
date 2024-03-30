import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/localizaion_keys.dart';

import '../../../core/constant/app_colors.dart';

class ForgetPasswordTextWidget extends StatelessWidget {
  final void Function() myTap;
  const ForgetPasswordTextWidget({
    super.key,
    required this.myTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myTap,
      child: Text(
        LocalizationKeys.forgetPassword.tr,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 12,
          color: AppColors.myBlue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
