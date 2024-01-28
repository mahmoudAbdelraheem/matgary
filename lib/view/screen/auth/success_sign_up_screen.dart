import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/view/widget/auth/custom_auth_btn_widget.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Congratulations'),
      body: Column(
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
            child: CustomAuthBtnWidget(
              btnText: 'Login Now',
              btnColor: AppColors.myBlue,
              textColor: AppColors.myWhite,
              myPressed: () {},
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
