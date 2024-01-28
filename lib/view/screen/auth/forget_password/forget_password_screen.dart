import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';
import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/view/widget/auth/custom_auth_btn_widget.dart';
import 'package:matgary/view/widget/auth/custom_auth_logo_widget.dart';
import 'package:matgary/view/widget/auth/custom_body_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_text_form_auth.dart';

import '../../../../controller/auth/forget_password/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPassworControllerImp controller =
        Get.put(ForgetPassworControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: LocalizationKeys.forgetPassword),
      body: Form(
        //key: controller.formState,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          children: <Widget>[
            //? app logo image
            const SizedBox(height: 50),
            const CustomAuthLogoWidget(),
            const SizedBox(height: 50),
            //? body message
            const CustomBodyTextWidget(
              body: LocalizationKeys.forgetPasswordBody,
            ),
            //? email text form
            CustomTextFomAuthWidget(
              labelText: LocalizationKeys.emailLable,
              hintText: LocalizationKeys.emailHint,
              sufixIcon: Icons.email_outlined,
              myController: controller.email,
            ),

            //? check button and go to vrefiy code screen
            CustomAuthBtnWidget(
              btnText: LocalizationKeys.check,
              btnColor: AppColors.myBlue,
              textColor: AppColors.myWhite,
              myPressed: () {
                controller.goToVrefiyCode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
