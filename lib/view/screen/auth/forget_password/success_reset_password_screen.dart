import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forget_password/success_reset_pass_controller.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/localizaion_keys.dart';
import '../../../widget/auth/custom_app_bar_widget.dart';
import '../../../../core/shared/custom_app_botton.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPassControllerImp controller =
        Get.put(SuccessResetPassControllerImp());
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: const CustomAppBarWidget(title: 'Congratulations'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.myBlue,
              size: 200,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomAppBotton(
                btnText: LocalizationKeys.signIn,
                btnColor: AppColors.myBlue,
                textColor: AppColors.myWhite,
                myPressed: () {
                  controller.goToLoginScreen();
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
