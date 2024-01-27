import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';

import '../../../core/constant/app_colors.dart';

class ForgetPasswordTextWidget extends StatelessWidget {
  const ForgetPasswordTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
