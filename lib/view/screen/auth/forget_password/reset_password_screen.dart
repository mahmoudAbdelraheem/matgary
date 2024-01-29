import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/localizaion_keys.dart';
import 'package:matgary/core/functions/form_valid_input.dart';

import 'package:matgary/view/widget/auth/custom_app_bar_widget.dart';
import 'package:matgary/view/widget/auth/custom_auth_btn_widget.dart';
import 'package:matgary/view/widget/auth/custom_auth_logo_widget.dart';
import 'package:matgary/view/widget/auth/custom_body_text_widget.dart';
import 'package:matgary/view/widget/auth/custom_text_form_auth.dart';

import '../../../../controller/auth/forget_password/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(title: 'Reset Password'),
      //?

      body: GetBuilder<ResetPassworControllerImp>(
        builder: (controller) => Form(
          key: controller.resetPassFormState,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
            children: <Widget>[
              //? app logo image
              const SizedBox(height: 50),
              const CustomAuthLogoWidget(),
              const SizedBox(height: 50),
              //? body message
              const CustomBodyTextWidget(
                body: 'Enter New Password',
              ),
              //? password text form
              const SizedBox(height: 20),
              GetBuilder<ResetPassworControllerImp>(
                builder: (controller) => CustomTextFomAuthWidget(
                  myValidator: (val) {
                    return formVaildInput(
                        value: val!, type: 'password', min: 6, max: 30);
                  },
                  myKeyboardType: TextInputType.visiblePassword,
                  labelText: LocalizationKeys.passLable,
                  hintText: LocalizationKeys.passHint,
                  sufixIcon: controller.isPasswordShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  myController: controller.password,
                  isPassword: controller.isPasswordShow,
                  showPassword: () {
                    controller.showPassword();
                  },
                ),
              ),
              //? password text form
              const SizedBox(height: 20),
              GetBuilder<ResetPassworControllerImp>(
                builder: (controller) => CustomTextFomAuthWidget(
                  myValidator: (val) {
                    return formVaildInput(
                        value: val!, type: 'password', min: 6, max: 30);
                  },
                  myKeyboardType: TextInputType.visiblePassword,
                  labelText: LocalizationKeys.passLable,
                  hintText: 'Re-Enter Your Password',
                  sufixIcon: controller.isRePasswordShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  myController: controller.rePassword,
                  isPassword: controller.isRePasswordShow,
                  showPassword: () {
                    controller.showRePassword();
                  },
                ),
              ),

              //? reset new password
              CustomAuthBtnWidget(
                btnText: 'Save',
                btnColor: AppColors.myBlue,
                textColor: AppColors.myWhite,
                myPressed: () {
                  controller.checkPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
